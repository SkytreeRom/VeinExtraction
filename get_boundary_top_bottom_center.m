


%%%%%%%%%�������Ҷ������ ��ֵ�� computing center Extrema %%%%%%%%%%%%%%%%



function [boundary_top,boundary_bottom,center_point]=get_boundary_top_bottom_center(binaryImage,boundary)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  part 1  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
STATS=regionprops(binaryImage,'Centroid','Extrema','Orientation');

%%%%STATS.Extrema   %%%%% �ô���Ϊ�˴�ӡ �����õġ�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  part 1  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  part 2  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
boundary_top_x=round((STATS.Extrema(1,1)+STATS.Extrema(2,1))/2);
boundary_top_y=round((STATS.Extrema(1,2)+STATS.Extrema(2,2))/2);

%%%%%%%%%%%%%%%%%%%%%%%%    ��ֹ���ڱ߽���   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


   if  boundary_top_y == min(boundary(:,2))
        top_row_Yequal=find(boundary(:,2)==boundary_top_y)  
                      %%%%�ҵ��߽�����У��������boundary_top_y��x1,x2,x3,x4,...xn
                      %%%%����top_row_Yequal����boundary�����е�λ��
        [n1,m1]=size(top_row_Yequal);   %%%һ���Ȼ�����ŵ�����������n2����Ҫ������
        index_top=0;   %%%  �����ж��Ƿ��ҵ� boundary_top_x��ȵ�
        for j=1:n1
            if boundary_top_x == boundary(top_row_Yequal(j),1)   %%%��boundary�е�һ�н��бȽ�
               index_top=1;  %%%��������е���һ����˵���ڱ߽�����У��ҵ�һ�� boundary_top_x
               break;
            end
        end
       
        if index_top == 0    %%%˵���߽������û�ҵ���boundary_top_x��ȵ�
           j=round(n1/2);     %%%��ȡtop_row_Yequal�м��Ǹ���
           boundary_top_x = boundary(top_row_Yequal(j),1) 
        end
   
   elseif boundary_top_y ~= min(boundary(:,2))
          boundary_top_y = min(boundary(:,2))   %%%��y���ֵ��ֵ�׶�y
        
          top_row_Yequal=find(boundary(:,2)==boundary_top_y)  
                      %%%%�ҵ��߽�����У��������boundary_top_y��x1,x2,x3,x4,...xn
                      %%%%����top_row_Yequal����boundary�����е�λ��
        [n1,m1]=size(top_row_Yequal);   %%%һ���Ȼ�����ŵ�����������n1����Ҫ������
        index_top=0;   %%%  �����ж��Ƿ��ҵ� boundary_top_x��ȵ�
        for j=1:n1
            if boundary_top_x == boundary(top_row_Yequal(j),1)   %%%��boundary�е�һ�н��бȽ�
               index_top=1;  %%%��������е���һ����˵���ڱ߽�����У��ҵ�һ�� boundary_top_x
               break;
            end
        end
       
        if index_top == 0    %%%˵���߽������û�ҵ���boundary_top_x��ȵ�
           j=round(n1/2);     %%%��ȡtop_row_Yequal�м��Ǹ���
           boundary_top_x = boundary(top_row_Yequal(j),1) 
        end
   end


%%%%%%%%%%%%%%%%%%%%%%%%    ��ֹ���ڱ߽���   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  part 2  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  part 3  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

boundary_bottom_x=round((STATS.Extrema(5,1)+STATS.Extrema(6,1))/2);
boundary_bottom_y=round((STATS.Extrema(5,2)+STATS.Extrema(6,2))/2);

%%%%%%%%%%%%%%%%%%%%%%%%    ��ֹ���ڱ߽���   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    if  boundary_bottom_y == max(boundary(:,2))
        bottom_row_Yequal=find(boundary(:,2)==boundary_bottom_y)  
                      %%%%�ҵ��߽�����У��������boundary_bottom_y��x1,x2,x3,x4,...xn
                      %%%%����bottom_row_Yequal����boundary�����е�λ��
        [n2,m2]=size(bottom_row_Yequal);   %%%һ���Ȼ�����ŵ�����������n2����Ҫ������
        index_bottom=0;   %%%  �����ж��Ƿ��ҵ� boundary_bottom_x��ȵ�
        for i=1:n2
            if boundary_bottom_x == boundary(bottom_row_Yequal(i),1)   %%%��boundary�е�һ�н��бȽ�
               index_bottom=1;  %%%��������е���һ����˵���ڱ߽�����У��ҵ�һ�� boundary_bottom_x
               break;
            end
        end
       
        if index_bottom == 0    %%%˵���߽������û�ҵ���boundary_bottom_x��ȵ�
           i=round(n2/2);     %%%��ȡbottom_row_Yequal�м��Ǹ���
           boundary_bottom_x = boundary(bottom_row_Yequal(i),1) 
        end
   
   elseif boundary_bottom_y ~= max(boundary(:,2))
          boundary_bottom_y = max(boundary(:,2))   %%%��y���ֵ��ֵ�׶�y
        
          bottom_row_Yequal=find(boundary(:,2)==boundary_bottom_y)  
                      %%%%�ҵ��߽�����У��������boundary_bottom_y��x1,x2,x3,x4,...xn
                      %%%%����bottom_row_Yequal����boundary�����е�λ��
        [n2,m2]=size(bottom_row_Yequal);   %%%һ���Ȼ�����ŵ�����������n2����Ҫ������
        index_bottom=0;   %%%  �����ж��Ƿ��ҵ� boundary_bottom_x��ȵ�
        for i=1:n2
            if boundary_bottom_x == boundary(bottom_row_Yequal(i),1)   %%%��boundary�е�һ�н��бȽ�
               index_bottom=1;  %%%��������е���һ����˵���ڱ߽�����У��ҵ�һ�� boundary_bottom_x
               break;
            end
        end
       
        if index_bottom == 0    %%%˵���߽������û�ҵ���boundary_bottom_x��ȵ�
           i=round(n2/2);     %%%��ȡbottom_row_Yequal�м��Ǹ���
           boundary_bottom_x = boundary(bottom_row_Yequal(i),1) 
        end
   end

  
%%%%%%%%%%%%%%%%%%%%%%%%    ��ֹ���ڱ߽���   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  part 3  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  part 4  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
boundary_top=[boundary_top_x,boundary_top_y];
boundary_bottom=[boundary_bottom_x,boundary_bottom_y];
center_point=round(STATS.Centroid);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  part 4  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%ע�⣺��ʱ���ҵ��Ķ���͵׶˲������ڱ߽�����У���Ҫ�����ֲ���
%%%%%������ round �� floor �л�������һ�����Ч����������ȫ��֤��
%%%%% �Ѿ������쳣���ٵ������롣














