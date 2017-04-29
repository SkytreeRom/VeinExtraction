function [temImg,sign]=smallsearch(j,i,processedImg,temImg)
sign=1;
if processedImg(j+1,i)==1
    temImg(j+1,i)=1;
elseif processedImg(j+1,i-1)==1
    temImg(j+1,i-1)=1;
elseif processedImg(j+1,i+1)==1
    temImg(j+1,i+1)=1;
else
    sign=0;
end
end