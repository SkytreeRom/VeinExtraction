function veinListProcess(veinList,xyList,imageout)
%veinList和xyList是有对应关系的
total=size(xyList,1);
%先通过距离找出main vein
xyList(:,5)=sqrt((xyList(:,1)-xyList(:,3)).^2+(xyList(:,2)-xyList(:,4)).^2);
[maxPosition,~]=find(xyList==max(xyList(:,5)));
[x,y]=find(veinList(:,:,maxPosition)==1);
main_vein_matrix=[x,y];
mainX=xyList(maxPosition,1);%以主叶脉第一个点的x坐标作为判断左右叶脉的依据
%xyList(maxPosition)=[];
sub_vein_left_=[];sub_vein_right_=[];j=1;k=1;
for i=1:1:total
    if i~=maxPosition%当不是主叶脉时进行处理
        x=xyList(i,1);
        if x<mainX
            [x,y]=find(veinList(:,:,i)==1);
            sub_vein_left_(1:size(x,1),1:2,j)=[x,y];
            j=j+1;
        else
            [x,y]=find(veinList(:,:,i)==1);
            sub_vein_right_(1:size(x,1),1:2,j)=[x,y];
            k=k+1;
        end
    end
end
%显示部分
figure
imshow(imageout);
hold on;
plot(main_vein_matrix(:,2),main_vein_matrix(:,1),'*');%显示mainvein
for i=1:1:j-1
    plot(sub_vein_left_(:,2,i),sub_vein_left_(:,1,i),'*');
end
for i=1:1:k-1
    plot(sub_vein_right_(:,2,i),sub_vein_right_(:,1,i),'*');
end
end