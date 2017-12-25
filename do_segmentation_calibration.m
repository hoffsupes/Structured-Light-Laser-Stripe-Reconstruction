function kkk = do_segmentation_calibration(I)
kkk = zeros(size(I(:,:,1)));

l = I(:,:,1) == 255;
k = find(sum(l,2))';

for i = k
P = l(i,:,:);
kkk(i,round(mean(find(P)))) = 255;
end

end
 %%@dassg