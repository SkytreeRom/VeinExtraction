function res=distMatPreprocess(distMat,distVec,Peaks)
[row,col]=size(distMat);
for i=1:1:row
for j=i:1:col
distMat(i,j)=1000;%Ԥ��һ���ϴ�ֵ
end
end
%[x,y]=find(distMat<10);
%���崦����۽Ͻ��ĵ�
for i=1:1:row
tem=find(distMat(:,i)<10);
if size(tem,1)>0%
    tem=[i;tem];
end
distMat(:,tem)=1000;
%����õ������ƽ����ȡ��
x=round(sum(Peaks(tem,1))/size(tem,1));
y=round(sum(Peaks(tem,2))/size(tem,1));
Peaks(tem',:)=repmat([x,y],size(tem,1),1);
end
res=unique(Peaks,'rows');
end