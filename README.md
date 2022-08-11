# EyeMotorCommand
This dataset contains motor command of a simulated eye model with 6 motors that's mentioned in the paper [link](https://arxiv.org/abs/2203.00488). This work is a part of the ERC advanced grant project Orient [link]()

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

To read the dataser you can use 'datasetloader.m' file in the current repository [Link](https://github.com/Reza64/Eye_MotorCommand_Dataset/blob/main/datasetloader.m)
Some of the output plots will be as following:
<p float="left">
[a]<img src="https://user-images.githubusercontent.com/4155147/184123487-6a493258-c294-4e90-be5c-1f68eeeebb9b.png" width="350" height="350">
[b]<img src="https://user-images.githubusercontent.com/4155147/184123168-eda26d31-99e0-4b0b-b3e4-6617581efc05.png" width="350" height="250">
</p>

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
