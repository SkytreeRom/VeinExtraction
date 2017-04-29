originalImage=imread('10.jpg');
yuv=rgb2yuv(originalImage);
grayImage=yuv(:,:,1);
subplot(2,2,1)
imshow(grayImage)
title('Original grayImage')
subplot(2,2,2)
histogram(grayImage)
title('Histogram of grayImage')
axis off
subplot(2,2,3)
imageHisteq=histeq(grayImage);
imshow(imageHisteq)
subplot(2,2,4)
imageAdHiseq=adapthisteq(grayImage);
imshow(imageAdHiseq)