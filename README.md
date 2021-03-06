# Heart Disease Prediction
Authors: Emily Ahn, Divya Bilolikar, Ryan Peng, Niki Zamani

## Summary
Common heart diseases include disease of the blood vessel, arrhythmia (irregular beating of the heart), disease of the heart valve and muscle, infection of the heart, and heart defects from birth. The symptoms of heart diseases are often times unnoticeable and most are only diagnosed after a heart attack,heart failure, or stroke. In this project, we want to be able to predict if someone is at risk of a heart disease based on the variables given in the dataset.

## Dependencies
List of dependencies to run the analysis:
1.  Tidyverse package in version 1.3.1
2.  Tidymodels package in verron 0.1.4 
3.  GGally package in version 2.1.2 
4.  Testthat package in version 3.1.2
5.  KKNN package in version 1.3.1
6.  Bookdown package in version 0.25
7.  Docopt package in version 0.7.1
8.  Rmarkdown package in version 2.13
9.  Tinytex package in version 0.37
10. knitr package in version 1.37
11. magrittr package in version 2.0.3
12. dpylr package in version 1.0.8
13. rlang package in version 1.0.2
14. ggthemes package in version 4.2.4
15. DSCI-310-Group-2-packages in commit version b84b149a87babfce4111cc6b9a06dd01e2677509


## Running the Analysis

There are two ways to run this analysis. 

The first way is to use docker. You will need to get a copy of the environment that this analysis was created in. Go to https://hub.docker.com create an account and download the docker application. Open Docker then in terminal run the following command

```
docker pull rpeng35/dsci-310_group_2:v0.26.0
```

Then run the code below to install the required dependncies on your machine.

```
docker run --rm -it -p 8888:8888 -v /$(pwd):/opt/notebooks rpeng35/dsci-310_group_2:v0.26.0
```
If you run the above code and terminal says something about that port already being allocated then simply change the 8888 BEFORE the colon to any other 4 digit number.

Then, open up a web browser provided in your terminal and access JupyterLab.

To clone the repository you can either clone it in the terminal command line or clone it through the JupyterLab GUI. To clone it using the terminal command line follow the isntructions provided in this link:
https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository

To clone the repository using JupyterLab first ensure that you are in the root directory of your computer. Then navigate to the git button (diamond shape) on the left side menu bar and click on the button that says "Clone a Repository". Then paste the HTTPS link that can be found on the main page of this repository (https://github.com/DSCI-310/DSCI-310-Group-2) when you click on the green code button.

To generate the HTML and PDF run the following.

```
make all
```
Then to remove all of the files created by that (such as the results folder), run following
```
make clean
```

Depending on the computer you are using to run the analysis, after you run ```make all``` you may recieve an error that looks like the following
<img width="745" alt="error" src="https://user-images.githubusercontent.com/66176164/162491977-88a00110-9abf-4ad2-9726-a31c281fe6d3.png">

If this happens you will need to run the analyis as described below.

The second way to run this analysis does not use docker. 

This can be done by cloning the repository (as described above or any other way you feel comfortable) on a local application you have (such as VScode, RStudio, JupyterLab, etc) and locally installing the dependencies listed above. Then navigate to the root of this project (best done using the command line) and run the following command
```
make all
```
Then to remove all of the files created by that (such as the results folder), run following
```
make clean
```


## License
Licensed under the MIT License and 

<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a><br />
<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:1" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br />
