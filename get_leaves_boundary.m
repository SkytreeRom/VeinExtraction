

function boundary_binary=get_leaves_boundary(binaryImage)

%Determine the row and column coordinates of a pixel on the border of 
% the object you want to trace. 
%bwboundary uses this point as the starting 
% location for the boundary tracing.

dim = size(binaryImage);
xPt = round(dim(2)/2)-90;
yPt = min(find(binaryImage(:,xPt)));

%Call bwtraceboundary to trace the boundary from the specified point. 
%As required arguments, you must specify a binary image, 
% the row and column coordinates of the starting point, and 
% the direction of the first step. The example specifies north ( 'N'),

boundary_binary = bwtraceboundary(binaryImage,[yPt, xPt],'N');
%%% attention, the struction of boundary_binary is [y,x]

