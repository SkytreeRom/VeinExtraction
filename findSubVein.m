function [sub_vein_left_,sub_vein_right_]=findSubVein(cout,xy,processedImg)
%couΪ���м�⵽�Ľǵ�
%xyΪ����
Q2=xy(1,:)';
Q1=xy(2,:)';
xMain=xy(1,1);
j=1;k=1;
for i=1:1:size(cout,1)
    P=[cout(i,2);cout(i,1)];
    d = abs(det([Q2-Q1,P-Q1]))/norm(Q2-Q1);%ȫ����Ҫ������ȫ����x��ǰy�ں�
    if d>20
        res=locateSubVein(processedImg,xy,P);
        xx=P(1);
        if xx<xMain
            [x,y]=find(res==1);
            sub_vein_left_(1:size(x,1),1:2,j)=[x,y];
            j=j+1;
        else
            [x,y]=find(res==1);
            sub_vein_right_(1:size(x,1),1:2,k)=[x,y];
            k=k+1;
        end
    end
end
end
