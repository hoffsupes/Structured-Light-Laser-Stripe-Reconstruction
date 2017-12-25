function LL = do_threed_reconst(J,DK,foc,poc)

fsx = foc(1);
fsy = foc(2);           %% Focal length and sampling rate
c0 = poc(1);
r0 = poc(2);            %% Principal Point

jj = do_segmentation_calibration(J);        %% Do segmentation 
[xx,~] = meshgrid(1:size(J,2),1:size(J,1)); %% determining column values
jj(jj~=0) = 1;
k = jj.*xx;
L = [];
c = [];
r = [];


for i = 1:size(k,1)
for j = 1:size(k,2)
if(k(i,j))
L = [L DK(k(i,j))];             %%% Add depth values
c = [c j];
r = [r i];
end
end
end

L = medfilt1(L,9);              %% Median filtering to remove noise
LL = zeros(length(L),3);

LL(:,3) = L;
LL(:,1) = (L/(fsx/10)).*(c - c0);
LL(:,2) = (L/(fsy/10)).*(r - r0);           %% Pixel to camera coordinates

end
 %%@dassg