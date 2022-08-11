% This code loads the data and plot it 
% three main variables in the '.mat' file are eye 'orientation, velocity of the eye and its motor command

%%
clear all;
close all;
clc;

fprintf('Loading the dataset ...!\n');

% please put the file in the current folder
% you can download it from https://www.kaggle.com/datasets/rezajavanmard/eye-motorcommand-dataset

load('Eye_MotorCommand_Dataset.mat'); 

%% Sub-sampling the data
stepsize=3;  % step size for sampling

motorcommand=u; % motor command [6,10m]
eyestate=aux_state; % evey orientation and velocity on X,Y,Z direction

motocommand_s=motorcommand(1:stepsize:size(u,1),:);
eyestate_s=eyestate(:,1:stepsize:size(aux_state,2));

NofSample=size(motocommand_s,1);

%% plot the motor command

ns=1:3:3000; % subsampling for a better visualization
nss=size(ns,2);

figure,
plot(ns,motocommand_s(1:nss,1)','b',ns,motocommand_s(1:nss,2)',...
    'r',ns,motocommand_s(1:nss,3)','g',ns,motocommand_s(1:nss,4)',...
    'c',ns,motocommand_s(1:nss,5)','m',ns,motocommand_s(1:nss,6)','k');

xlabel('Time (ms)','fontsize',14);
ylabel('Motor command $\textbf{u}$ ($rad$)','Interpreter','latex','fontsize',16);
legend('IR','MR','SR','LR','IO','SO','fontsize',12);

%% plot the orientation and velocity

Orientation=2*atan(eyestate_s(1:3,:))*180/pi; % convertion from rad/2 to degree

figure,
plot(1:NofSample,Orientation(1,:)','b',1:NofSample,Orientation(2,:)','r',1:NofSample,Orientation(3,:)','g');

xlabel('Time(ms)','fontsize',14);
ylabel('Orientation (degree)','fontsize',14);
title('Orientation in the dataset','fontsize',14);
legend('${r}_x$','${r}_y$','${r}_z$','Interpreter','latex','fontsize',14);

Velocity=eyestate_s(4:6,:)*180/pi; % convert the velocity form radian/s to degree/sec

figure,
plot(1:NofSample,Velocity(1,:)','b',1:NofSample,Velocity(2,:)','r',1:NofSample,Velocity(3,:)','g');

xlabel('Time(ms)','fontsize',14);
ylabel('Velocity (d/s)','fontsize',14);
title('Velocity in the dataset','fontsize',14);
legend('$\dot{r}_x$','$\dot{r}_y$','$\dot{r}_z$','Interpreter','latex','fontsize',14);

%% plot the planes: XY, XZ and YZ

fullstated=[Orientation;Velocity];

maxsacclen=30;

% XY plane ------------------------------
figindx=10;
figure (figindx+1);
title('XY Plane','fontsize',16);
xlabel('r_x (deg)','fontsize',16);
ylabel('r_y (deg)','fontsize',16);
hold on

line(fullstated(1,1:end),fullstated(2,1:end),'LineWidth', 1.2,'Color',[1 0 0]);
scatter(fullstated(1,:),fullstated(2,:),0.5,'filled','MarkerEdgeColor',[1 0 0]);
xlim([-1*30 30])
ylim([-1*maxsacclen maxsacclen])
grid on
grid minor

% XZ plane ------------------------------
figure (figindx+2);
title('XZ Plane','fontsize',16);
xlabel('r_x (deg)','fontsize',16);
ylabel('r_z (deg)','fontsize',16);
hold on
line(fullstated(1,1:end-1),fullstated(3,1:end-1),'LineWidth', 1.2,'Color',[1 0 0]);
xlim([-1*maxsacclen maxsacclen])
ylim([-1*60 60])
grid on
grid minor

% YZ plane ------------------------------
figure (figindx+3);
title('YZ Plane','fontsize',16);
xlabel('r_z (deg)','fontsize',16);
ylabel('r_y (deg)','fontsize',16);
hold on
line(fullstated(3,1:end-1),fullstated(2,1:end-1),'LineWidth', 1.2,'Color',[1 0 0]);
xlim([-2*maxsacclen 2*maxsacclen])
ylim([-1*maxsacclen maxsacclen])
grid on
grid minor


