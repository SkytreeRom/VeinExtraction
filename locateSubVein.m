%��λ��ҶҶ���ľ������꣬Ŀǰֻ���Ƕ�λ����ҪҶ��������
%processedImg�������������ȡ����Ҷ���Ǽ�
%xy��������任�õ�����Ҷ��
%
%res:��ȡ����Ҷ������
function res=locateSubVein(processedImg,xy,P)
Q2=xy(1,:)';
Q1=xy(2,:)';
temImg=zeros(size(processedImg));
%temImg(xy(1,2),xy(1,1))=1;
i=P(1);
j=P(2);
d = abs(det([Q2-Q1,P-Q1]))/norm(Q2-Q1);
while d>10%һֱ����������Ҷ�������ӵ�����
    
    temImg=smallsearch(j,i,processedImg,temImg);
    oneInImg=find(temImg(j+1,:)==1);
    
%     if size(oneInImg,2)>1
%         %������ܳ�����һ���ж��������(���if���������)
%         %������Χ��Ϊ������ʱ�ƺ�û��Ҫ
%         %��������ĳ����Ѿ��Ѵ���������
%     end
    
    %�����ҵ�0��������
    if size(oneInImg,2)==0
        %�Ӵ�������Χ��������3
        if processedImg(j+1,i-2)==1
            temImg(j+1,i-2)=1;
        elseif processedImg(j+1,i+2)==1
            temImg(j+1,i+2)=1;
        elseif processedImg(j+1,i-3)==1
            temImg(j+1,i-3)=1;
        elseif processedImg(j+1,i+3)==1
            temImg(j+1,i+3)=1;
        end
        %�Ӵ�������Χ����δ��Ч���ı�ԭ��������λ��,���Χ10
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
    if isempty(i)
       break;
    end
    j=j+1;
    P=[i;j];
    d = abs(det([Q2-Q1,P-Q1]))/norm(Q2-Q1);
end
res=temImg;
end