%定位树叶叶脉的具体坐标，目前只考虑定位最主要叶脉的坐标
%processedImg：经过处理后，提取到的叶脉骨架
%xy：经霍夫变换得到的主叶脉
%
%res:求取的主叶脉坐标
function res=locatevein(processedImg,xy)
%获得霍夫变换得到的主叶脉最上端
x=xy(1,1);
y=xy(1,2);
temImg=zeros(size(processedImg));
temImg(xy(1,2),xy(1,1))=1;
i=xy(1,1);
for j=xy(1,2):xy(2,2)
   
    temImg=smallsearch(j,i,processedImg,temImg);
    oneInImg=find(temImg(j+1,:)==1);
    
    if size(oneInImg,2)>1
    %处理可能出现在一行有多个点的情况(多个if并列情况下)
    %搜索范围仅为下左右时似乎没必要
    %依靠后面的程序已经把此种问题解决
    end
    
    %处理找到0个点的情况
    if size(oneInImg,2)==0
    %加大搜索范围，扩大至3
        if processedImg(j+1,i-2)==1
            temImg(j+1,i-2)=1;
        elseif processedImg(j+1,i+2)==1
            temImg(j+1,i+2)=1;
        elseif processedImg(j+1,i-3)==1
            temImg(j+1,i-3)=1;
        elseif processedImg(j+1,i+3)==1
            temImg(j+1,i+3)=1;
        end
    %加大搜索范围后仍未有效，改变原有搜索点位置,最大范围10
        oneInImg=find(temImg(j+1,:)==1);
        if size(oneInImg,2)==0
            [temImg,sign]=smallsearch(j,i-1,processedImg,temImg);
            if sign==0
                [temImg,sign]=smallsearch(j,i+1,processedImg,temImg);
            end
             if sign==0
                [temImg,sign]=smallsearch(j,i-2,processedImg,temImg);
             end
             if sign==0
                [temImg,sign]=smallsearch(j,i+2,processedImg,temImg);
             end
             if sign==0
                [temImg,sign]=smallsearch(j,i-3,processedImg,temImg);
             end
             if sign==0
                [temImg,sign]=smallsearch(j,i+3,processedImg,temImg);
             end
             if sign==0
                [temImg,sign]=smallsearch(j,i-4,processedImg,temImg);
             end
             if sign==0
                [temImg,sign]=smallsearch(j,i+4,processedImg,temImg);
             end
             if sign==0
                [temImg,sign]=smallsearch(j,i-5,processedImg,temImg);
             end
             if sign==0
                [temImg,sign]=smallsearch(j,i+5,processedImg,temImg);
             end
             if sign==0
                [temImg,sign]=smallsearch(j,i-6,processedImg,temImg);
             end
             if sign==0
                [temImg,sign]=smallsearch(j,i+6,processedImg,temImg);
             end
             if sign==0
                [temImg,sign]=smallsearch(j,i-7,processedImg,temImg);
             end
             if sign==0
                [temImg,sign]=smallsearch(j,i+7,processedImg,temImg);
             end
             if sign==0
                [temImg,sign]=smallsearch(j,i-8,processedImg,temImg);
             end
             if sign==0
                [temImg,sign]=smallsearch(j,i+8,processedImg,temImg);
             end
             if sign==0
                [temImg,sign]=smallsearch(j,i-9,processedImg,temImg);
             end
             if sign==0
                [temImg,sign]=smallsearch(j,i+9,processedImg,temImg);
             end
              if sign==0
                [temImg,sign]=smallsearch(j,i-10,processedImg,temImg);
             end
             if sign==0
                [temImg,sign]=smallsearch(j,i+10,processedImg,temImg);
             end
        end
    end
    
    i=find(temImg(j+1,:)==1);
end
res=temImg;
end