# Heart Disease Prediction
Authors: Emily Ahn, Divya Bilolikar, Ryan Peng, Niki Zamani

## Summary
Common heart diseases include disease of the blood vessel, arrhythmia (irregular beating of the heart), disease of the heart valve and muscle, infection of the heart, and heart defects from birth. The symptoms of heart diseases are often times unnoticeable and most are only diagnosed after a heart attack,heart failure, or stroke. In this project, we want to be able to predict if someone is at risk of a heart disease based on the variables given in the dataset.

## Dependencies
List of dependencies to run the analysis:
1. Tidyverse package in version 1.3.1
2. Tidymodels package in verron 0.1.4 
3. GGally package in version 2.1.2 
4. Testthat package in version 3.1.2
5. KKNN package in version 1.3.1
6. Bookdown package in version 0.25
7. Docopt package in version 0.7.1
8. Rmarkdown package in version 2.13


## Running the Analysis
To run this analysis first you will need to get a copy of the environment that this analysis was created in. First go to https://hub.docker.com create an account and download the docker application. Open Docker then in terminal run the following command

```
docker pull rpeng35/dsci-310_group_2:v0.10.0
```

Then run the code below to install the required dependncies on your machine.

```
docker run --rm -it -p 8888:8888 rpeng35/dsci-310_group_2:v0.10.0
```
If you run the above code and terminal says something about that port already being allocated then simply change the 8888 BEFORE the colon to any other 4 digit number.

Then, open up a web browser provided in your terminal and access JupyterLab.

To clone the repository you can either clone it in the terminal command line or clone it through thr JupyterLab GUI. To clone it using the terminal command line follow the isntructions provided in this link:
https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository

To clone the repository using JupyterLab first ensure that you are in the root directory of your computer. Then navigate to the git button (diamond shape) on the left side menu bar and click on the button that says "Clone a Repository". Then paste the HTTPS link that can be found on the main page of this repository (https://github.com/DSCI-310/DSCI-310-Group-2) when you click on the green code button.

## License
Licensed under the MIT License and 

<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a><br />
<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:1" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br />
