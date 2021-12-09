% the function transforms the distance to 3d point cloud 
% https://thousandyardstare.de/blog/generating-depth-images-in-blender-279.html
function [Z] = z2pc(dist,x,K)
cx = K(1,3);
cy = K(2,3);
fx = K(1,1);
fy = K(2,2);

xc = x(1,:) - cx;
yc = x(2,:) - cy;

Z = sqrt(dist.^2 ./ ((xc.^2 + yc.^2) ./ (fx * fy) + 1));
end
