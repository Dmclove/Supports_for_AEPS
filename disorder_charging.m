%%%��ǰ�����繦��(���ȳ��ԭ��)%%%
clear
clc
load data_potential_DA
%���վ1
Pch_CS1_disorder=sdpvar(1,97);%���
Pdis_CS1_disorder=zeros(1,97);%�ŵ�
S_CS1_disorder=sdpvar(1,97);%SOC
f_CS1_disorder=Pch_CS1_disorder*[1:97]';%���ȳ��ԭ��Ŀ�꺯��
C_CS1_disorder=[0<=Pch_CS1_disorder<=Forecast_CS1(1,:),
    Forecast_CS1(3,:)<=S_CS1_disorder<=Forecast_CS1(4,:),
    S_CS1_disorder(1)==0.25*0.95*Pch_CS1_disorder(1)+Forecast_CS1(5,1),
    S_CS1_disorder(2:97)==S_CS1_disorder(1:96)+0.25*0.95*Pch_CS1_disorder(2:97)+Forecast_CS1(5,2:97)];%Լ������
solvesdp(C_CS1_disorder,f_CS1_disorder);
Pch_CS1_disorder=double(Pch_CS1_disorder);
S_CS1_disorder=double(S_CS1_disorder);
%���վ2
Pch_CS2_disorder=sdpvar(1,97);%���
Pdis_CS2_disorder=zeros(1,97);%�ŵ�
S_CS2_disorder=sdpvar(1,97);%SOC
f_CS2_disorder=Pch_CS2_disorder*[1:97]';%���ȳ��ԭ��Ŀ�꺯��
C_CS2_disorder=[0<=Pch_CS2_disorder<=Forecast_CS2(1,:),
    Forecast_CS2(3,:)<=S_CS2_disorder<=Forecast_CS2(4,:),
    S_CS2_disorder(1)==0.25*0.95*Pch_CS2_disorder(1)+Forecast_CS2(5,1),
    S_CS2_disorder(2:97)==S_CS2_disorder(1:96)+0.25*0.95*Pch_CS2_disorder(2:97)+Forecast_CS2(5,2:97)];%Լ������
solvesdp(C_CS2_disorder,f_CS2_disorder);
Pch_CS2_disorder=double(Pch_CS2_disorder);
S_CS2_disorder=double(S_CS2_disorder);
%���վ3
Pch_CS3_disorder=sdpvar(1,97);%���
Pdis_CS3_disorder=zeros(1,97);%�ŵ�
S_CS3_disorder=sdpvar(1,97);%SOC
f_CS3_disorder=Pch_CS3_disorder*[1:97]';%���ȳ��ԭ��Ŀ�꺯��
C_CS3_disorder=[0<=Pch_CS3_disorder<=Forecast_CS3(1,:),
    Forecast_CS3(3,:)<=S_CS3_disorder<=Forecast_CS3(4,:),
    S_CS3_disorder(1)==0.25*0.95*Pch_CS3_disorder(1)+Forecast_CS3(5,1),
    S_CS3_disorder(2:97)==S_CS3_disorder(1:96)+0.25*0.95*Pch_CS3_disorder(2:97)+Forecast_CS3(5,2:97)];%Լ������
solvesdp(C_CS3_disorder,f_CS3_disorder);
Pch_CS3_disorder=double(Pch_CS3_disorder);
S_CS3_disorder=double(S_CS3_disorder);
%���վ4
Pch_CS4_disorder=sdpvar(1,97);%���
Pdis_CS4_disorder=zeros(1,97);%�ŵ�
S_CS4_disorder=sdpvar(1,97);%SOC
f_CS4_disorder=Pch_CS4_disorder*[1:97]';%���ȳ��ԭ��Ŀ�꺯��
C_CS4_disorder=[0<=Pch_CS4_disorder<=Forecast_CS4(1,:),
    Forecast_CS4(3,:)<=S_CS4_disorder<=Forecast_CS4(4,:),
    S_CS4_disorder(1)==0.25*0.95*Pch_CS4_disorder(1)+Forecast_CS4(5,1),
    S_CS4_disorder(2:97)==S_CS4_disorder(1:96)+0.25*0.95*Pch_CS4_disorder(2:97)+Forecast_CS4(5,2:97)];%Լ������
solvesdp(C_CS4_disorder,f_CS4_disorder);
Pch_CS4_disorder=double(Pch_CS4_disorder);
S_CS4_disorder=double(S_CS4_disorder);
%��ͼ���Գ��վ3Ϊ��
figure(1);
hold on
plot(Forecast_CS3(1,:),'b')%��繦�ʱ߽�
plot(-Forecast_CS3(2,:),'g')%�ŵ繦�ʱ߽�
plot(Pch_CS3_disorder,'r.-')
legend('��繦���Ͻ�','�ŵ繦���Ͻ�','ʵ�ʳ�ŵ繦��')
xlabel ʱ��
ylabel ����(kW)
figure(2);
hold on
plot(Forecast_CS3(4,:),'g')%SOC�Ͻ�
plot(Forecast_CS3(3,:),'b')%SOC�½�
plot(S_CS3_disorder,'r.-')
legend('SOC�Ͻ�','SOC�½�','ʵ��SOC')
xlabel ʱ��
ylabel ����(kWh)
%ѡȡǰ96������
Pch_CS1_disorder=Pch_CS1_disorder(1:96);Pch_CS2_disorder=Pch_CS2_disorder(1:96);Pch_CS3_disorder=Pch_CS3_disorder(1:96);Pch_CS4_disorder=Pch_CS4_disorder(1:96);
save('data_disorder','Pch_CS1_disorder','Pch_CS2_disorder','Pch_CS3_disorder','Pch_CS4_disorder');%����������
