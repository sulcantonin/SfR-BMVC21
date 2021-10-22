function f = e(dist_est,unproject,xr,X_b,n_1,n_2, mask)
grid_sz_y = size(mask,1);
grid_sz_x = size(mask,2);
vec = @(x) x(:);

% point cloud
X_est = X_b; 
X_est(:, mask) = unproject(dist_est,xr(:,mask));
pc_x = reshape(X_est(1,:),grid_sz_y,grid_sz_x);
pc_y = reshape(X_est(2,:),grid_sz_y,grid_sz_x);
pc_z = reshape(X_est(3,:),grid_sz_y,grid_sz_x);
[nx,ny,nz] = surfnorm(pc_x,pc_y,pc_z);

LOS = X_est(:,mask) ./ vecnorm(X_est(1:3,:),2,1);

% optimized points
X = X_est(:, mask);
l = -LOS; 
n = [nx(mask),ny(mask),nz(mask)]';
s2 = snell(l,n,n_1,n_2);

f = point_line_distance(X_b(:,mask), ...
    X, ...
    X + s2);    

f = f + max(0, X_est(3,:) - X_b(3,:));