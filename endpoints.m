function g = endpoints(f)
%ENDPOINTS 是计算一个二值图像的端点
%  G = ENDPOINTS(F)，其中F为输入的二值图像，G为输出图像，即F图像的端点图像
persistent lut %声明一个持久变量lut
if isempty(lut)
    lut = makelut(@endpoint_fcn,3);
end
g = applylut(f, lut);
%------------------------------------------------------------------------
function is_end_point = endpoint_fcn(nhood)
%判断一个像素是否是端点
%IS_END_POINT = ENDPOINT_FCN(NHOOD)应用一个3*3的二值邻域元素是端点返回1，否则返回0
is_end_point = nhood(2,2) & (sum(nhood(:)) == 2);
% 上面是endpoints函数
% 下面是运行的程序
% %骨骼化图像的端点
% f=imread('guge.bmp');
% f=im2bw(f);
% g=bwmorph(f,'skel', Inf);
% g=endpoints(g);
% figure(1),imshow(f);title('原图');
% figure(2),imshow(g);title('骨骼化图像');
