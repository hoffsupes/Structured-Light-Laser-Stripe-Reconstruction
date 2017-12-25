function do_segmentation(I)

l = I(:,:,1) == 255;
k = find(sum(l,2))';
for i = k
P = l(i,:,:);
kkk(i,round(mean(find(P)))) = 255;
end

end