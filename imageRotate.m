function righting_angle=imageRotate(image)
boundary_binary=get_leaves_boundary(image);
boundary_swap=[boundary_binary(:,2),boundary_binary(:,1)];
[boundary_top,boundary_bottom,center_point]=get_boundary_top_bottom_center(image,boundary_swap);

boundary_top_x=boundary_top(:,1);
boundary_top_y=boundary_top(:,2);

boundary_bottom_x=boundary_bottom(:,1);
boundary_bottom_y=boundary_bottom(:,2);
slope_center_top=(boundary_top_y-center_point(2))/(boundary_top_x-center_point(1));
righting_angle=atan(slope_center_top)*(180/pi);

if righting_angle > 0
    righting_angle=righting_angle-90;
elseif righting_angle < 0
    righting_angle=righting_angle+90;  
end

end