%%%ʵʱ�ɵ���Ǳ������(���ýṹ�屣��)%%%
%%%���15����%%%
%%%���յ綯������վʱ��˳�򣬹�������%%%
clear
clc
load('data_EV.mat')
%���վ1
RT_CS1.EV=[data_CS1(1001).Ta;data_CS1(1001).Tl;data_CS1(1001).S0]';
RT_CS1.EV=sortrows(RT_CS1.EV,1);%���ս�վʱ���Ⱥ�˳������
for t=1:97%��ʱ�����ɵ���Ǳ��
    temp1=RT_CS1(1).EV(find(RT_CS1(1).EV(:,1)<=t),:);
    RT_CS1(t).EVset=[temp1];%�õ��綯��������
    [temp2,temp3]=size(RT_CS1(t).EVset);%���󳤶ȣ�Ŀ���ǵõ��綯������������temp2������
    RT_CS1(t).X=zeros(temp2,97);%ͣ��״̬����
    for j=1:temp2
        RT_CS1(t).X(j,RT_CS1(t).EVset(j,1):RT_CS1(t).EVset(j,2))=1;
    end
    RT_CS1(t).EVset=RT_CS1(t).EVset';
    if temp2~=1%ֻ��һ���������Ҫ�������ۣ�����ʹ��sum
        RT_CS1(t).Pch=6.6*sum(RT_CS1(t).X);
        RT_CS1(t).Pdis=6.6*sum(RT_CS1(t).X);
        RT_CS1(t).Smin=32*0.15*sum(RT_CS1(t).X);%���崢�ܵ���С����
        RT_CS1(t).Smax=32*0.9*sum(RT_CS1(t).X);%���崢�ܵ��������
        RT_CS1(t).dS=zeros(1,97);%���崢�ܵ������仯��
        RT_CS1(t).dS(1)=RT_CS1(t).EVset(3,:)*RT_CS1(t).X(:,1);
        RT_CS1(t).dS(2:97)=RT_CS1(t).EVset(3,:)*(RT_CS1(t).X(:,2:97).*(RT_CS1(t).X(:,2:97)-RT_CS1(t).X(:,1:96)))-32*0.9*sum(RT_CS1(t).X(:,1:96).*(RT_CS1(t).X(:,1:96)-RT_CS1(t).X(:,2:97)));
    else
        RT_CS1(t).Pch=6.6*RT_CS1(t).X;
        RT_CS1(t).Pdis=6.6*RT_CS1(t).X;
        RT_CS1(t).Smin=32*0.15*(RT_CS1(t).X);%���崢�ܵ���С����
        RT_CS1(t).Smax=32*0.9*(RT_CS1(t).X);%���崢�ܵ��������
        RT_CS1(t).dS=zeros(1,97);%���崢�ܵ������仯��
        RT_CS1(t).dS(1)=RT_CS1(t).EVset(3,:)*RT_CS1(t).X(:,1);
        RT_CS1(t).dS(2:97)=RT_CS1(t).EVset(3,:)*(RT_CS1(t).X(:,2:97).*(RT_CS1(t).X(:,2:97)-RT_CS1(t).X(:,1:96)))-32*0.9*(RT_CS1(t).X(:,1:96).*(RT_CS1(t).X(:,1:96)-RT_CS1(t).X(:,2:97)));
    end
