function LL = do_threed_reconst_test(J,DK,foc,poc,b,f,A,B,C,D)

fsx = foc(1);
fsy = foc(2);
c0 = poc(1);
r0 = poc(2);

sx = (fsx/10)/f;
sy = (fsy/10)/f;

[r,c] = find(do_segmentation_calibration(J) ~=0);

x = (c - c0)/sx;
y = (r - r0)/sy;
L = zeros(1,size(x,1));

% L = (-D*f) / (A*x + B*y + C*f);

for i = 1:size(x,1)
L(i) = (-D*f) / (A*x(i) + B*y(i) + C*f);
end

L = medfilt1(L,9);
LL = zeros(length(L),3);

LL(:,3) = L';
LL(:,1) = (L'/(fsx/10)).*(c - c0);
LL(:,2) = (L'/(fsy/10)).*(r - r0);

end
 %%@dassg