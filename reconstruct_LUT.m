
clc;
clear all;
close all;

% M = 640;
% b = 22.86;
% Dz = 12;
% D0 = 10;
% f = 3.5;

load('cameraParams.mat');
% b = 11.43;
% M = 640;
% Dz = 21.59; 
% D0 = 11.43;
f = 3.5;
% b = 11.43;

b = 18;
M = 640;
Dz = 9.3; 
D0 = 2.2;


for i=2:22
s = strcat('video_data/',num2str(i),'.jpeg');
% sc = do_threed_reconst(imread(s),laser_calibration(640,22.86,12,10),cameraParams.FocalLength,cameraParams.PrincipalPoint);
sc = do_threed_reconst(imread(s),laser_calibration(M,b,Dz,D0),cameraParams.FocalLength,cameraParams.PrincipalPoint);
fig = scatter3(sc(:,1),sc(:,2),sc(:,3),'bo');
saveas(fig,strcat('res_data/',num2str(i),'.jpeg'))
end


% while(1)
% %%% enter your video frame reader code here
% 
% F = %%% Read a video frame
% 
% sc = do_threed_reconst(F,laser_calibration(M,b,Dz,D0),cameraParams.FocalLength,cameraParams.PrincipalPoint);
% fig = scatter3(sc(:,1),sc(:,2),sc(:,3),'bo'); %% Will automatically display.
% 
% end


%%@dassg
