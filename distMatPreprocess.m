function res=distMatPreprocess(distMat,distVec,Peaks)
[row,col]=size(distMat);
for i=1:1:row
for j=i:1:col
distMat(i,j)=1000;%预设一个较大值
end
end
%[x,y]=find(distMat<10);
%具体处理相聚较近的点
for i=1:1:row
tem=find(distMat(:,i)<10);
if size(tem,1)>0%
    tem=[i;tem];
end
distMat(:,tem)=1000;
%将求得点的坐标平均后并取整
x=round(sum(Peaks(tem,1))/size(tem,1));
y=round(sum(Peaks(tem,2))/size(tem,1));
Peaks(tem',:)=repmat([x,y],size(tem,1),1);
end
res=unique(Peaks,'rows');
end