%%%��ʷ�ɵ���Ǳ������%%%
%%%������ʷͣ�����������綯�����ɵ���Ǳ��%%%
clear
clc
load data_EV
for i=1:1000
    %���վ1
    data_CS1(i).X=zeros(length(data_CS1(i).S0),97);%����ͣ��״̬����
    for j=1:length(data_CS1(i).S0)
        data_CS1(i).X(j,data_CS1(i).Ta(j):data_CS1(i).Tl(j))=1;
    end
    data_CS1(i).Pch=6.6*sum(data_CS1(i).X);%���崢�ܵĳ�繦��
    data_CS1(i).Pdis=6.6*sum(data_CS1(i).X);%���崢�ܵķŵ繦��
    data_CS1(i).Smin=32*0.15*sum(data_CS1(i).X);%���崢�ܵ���С����
    data_CS1(i).Smax=32*0.9*sum(data_CS1(i).X);%���崢�ܵ��������
    data_CS1(i).dS=zeros(1,97);%���崢�ܵ������仯��
    data_CS1(i).dS(1,1)=data_CS1(i).S0*data_CS1(i).X(:,1);
    data_CS1(i).dS(1,2:97)=data_CS1(i).S0*(data_CS1(i).X(:,2:97).*(data_CS1(i).X(:,2:97)-data_CS1(i).X(:,1:96)))-32*0.9*sum(data_CS1(i).X(:,1:96).*(data_CS1(i).X(:,1:96)-data_CS1(i).X(:,2:97)));
    %���վ2
    data_CS2(i).X=zeros(length(data_CS2(i).S0),97);%����ͣ��״̬����
    for j=1:length(data_CS2(i).S0)
        data_CS2(i).X(j,data_CS2(i).Ta(j):data_CS2(i).Tl(j))=1;
    end
    data_CS2(i).Pch=6.6*sum(data_CS2(i).X);%���崢�ܵĳ�繦��
    data_CS2(i).Pdis=6.6*sum(data_CS2(i).X);%���崢�ܵķŵ繦��
    data_CS2(i).Smin=32*0.15*sum(data_CS2(i).X);%���崢�ܵ���С����
    data_CS2(i).Smax=32*0.9*sum(data_CS2(i).X);%���崢�ܵ��������
    data_CS2(i).dS=zeros(1,97);%���崢�ܵ������仯��
    data_CS2(i).dS(1,1)=data_CS2(i).S0*data_CS2(i).X(:,1);
    data_CS2(i).dS(1,2:97)=data_CS2(i).S0*(data_CS2(i).X(:,2:97).*(data_CS2(i).X(:,2:97)-data_CS2(i).X(:,1:96)))-32*0.9*sum(data_CS2(i).X(:,1:96).*(data_CS2(i).X(:,1:96)-data_CS2(i).X(:,2:97)));
    %���վ3
    data_CS3(i).X=zeros(length(data_CS3(i).S0),97);%����ͣ��״̬����
    for j=1:length(data_CS3(i).S0)
        data_CS3(i).X(j,data_CS3(i).Ta(j):data_CS3(i).Tl(j))=1;
    end
    data_CS3(i).Pch=6.6*sum(data_CS3(i).X);%���崢�ܵĳ�繦��
    data_CS3(i).Pdis=6.6*sum(data_CS3(i).X);%���崢�ܵķŵ繦��
    data_CS3(i).Smin=32*0.15*sum(data_CS3(i).X);%���崢�ܵ���С����
    data_CS3(i).Smax=32*0.9*sum(data_CS3(i).X);%���崢�ܵ��������
    data_CS3(i).dS=zeros(1,97);%���崢�ܵ������仯��
    data_CS3(i).dS(1,1)=data_CS3(i).S0*data_CS3(i).X(:,1);
    data_CS3(i).dS(1,2:97)=data_CS3(i).S0*(data_CS3(i).X(:,2:97).*(data_CS3(i).X(:,2:97)-data_CS3(i).X(:,1:96)))-32*0.9*sum(data_CS3(i).X(:,1:96).*(data_CS3(i).X(:,1:96)-data_CS3(i).X(:,2:97)));
    %���վ4
    data_CS4(i).X=zeros(length(data_CS4(i).S0),97);%����ͣ��״̬����
    for j=1:length(data_CS4(i).S0)
        data_CS4(i).X(j,data_CS4(i).Ta(j):data_CS4(i).Tl(j))=1;
    end
    data_CS4(i).Pch=6.6*sum(data_CS4(i).X);%���崢�ܵĳ�繦��
    data_CS4(i).Pdis=6.6*sum(data_CS4(i).X);%���崢�ܵķŵ繦��
    data_CS4(i).Smin=32*0.15*sum(data_CS4(i).X);%���崢�ܵ���С����
    data_CS4(i).Smax=32*0.9*sum(data_CS4(i).X);%���崢�ܵ��������
    data_CS4(i).dS=zeros(1,97);%���崢�ܵ������仯��
    data_CS4(i).dS(1,1)=data_CS4(i).S0*data_CS4(i).X(:,1);
    data_CS4(i).dS(1,2:97)=data_CS4(i).S0*(data_CS4(i).X(:,2:97).*(data_CS4(i).X(:,2:97)-data_CS4(i).X(:,1:96)))-32*0.9*sum(data_CS4(i).X(:,1:96).*(data_CS4(i).X(:,1:96)-data_CS4(i).X(:,2:97)));
end
save('data_potential_history','data_CS1','data_CS2','data_CS3','data_CS4');%�綯������������