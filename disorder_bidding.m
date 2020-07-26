%%%������Ͷ��
clear
clc
load data_disorder
Pch=[Pch_CS1_disorder;Pch_CS2_disorder;Pch_CS3_disorder;Pch_CS4_disorder];%���վ��繦��
%�г���������
Link=zeros(24,96);%ʱ�λ������(��ǰ1h����Ϊʵʱ15min)
for i=1:24
    Link(i,4*i-3:4*i)=1;
end
Loadcurve=[0.955391944564747,0.978345604157644,1,0.995019488956258,0.972932005197055,0.970333477695972,0.930489389346037,0.890428757037679,0.902771762667822,0.941966219142486,0.911000433087917,0.862061498484192,0.840190558683413,0.831095712429623,0.756604590731919,0.671719359029883,0.611520138588133,0.582936336076224,0.572542226071893,0.574707665656128,0.587267215244695,0.644218276310091,0.755521870939801,0.884798614118666];
Loadcurve=Loadcurve*Link;%����96��ʱ��
PL_base=[5.704;5.705;5.631;6.518;4.890;5.705;5.847]*1000;%���ɷֲ�
PL=PL_base*Loadcurve;%��������(�������ߴ�08:00��ʼ���𣬼���9��ʱ��)
Pf=sdpvar(7,96);%���߹���
Pf(1,:)=PL(1,:)+Pch(1,:);Pf(2,:)=PL(2,:);Pf(3,:)=PL(3,:);Pf(4,:)=PL(4,:)+Pch(2,:);Pf(5,:)=PL(5,:)+Pch(3,:);Pf(6,:)=PL(6,:);Pf(7,:)=PL(7,:)+Pch(4,:);%���߹������
Pg=sdpvar(10,96);%�����̷ֶε���
Pg_step=1000*[20,5,3,2,2,2,2,2,2,inf]';%��������
Price_DSO=[3:12]'*0.1;%�ֶε��
Obj=0.25*sum(sum((Price_DSO*ones(1,96)).*Pg));%Ŀ��Ϊ�õ������С
Constraint=[0<=Pg<=Pg_step*ones(1,96),sum(Pg)==sum(Pf)];%Լ������
solvesdp(Constraint,Obj);%������Թ滮����
Pg=double(Pg);%���������
Pf=double(Pf);%���߹���
isPg=(Pg>0);%Ϊ�˼�������ۣ����㷢����ֶ�ѡ�����
DLMP=sum(isPg)/10+0.2;%�����ۼ���
%��ͼ
figure(1)%�ڵ�߼ʵ��
stairs(DLMP);
xlabel ʱ��
ylabel ���(Ԫ/kWh)
ylim([0.3,1.3])
figure(2)%��������
hold on
plot(sum(PL)/1000);
plot(sum(Pf)/1000,'r.-');
xlabel ʱ��
ylabel ����(MW)
legend('��������','�����縺��')
Cost=sum(sum(Pch).*DLMP);%���õ����
result_disorder.Cost=Cost;result_disorder.DLMP=DLMP;result_disorder.Pf=Pf;result_disorder.Pg=Pg;%�������
save('result_disorder','result_disorder');
