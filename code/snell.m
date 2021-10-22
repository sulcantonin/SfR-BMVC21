% from http://www.starkeffects.com/snells-law-vector.shtml
% snell = @(s1,N,n1,n2) (n1 ./ n2) * (cross(N, cross(-N,s1))) - N .* sqrt(1- (n1./n2).^2 .* sum(cross(N,s1).^2));
% just to make sure, I checked it with [Greve B., Reflections and Refractions in Ray Tracing]

function s2 = snell(l,n,n1,n2) 
    %{
    ln = dot(l,n);
    mu = n1/n2;
    s2 = mu * l + n * (mu * (-ln) - sqrt(1-mu^2 * (1-(-ln)^2)));
    %}

    ln = dot(l,n,1);
    mu = n1/n2;
    s2 = mu * l + n .* (mu * (-ln) - sqrt(1-mu.^2 * (1-(-ln).^2)));
end


% this is just a test if I flip the sign and my equations (s2) can still be corret and correspond to the content of the paper
%{
syms mu
syms lx ly lz
syms nx ny nz
l = -[lx;ly;lz];
n = [nx;ny;nz];

ln = dot(l,n,1);
s21 = mu * l + n .* (mu * (-ln) - sqrt(1-mu.^2 * (1-(-ln).^2)));

l = -l
ln = dot(l,n,1);
s22 = -mu * l + n .* (mu * ln - sqrt(1-mu.^2 * (1-ln.^2)));
%}
