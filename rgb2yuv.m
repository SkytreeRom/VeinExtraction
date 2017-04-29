function YUV=rgb2yuv(RGB)
RGB = mat2gray(RGB);
R = RGB(:,:,1);
G = RGB(:,:,2);
B = RGB(:,:,3);
Y = 0.299*R + 0.587*G + 0.114*B;
U = -0.147*R- 0.289*G + 0.436*B;
V = 0.615*R - 0.515*G - 0.100*B;
YUV = cat(3, Y, U, V);
end