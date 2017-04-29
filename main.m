clear;
%%图像读取及色彩空间变换
RGB = imread('22.JPG');
grayImage=rgb2gray(RGB);
YUV=rgb2yuv(RGB); 
% LAB = rgb2lab(RGB);
% L = LAB(:,:,1)/100; 
% LAB(:,:,1) = adapthisteq(L,'NumTiles',[8 8],'ClipLimit',0.005)*100;
% J = lab2rgb(LAB);
grayImage=YUV(:,:,1);
grayImage=uint8(Normalize(grayImage));
%%
%获取叶子范围%
level = graythresh(grayImage);
binaryImage = im2bw(grayImage, level);
%binaryImage = imbinarize(rgb2gray(RGB));
binaryImage = imcomplement(binaryImage);% invert image 
binaryImage = imfill(binaryImage, 'holes');
binaryImage = bwareaopen(binaryImage, round(0.1*numel(binaryImage)));%去除周围的小区域


%%
%获取叶子轮廓%
dim = size(binaryImage);
xPt = round(dim(2)/2)-90;
yPt = min(find(binaryImage(:,xPt)));
boundary = bwtraceboundary(binaryImage,[yPt, xPt],'N');
x= boundary(:,2); % x = columns.    %%% 得到边界坐标  列
y =boundary(:,1); % y = rows.       %%% 得到边界坐标  行
STATS=regionprops(binaryImage,'Centroid','Extrema','Orientation','MajorAxisLength','MinorAxisLength');
boundary_swap=[x,y];  
bourdary_top_x=round((STATS.Extrema(1,1)+STATS.Extrema(2,1))/2);
bourdary_top_y=round((STATS.Extrema(1,2)+STATS.Extrema(2,2))/2);
bourdary_bottom_x=round((STATS.Extrema(5,1)+STATS.Extrema(6,1))/2);
bourdary_bottom_y=round((STATS.Extrema(5,2)+STATS.Extrema(6,2))/2);
bourdary_top=[bourdary_top_x,bourdary_top_y];
bourdary_bottom=[bourdary_bottom_x,bourdary_bottom_y];
center_point=round(STATS.Centroid);
By = ones(size(grayImage));   
for k = 1:size(x)  
   By(boundary(k,1),boundary(k,2)) = 0;
end
SE=strel('square',10);
By=imerode(By,SE);

%%
%检测树叶骨架%
image_out1=adapthisteq(grayImage);
image_out1 = edge(image_out1,'canny',[0.27,0.29],1);
image_out1 = bwareaopen(image_out1,35);

imageout=binaryImage.*image_out1.*By;
image_out2=adapthisteq(imageout);
image_out2 = edge(image_out2,'canny',[0.27,0.29],1);
image_out2 = bwareaopen(image_out2,35);
se=strel('disk',2,0);
dilatedI = imdilate(image_out2,se);
dilatedI = imfill(dilatedI, 'holes');%填补膨胀后存在的洞
imageout2 = bwmorph(dilatedI,'skel',Inf);
imageout2 = bwmorph(imageout2,'spur',10);
for k=1:5
    imageout2 = imageout2 &~ endpoints(imageout2);   %去端点毛刺
 end
imageout2 = bwareaopen(imageout2,50);
figure(1)
imshowpair(RGB,imageout2,'montage')

%%
%检测焦点%
[cout,marked_img] = corner(imageout2,1.5,150,1.7,0.19,0.07,1,10);     %      角点检测 
figure(2)
imshow(imageout2);
hold  on;
plot(cout(:,2),cout(:,1),'or');  

[H,T,R] = hough(imageout2,'RhoResolution',5,'Theta',-40:0.5:40.5);

% [H,T,R] = hough(imageout,'RhoResolution',11.5,'Theta',-45:0.5:45.5);
Peaks=houghpeaks(H,3);
%Peaks得到的极值点存在相似重复问题，对重复点筛选
distVec=pdist(Peaks);%求peaks点两两之间的距离
distMat=squareform(distVec);%将距离转换为矩阵形式
Peaks=distMatPreprocess(distMat,distVec,Peaks);
lines=houghlines(imageout2,T,R,Peaks,'FillGap',100,'MinLength',40);

for k=1:length(lines)
    xy=[lines(k).point1;lines(k).point2];
    figure(2)
    plot(xy(:,1),xy(:,2),'LineWidth',2);
    res=locatevein(imageout2,xy);
    figure
    imshow(res)
end


% k=1;
% [c,r] = size(cout);
% a = sqrt((xy(1,2)-xy(2,2))^2+(xy(1,1)-xy(2,1))^2);
% 
% for m=1:c
%     b = sqrt((xy(1,2)-cout(m,1))^2+(xy(1,1)-cout(m,2))^2); 
%     c = sqrt((xy(2,2)-cout(m,1))^2+(xy(2,1)-cout(m,2))^2); 
%     p = (a+b+c)/2;
%     s = sqrt(p*(p-a)*(p-b)*(p-c));%海伦公式计算三角形面积
%     if 2*s /a  < 10
%         co(k,1) = cout(m,1);
%         co(k,2) = cout(m,2);
%         k = k+1;
%     end
% end
% 
% figure
% imshow(imageout2);
% hold  on;
% plot(co(:,2),co(:,1),'or');     %筛选后主茎上角点显示
% res=locatevein(imageout2,xy);
% figure
% imshow(res)