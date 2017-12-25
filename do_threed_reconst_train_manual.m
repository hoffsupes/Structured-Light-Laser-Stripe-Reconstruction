function [A,B,C,D] = do_threed_reconst_train_manual(LL,b)

B = repmat(b,size(LL,1),1);

X = LL\B;
A = X(1);
B = X(2);
C = X(3);
D = -b;

end
 %%@dassg