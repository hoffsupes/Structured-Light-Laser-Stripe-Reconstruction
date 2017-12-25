function [A,B,C,D] = do_threed_reconst_train(J,DK,foc,poc,b)

fsx = foc(1);
fsy = foc(2);
c0 = poc(1);
r0 = poc(2);

jj = do_segmentation_calibration(J);
[xx,~] = meshgrid(1:size(J,2),1:size(J,1));
jj(jj~=0) = 1;
k = jj.*xx;
L = [];
c = [];
r = [];


for i = 1:size(k,1)
for j = 1:size(k,2)
if(k(i,j))
L = [L DK(k(i,j))];
c = [c j];
r = [r i];
end
end
end

L = medfilt1(L,9);
LL = zeros(length(L),3);

LL(:,3) = L;
LL(:,1) = (L/(fsx/10)).*(c - c0);
LL(:,2) = (L/(fsy/10)).*(r - r0);


B = repmat(b,size(LL,1),1);

X = LL\B;
A = X(1);
B = X(2);
C = X(3);
D = -b;

end
 %%@dassg