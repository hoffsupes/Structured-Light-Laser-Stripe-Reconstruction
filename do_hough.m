function do_hough(l,rotI,pk,thresh)

[H,theta,rho] = hough(l); %%ceil(0.3*max(H(:)))
P = houghpeaks(H,pk,'threshold',thresh);
x = theta(P(:,2));
y = rho(P(:,1));
plot(x,y,'s','color','black');
lines = houghlines(l,theta,rho,P,'FillGap',5,'MinLength',7);
figure, imshow(rotI), hold on
max_len = 0;

the = [lines.theta];
ml = [];

for k = 1:length(lines)
ml = [ml norm(lines(k).point1 - lines(k).point2)];
end
[~,b] = max(ml);

nn = find(abs(the - the(b)) < 2);
rr = [lines(nn).rho ];
vl = zeros(size(rr));
iter = 0;

for i = 1:length(rr)

kw = (sqrt(sum((rr - rr(i)).^2,1)) < 2);

if(vl(bn) ==0 && vl(i) == 0)
    vl(bn) = iter;
    vl(i) = iter;
    iter = iter+1;
elseif(vl(i) == 0 && vl(bn) ~= 0)
    vl(i) = vl(bn);
elseif(vl(i)~=0)
    continue;
end
end


for k = 1:length(lines)
xy = [lines(k).point1; lines(k).point2];
plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
% Plot beginnings and ends of lines
plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
% Determine the endpoints of the longest line segment
len = norm(lines(k).point1 - lines(k).point2);
if ( len > max_len)
max_len = len;
xy_long = xy;
end
end
% highlight the longest line segment
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');
figure, imshow(rotI), hold on
max_len = 0;
for k = 1:length(lines)
xy = [lines(k).point1; lines(k).point2];
plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
% Plot beginnings and ends of lines
plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
% Determine the endpoints of the longest line segment
len = norm(lines(k).point1 - lines(k).point2);
if ( len > max_len)
max_len = len;
xy_long = xy;
end
end
% highlight the longest line segment
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');

end