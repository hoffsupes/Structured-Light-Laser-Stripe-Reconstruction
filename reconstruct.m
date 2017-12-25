
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
% f = 3.5;
% b = 11.43;

b = 18;
M = 640;
Dz = 9.3; 
D0 = 2.2;
f = 3.5;

[A,B,C,D] = do_threed_reconst_train(imread('train2.jpg'),laser_calibration(M,b,Dz,D0),cameraParams.FocalLength,cameraParams.PrincipalPoint,b); %% determine A,B,C,D

for i=2:22
s = strcat('video_data/',num2str(i),'.jpeg');       %% read each video file
% sc = do_threed_reconst(imread(s),laser_calibration(640,22.86,12,10),cameraParams.FocalLength,cameraParams.PrincipalPoint);
sc = do_threed_reconst_test(imread(''),laser_calibration(M,b,Dz,D0),cameraParams.FocalLength,cameraParams.PrincipalPoint,b,f,A,B,C,D); %% do 3D reconstruction 
fig = scatter3(sc(:,1),sc(:,2),sc(:,3),'bo'); hold on;
saveas(fig,strcat('res_data/',num2str(i),'.jpeg'));
end

% while(1)
% 
% %%% enter your video frame reader code here
% 
% F = %%% Read a video frame
% 
% sc = do_threed_reconst_test(F,laser_calibration(M,b,Dz,D0),cameraParams.FocalLength,cameraParams.PrincipalPoint,b,f,A,B,C,D);
% fig = scatter3(sc(:,1),sc(:,2),sc(:,3),'bo');
%     
% end
%%@dassg
