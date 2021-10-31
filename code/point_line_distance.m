% 
function [d,C,t0] = point_line_distance(P,A,B)
% distancePoint2Line  Calculate the distance between a point and a line
%   D = distancePoint2Line(A, B, P) returns the distance from point P to the
%   line through A and B in an N-dimensional space.
%
%   D = distancePoint2Line(A, B, P, LineType) returns the distance from
%   point P to
%   - a line through A and B,
%   - a ray which starts at A and passes through B, or
%   - a line segment AB.
%   The definition of distance D depends on LineType, see below.
%
%   [D, C, t0] = distancePoint2Line(A, B, P, ..) returns in addition the
%   closest point C and the running parameter t0 that defines the intersection
%   point of the line through A,B and the perpendicular through P. The
%   definition of closest point depends on LineType, see below.
%   
%   the code is from https://monkeyproofsolutions.nl/wordpress/how-to-calculate-the-shortest-distance-between-a-point-and-a-line/
% single
%{
M = B - A;
t0 = dot(M, P - A) / dot(M, M);
C  = A + t0 * M;
d = norm(P-C);
%}
% vectorized
M = A - B;
t0 = dot(M,P - A,1) ./ dot(M,M,1);
C = A + t0 .* M;
d = vecnorm(P-C,2,1);