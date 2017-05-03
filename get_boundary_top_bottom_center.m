


%%%%%%%%%计算出树叶的中心 极值点 computing center Extrema %%%%%%%%%%%%%%%%



function [boundary_top,boundary_bottom,center_point]=get_boundary_top_bottom_center(binaryImage,boundary)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  part 1  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
STATS=regionprops(binaryImage,'Centroid','Extrema','Orientation');

%%%%STATS.Extrema   %%%%% 该代码为了打印 调试用的。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  part 1  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  part 2  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
boundary_top_x=round((STATS.Extrema(1,1)+STATS.Extrema(2,1))/2);
boundary_top_y=round((STATS.Extrema(1,2)+STATS.Extrema(2,2))/2);

%%%%%%%%%%%%%%%%%%%%%%%%    防止不在边界中   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


   if  boundary_top_y == min(boundary(:,2))
        top_row_Yequal=find(boundary(:,2)==boundary_top_y)  
                      %%%%找到边界矩阵中，多个等于boundary_top_y的x1,x2,x3,x4,...xn
                      %%%%这里top_row_Yequal是在boundary矩阵中的位置
        [n1,m1]=size(top_row_Yequal);   %%%一般必然是竖着的向量，所以n2是想要的数据
        index_top=0;   %%%  用于判断是否找到 boundary_top_x相等的
        for j=1:n1
            if boundary_top_x == boundary(top_row_Yequal(j),1)   %%%与boundary中第一列进行比较
               index_top=1;  %%%如果能运行到这一步，说明在边界矩阵中，找到一个 boundary_top_x
               break;
            end
        end
       
        if index_top == 0    %%%说明边界矩阵中没找到与boundary_top_x相等的
           j=round(n1/2);     %%%想取top_row_Yequal中间那个数
           boundary_top_x = boundary(top_row_Yequal(j),1) 
        end
   
   elseif boundary_top_y ~= min(boundary(:,2))
          boundary_top_y = min(boundary(:,2))   %%%将y最大值赋值底端y
        
          top_row_Yequal=find(boundary(:,2)==boundary_top_y)  
                      %%%%找到边界矩阵中，多个等于boundary_top_y的x1,x2,x3,x4,...xn
                      %%%%这里top_row_Yequal是在boundary矩阵中的位置
        [n1,m1]=size(top_row_Yequal);   %%%一般必然是竖着的向量，所以n1是想要的数据
        index_top=0;   %%%  用于判断是否找到 boundary_top_x相等的
        for j=1:n1
            if boundary_top_x == boundary(top_row_Yequal(j),1)   %%%与boundary中第一列进行比较
               index_top=1;  %%%如果能运行到这一步，说明在边界矩阵中，找到一个 boundary_top_x
               break;
            end
        end
       
        if index_top == 0    %%%说明边界矩阵中没找到与boundary_top_x相等的
           j=round(n1/2);     %%%想取top_row_Yequal中间那个数
           boundary_top_x = boundary(top_row_Yequal(j),1) 
        end
   end


%%%%%%%%%%%%%%%%%%%%%%%%    防止不在边界中   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  part 2  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  part 3  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

boundary_bottom_x=round((STATS.Extrema(5,1)+STATS.Extrema(6,1))/2);
boundary_bottom_y=round((STATS.Extrema(5,2)+STATS.Extrema(6,2))/2);

%%%%%%%%%%%%%%%%%%%%%%%%    防止不在边界中   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    if  boundary_bottom_y == max(boundary(:,2))
        bottom_row_Yequal=find(boundary(:,2)==boundary_bottom_y)  
                      %%%%找到边界矩阵中，多个等于boundary_bottom_y的x1,x2,x3,x4,...xn
                      %%%%这里bottom_row_Yequal是在boundary矩阵中的位置
        [n2,m2]=size(bottom_row_Yequal);   %%%一般必然是竖着的向量，所以n2是想要的数据
        index_bottom=0;   %%%  用于判断是否找到 boundary_bottom_x相等的
        for i=1:n2
            if boundary_bottom_x == boundary(bottom_row_Yequal(i),1)   %%%与boundary中第一列进行比较
               index_bottom=1;  %%%如果能运行到这一步，说明在边界矩阵中，找到一个 boundary_bottom_x
               break;
            end
        end
       
        if index_bottom == 0    %%%说明边界矩阵中没找到与boundary_bottom_x相等的
           i=round(n2/2);     %%%想取bottom_row_Yequal中间那个数
           boundary_bottom_x = boundary(bottom_row_Yequal(i),1) 
        end
   
   elseif boundary_bottom_y ~= max(boundary(:,2))
          boundary_bottom_y = max(boundary(:,2))   %%%将y最大值赋值底端y
        
          bottom_row_Yequal=find(boundary(:,2)==boundary_bottom_y)  
                      %%%%找到边界矩阵中，多个等于boundary_bottom_y的x1,x2,x3,x4,...xn
                      %%%%这里bottom_row_Yequal是在boundary矩阵中的位置
        [n2,m2]=size(bottom_row_Yequal);   %%%一般必然是竖着的向量，所以n2是想要的数据
        index_bottom=0;   %%%  用于判断是否找到 boundary_bottom_x相等的
        for i=1:n2
            if boundary_bottom_x == boundary(bottom_row_Yequal(i),1)   %%%与boundary中第一列进行比较
               index_bottom=1;  %%%如果能运行到这一步，说明在边界矩阵中，找到一个 boundary_bottom_x
               break;
            end
        end
       
        if index_bottom == 0    %%%说明边界矩阵中没找到与boundary_bottom_x相等的
           i=round(n2/2);     %%%想取bottom_row_Yequal中间那个数
           boundary_bottom_x = boundary(bottom_row_Yequal(i),1) 
        end
   end

  
%%%%%%%%%%%%%%%%%%%%%%%%    防止不在边界中   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  part 3  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  part 4  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
boundary_top=[boundary_top_x,boundary_top_y];
boundary_bottom=[boundary_bottom_x,boundary_bottom_y];
center_point=round(STATS.Centroid);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  part 4  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%注意：有时候找到的顶点和底端不见得在边界矩阵中，需要方法弥补。
%%%%%上面用 round 和 floor 切换方法，一般会奏效，但不能完全保证。
%%%%% 已经发现异常，再调整代码。