end
%���վ2
RT_CS2.EV=[data_CS2(1001).Ta;data_CS2(1001).Tl;data_CS2(1001).S0]';
RT_CS2.EV=sortrows(RT_CS2.EV,1);%���ս�վʱ���Ⱥ�˳������
for t=1:97%��ʱ�����ɵ���Ǳ��
    temp1=RT_CS2(1).EV(find(RT_CS2(1).EV(:,1)<=t),:);
    RT_CS2(t).EVset=[temp1];%�õ��綯��������
    [temp2,temp3]=size(RT_CS2(t).EVset);%���󳤶ȣ�Ŀ���ǵõ��綯������������temp2������
    RT_CS2(t).X=zeros(temp2,97);%ͣ��״̬����
    for j=1:temp2
        RT_CS2(t).X(j,RT_CS2(t).EVset(j,1):RT_CS2(t).EVset(j,2))=1;
    end
    RT_CS2(t).EVset=RT_CS2(t).EVset';
    if temp2~=1%ֻ��һ���������Ҫ�������ۣ�����ʹ��sum
        RT_CS2(t).Pch=6.6*sum(RT_CS2(t).X);
        RT_CS2(t).Pdis=6.6*sum(RT_CS2(t).X);
        RT_CS2(t).Smin=32*0.15*sum(RT_CS2(t).X);%���崢�ܵ���С����
        RT_CS2(t).Smax=32*0.9*sum(RT_CS2(t).X);%���崢�ܵ��������
        RT_CS2(t).dS=zeros(1,97);%���崢�ܵ������仯��
        RT_CS2(t).dS(1)=RT_CS2(t).EVset(3,:)*RT_CS2(t).X(:,1);
        RT_CS2(t).dS(2:97)=RT_CS2(t).EVset(3,:)*(RT_CS2(t).X(:,2:97).*(RT_CS2(t).X(:,2:97)-RT_CS2(t).X(:,1:96)))-32*0.9*sum(RT_CS2(t).X(:,1:96).*(RT_CS2(t).X(:,1:96)-RT_CS2(t).X(:,2:97)));
    else
        RT_CS2(t).Pch=6.6*RT_CS2(t).X;
        RT_CS2(t).Pdis=6.6*RT_CS2(t).X;
        RT_CS2(t).Smin=32*0.15*(RT_CS2(t).X);%���崢�ܵ���С����
        RT_CS2(t).Smax=32*0.9*(RT_CS2(t).X);%���崢�ܵ��������
        RT_CS2(t).dS=zeros(1,97);%���崢�ܵ������仯��
        RT_CS2(t).dS(1)=RT_CS2(t).EVset(3,:)*RT_CS2(t).X(:,1);
        RT_CS2(t).dS(2:97)=RT_CS2(t).EVset(3,:)*(RT_CS2(t).X(:,2:97).*(RT_CS2(t).X(:,2:97)-RT_CS2(t).X(:,1:96)))-32*0.9*(RT_CS2(t).X(:,1:96).*(RT_CS2(t).X(:,1:96)-RT_CS2(t).X(:,2:97)));
    end
end
%���վ3
RT_CS3.EV=[data_CS3(1001).Ta;data_CS3(1001).Tl;data_CS3(1001).S0]';
RT_CS3.EV=sortrows(RT_CS3.EV,1);%���ս�վʱ���Ⱥ�˳������
for t=1:97%��ʱ�����ɵ���Ǳ��
    temp1=RT_CS3(1).EV(find(RT_CS3(1).EV(:,1)<=t),:);
    RT_CS3(t).EVset=[temp1];%�õ��綯��������
    [temp2,temp3]=size(RT_CS3(t).EVset);%���󳤶ȣ�Ŀ���ǵõ��綯������������temp2������
    RT_CS3(t).X=zeros(temp2,97);%ͣ��״̬����
    for j=1:temp2
        RT_CS3(t).X(j,RT_CS3(t).EVset(j,1):RT_CS3(t).EVset(j,2))=1;
    end
    RT_CS3(t).EVset=RT_CS3(t).EVset';
    if temp2~=1%ֻ��һ���������Ҫ�������ۣ�����ʹ��sum
        RT_CS3(t).Pch=6.6*sum(RT_CS3(t).X);
        RT_CS3(t).Pdis=6.6*sum(RT_CS3(t).X);
        RT_CS3(t).Smin=32*0.15*sum(RT_CS3(t).X);%���崢�ܵ���С����
        RT_CS3(t).Smax=32*0.9*sum(RT_CS3(t).X);%���崢�ܵ��������
        RT_CS3(t).dS=zeros(1,97);%���崢�ܵ������仯��
        RT_CS3(t).dS(1)=RT_CS3(t).EVset(3,:)*RT_CS3(t).X(:,1);
        RT_CS3(t).dS(2:97)=RT_CS3(t).EVset(3,:)*(RT_CS3(t).X(:,2:97).*(RT_CS3(t).X(:,2:97)-RT_CS3(t).X(:,1:96)))-32*0.9*sum(RT_CS3(t).X(:,1:96).*(RT_CS3(t).X(:,1:96)-RT_CS3(t).X(:,2:97)));
    else
        RT_CS3(t).Pch=6.6*RT_CS3(t).X;
        RT_CS3(t).Pdis=6.6*RT_CS3(t).X;
        RT_CS3(t).Smin=32*0.15*(RT_CS3(t).X);%���崢�ܵ���С����
        RT_CS3(t).Smax=32*0.9*(RT_CS3(t).X);%���崢�ܵ��������
        RT_CS3(t).dS=zeros(1,97);%���崢�ܵ������仯��
        RT_CS3(t).dS(1)=RT_CS3(t).EVset(3,:)*RT_CS3(t).X(:,1);
        RT_CS3(t).dS(2:97)=RT_CS3(t).EVset(3,:)*(RT_CS3(t).X(:,2:97).*(RT_CS3(t).X(:,2:97)-RT_CS3(t).X(:,1:96)))-32*0.9*(RT_CS3(t).X(:,1:96).*(RT_CS3(t).X(:,1:96)-RT_CS3(t).X(:,2:97)));
    end
