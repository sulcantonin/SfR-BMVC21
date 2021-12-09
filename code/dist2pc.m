% gives point cloud [X;Y;Z] for given distance (not depth!) map
function [pc] = dist2pc(dist,x, K, Kinv, depth_as_z)
hom = @(x) [x; ones(1,size(x,2))];
[x_dim,N] = size(x);

% this gives a real depth
if depth_as_z
    Z = dist2Z(dist(:)',x(1:2,:),K);
% this gives a distance from the camera center, it is slightly different
else
    Z = dist(:)';   
end
% https://stackoverflow.com/questions/31265245/extracting-3d-coordinates-given-2d-image-points-depth-map-and-camera-calibratio

assert(x_dim > 2)
% add homogenous coordinate to x
if x_dim == 2
    x= hom(x(1:2,:));
end

pc = zeros(3,N);
pc(1:2,:) = Z.* (Kinv(1:2,:) * x);
pc(3,:) = Z;