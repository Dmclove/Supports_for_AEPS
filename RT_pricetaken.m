%%%��ȫ�����г�%%%
%%%�۸������%%%
%%%ʵʱ���ȣ��۸��������(����)����ģʽ�µĳ���۸�%%%
clear
clc
%��������
load result_RT_cooperation
price_RT=result_RT_cooperation.Price_DLMP(1,:);%ʵʱ�ڵ�߼ʵ��
load Bid_reference
price_DA=pi_DA_reference(1,:);%��ǰ�ڵ�߼ʵ��
Pch_last=zeros(4,96);%֮ǰ�ĳ����Ⱦ���(�״�ʹ��)
Pdis_last=zeros(4,96);%֮ǰ�ķŵ���Ⱦ���(�״�ʹ��)
load data_potential_RT
%�����Ż�
for l=1:96
    Pchmax=[RT_CS1(l).Pch(1:96);RT_CS2(l).Pch(1:96);RT_CS3(l).Pch(1:96);RT_CS4(l).Pch(1:96)];%���վ��籨������
    Pdismax=[RT_CS1(l).Pdis(1:96);RT_CS2(l).Pdis(1:96);RT_CS3(l).Pdis(1:96);RT_CS4(l).Pdis(1:96)];%���վ�ŵ籨������
    Smin=[RT_CS1(l).Smin(1:96);RT_CS2(l).Smin(1:96);RT_CS3(l).Smin(1:96);RT_CS4(l).Smin(1:96)];%���վ��������;
    Smax=[RT_CS1(l).Smax(1:96);RT_CS2(l).Smax(1:96);RT_CS3(l).Smax(1:96);RT_CS4(l).Smax(1:96)];%���վ��������;
    deltaS=[RT_CS1(l).dS(1:96);RT_CS2(l).dS(1:96);RT_CS3(l).dS(1:96);RT_CS4(l).dS(1:96)];%���վ�����仯��;
    lastS=[RT_CS1(l).dS(97);RT_CS2(l).dS(97);RT_CS3(l).dS(97);RT_CS4(l).dS(97)];%��96��ʱ�α�����ɵĳ����
    Pch=sdpvar(4,96);%�����վ������
    Pch(:,1:l-1)=Pch_last(:,1:l-1);%����ֵ
    Pdis=sdpvar(4,96);%�����վ�ŵ����
    Pdis(:,1:l-1)=Pdis_last(:,1:l-1);%����ֵ
    S=sdpvar(4,96);%���崢���豸����
    %Լ������
    Constraints=[0<=Pch<=Pchmax,0<=Pdis<=Pdismax,Smin<=S<=Smax,S(:,1)==0.25*0.95*Pch(:,1)-0.25*Pdis(:,1)/0.95+deltaS(:,1),
        S(:,2:96)==S(:,1:95)+0.25*0.95*Pch(:,2:96)-0.25*Pdis(:,2:96)/0.95+deltaS(:,2:96),
        0==S(:,96)+lastS];%���վԼ��
    %Ŀ�꺯��
    Obj=sum(sum((ones(4,1)*price_RT(1:l)).*(Pch(:,1:l)-Pdis(:,1:l))))+sum(sum((ones(4,1)*price_RT(l+1:96)).*(Pch(:,l+1:96)-Pdis(:,l+1:96))));%���վ����Ŀ��
    %���ģ��
    ops=sdpsettings('solver','gurobi','gurobi.OptimalityTol',1e-8,'gurobi.FeasibilityTol',1e-8,'gurobi.IntFeasTol',1e-8);
    ops.gurobi.MIPGap=1e-8;
    solvesdp(Constraints,Obj,ops);
    Pch_last(:,l)=double(Pch(:,l));%����״̬
    Pdis_last(:,l)=double(Pdis(:,l));%����״̬
end
result_RT_pricetaken.Pch=double(Pch);
result_RT_pricetaken.Pdis=double(Pdis);
result_RT_pricetaken.S=double(S);
save('result_RT_pricetaken','result_RT_pricetaken');