end
%���վ4
RT_CS4.EV=[data_CS4(1001).Ta;data_CS4(1001).Tl;data_CS4(1001).S0]';
RT_CS4.EV=sortrows(RT_CS4.EV,1);%���ս�վʱ���Ⱥ�˳������
for t=1:97%��ʱ�����ɵ���Ǳ��
    temp1=RT_CS4(1).EV(find(RT_CS4(1).EV(:,1)<=t),:);
    RT_CS4(t).EVset=[temp1];%�õ��綯��������
    [temp2,temp3]=size(RT_CS4(t).EVset);%���󳤶ȣ�Ŀ���ǵõ��綯������������temp2������
    RT_CS4(t).X=zeros(temp2,97);%ͣ��״̬����
    for j=1:temp2
        RT_CS4(t).X(j,RT_CS4(t).EVset(j,1):RT_CS4(t).EVset(j,2))=1;
    end
    RT_CS4(t).EVset=RT_CS4(t).EVset';
    if temp2~=1%ֻ��һ���������Ҫ�������ۣ�����ʹ��sum
        RT_CS4(t).Pch=6.6*sum(RT_CS4(t).X);
        RT_CS4(t).Pdis=6.6*sum(RT_CS4(t).X);
        RT_CS4(t).Smin=32*0.15*sum(RT_CS4(t).X);%���崢�ܵ���С����
        RT_CS4(t).Smax=32*0.9*sum(RT_CS4(t).X);%���崢�ܵ��������
        RT_CS4(t).dS=zeros(1,97);%���崢�ܵ������仯��
        RT_CS4(t).dS(1)=RT_CS4(t).EVset(3,:)*RT_CS4(t).X(:,1);
        RT_CS4(t).dS(2:97)=RT_CS4(t).EVset(3,:)*(RT_CS4(t).X(:,2:97).*(RT_CS4(t).X(:,2:97)-RT_CS4(t).X(:,1:96)))-32*0.9*sum(RT_CS4(t).X(:,1:96).*(RT_CS4(t).X(:,1:96)-RT_CS4(t).X(:,2:97)));
    else
        RT_CS4(t).Pch=6.6*RT_CS4(t).X;
        RT_CS4(t).Pdis=6.6*RT_CS4(t).X;
        RT_CS4(t).Smin=32*0.15*(RT_CS4(t).X);%���崢�ܵ���С����
        RT_CS4(t).Smax=32*0.9*(RT_CS4(t).X);%���崢�ܵ��������
        RT_CS4(t).dS=zeros(1,97);%���崢�ܵ������仯��
        RT_CS4(t).dS(1)=RT_CS4(t).EVset(3,:)*RT_CS4(t).X(:,1);
        RT_CS4(t).dS(2:97)=RT_CS4(t).EVset(3,:)*(RT_CS4(t).X(:,2:97).*(RT_CS4(t).X(:,2:97)-RT_CS4(t).X(:,1:96)))-32*0.9*(RT_CS4(t).X(:,1:96).*(RT_CS4(t).X(:,1:96)-RT_CS4(t).X(:,2:97)));
    end
end
%��ͼ���Գ��վ3Ϊ��
load data_potential_DA
figure(3)%��24��15����
hold on
plot(RT_CS3(24).Pch,'b')%��繦�ʱ߽�
plot(-RT_CS3(24).Pdis,'g')%�ŵ繦�ʱ߽�
legend('��繦���Ͻ�','�ŵ繦���Ͻ�')
xlabel ʱ��
ylabel ����(kW)
figure(4);
hold on
plot(RT_CS3(24).Smax,'b')%SOC�Ͻ�
plot(RT_CS3(24).Smin,'g')%SOC�½�
legend('SOC�Ͻ�','SOC�½�')
xlabel ʱ��
ylabel ����(kWh)
figure(5)%����ǰ�Ա�
hold on
plot(Forecast_CS3(1,:),'b')%��繦�ʱ߽�
plot(-Forecast_CS3(2,:),'g')%�ŵ繦�ʱ߽�
plot(RT_CS3(97).Pch,'b.-')%��繦�ʱ߽�
plot(-RT_CS3(97).Pdis,'g.-')%�ŵ繦�ʱ߽�
legend('��ǰ��繦���Ͻ�','��ǰ�ŵ繦���Ͻ�','ʵʱ��繦���Ͻ�','ʵʱ�ŵ繦���Ͻ�')
xlabel ʱ��
ylabel ����(kW)
figure(6);
hold on
plot(Forecast_CS3(4,:),'b')%SOC�Ͻ�
plot(Forecast_CS3(3,:),'g')%SOC�½�
plot(RT_CS3(97).Smin,'b.-')%SOC�Ͻ�
plot(RT_CS3(97).Smax,'g.-')%SOC�½�
legend('��ǰSOC�Ͻ�','��ǰSOC�½�')
xlabel ʱ��
ylabel ����(kWh)
save('data_potential_RT','RT_CS1','RT_CS2','RT_CS3','RT_CS4');%ʵʱ�ɵ���Ǳ��