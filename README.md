# EyeMotorCommand
This dataset contains motor command of a simulated eye model with 6 motors that's mentioned in the paper [link](https://arxiv.org/abs/2203.00488). This work is a part of the ERC advanced grant project Orient [link](https://cordis.europa.eu/project/id/693400)

## Download

The datase is provided in a single **.mat file** with size 1.07 GB. The file is uploaded in Kaggle, please find it in this [link](https://www.kaggle.com/datasets/rezajavanmard/eye-motorcommand-dataset) 


## Eye model

In figure a) a representation of the **right human eye** with its six extra-ocular muscles is shown. The muscles can rotate the eye in any three-dimensional orientation
around its fixed center of rotation. The right-handed head-fixed reference frame of Listing (arrowheads) shows the three cardinal axes: **horizontal (y), vertical (z) and torsional (x)**, respectively. Figure b) shows a cable-driven simulated righ human eye deviated from straigh ahead origin. To set the eye in different orientation cables are polling the eyeball to different direction according to the axis defined on the eye. **MR** and **LR** are Medial and Lateral Rectus, **SR** and **IR** Superior and Inferior Rectus, **SO** and **IO** Superior and Inferior Oblique.

<p float="left">
[a]<img src="https://user-images.githubusercontent.com/4155147/184099676-587f885f-f90d-46c2-b1d1-bceab9402782.PNG" width="350" height="350">
[b]<img src="https://user-images.githubusercontent.com/4155147/184099710-8d8e9a51-3c40-4330-bc9b-d9bf85383072.png" width="350" height="250">
</p>

## Main Features
- 2 × 106 ms of random motor responses on the 6 motots.
- Velocity of the motors.
- Orientation of the eye in 3D space.

Figure below shows a selected section of random motor responses over 3000 ms

<img src="https://user-images.githubusercontent.com/4155147/184104496-f34c603d-fac1-49c7-bf4d-31151070856f.png" width="318" height="248">

## Data format

The .mat file contains several variables: 
* 6D eye position (state vector) in **horizontal (y), vertical (z) and torsional (x)** and their corresponding orientation.
* 6D motor command corresponding to **IR, MR, SR,LR, IO, SO** 

Other variables:
* Force of the motor commands

## Reading the dataset

To read the dataser you can use 'datasetloader.m' file in the current repository [Link](https://github.com/Reza64/Eye_MotorCommand_Dataset/blob/main/datasetloader.m). 
Some of the output plots are shown in the following. It is obvious from the plots that in the dataset the range of the eye movement in torsional (x) direction is approximately (-15,+15), in horizontal axix y (vertical eye movement) is app. (-25,+25), and in vertical axis x (horizontal eye movement) is app. (-60,+60). 

<p float="left">
[a]<img src="https://user-images.githubusercontent.com/4155147/184123487-6a493258-c294-4e90-be5c-1f68eeeebb9b.png" width="350" height="300">
[b]<img src="https://user-images.githubusercontent.com/4155147/184123755-09719da0-d6b9-4e77-8925-250430f8496d.png" width="350" height="300">
</p>

The code for generating the above plots is as below:

```
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
```


## Attribution

If you use our dataset, please cite it following paper:
```
  @article{https://doi.org/10.48550/arxiv.2203.00488,
  doi = {10.48550/ARXIV.2203.00488},  
  url = {https://arxiv.org/abs/2203.00488},  
  author = {Alitappeh, Reza Javanmard and John, Akhil and Dias, Bernardo and van Opstal, A. John and Bernardino, Alexandre},    
  title = {Emergence of human oculomotor behavior from optimal control of a cable-driven biomimetic robotic eye},  
  publisher = {arXiv},  
  year = {2022},  
  copyright = {Creative Commons Attribution 4.0 International}
  }
```
