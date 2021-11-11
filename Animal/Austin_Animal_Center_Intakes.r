setwd('D:/work3')


# libraries needed
library(ggplot2)
library(cowplot)
library(tidyverse)

# load the data that we are to use here 
animal <- read.csv("D:/work3/Animal/Austin_Animal_Center_Intakes.csv",stringsAsFactors = FALSE)
head(animal)

# summary of the data 
summary(animal)

# check missing Data 
sum(is.na(animal))


# Panel plots
plot(animal)
plot(animal, col = "red")



Name <- animal['Name']
location<- animal['Found.Location']
location

type <- animal['Intake.Type']
type



condition <- animal['Intake.Condition']
condition

animal_type <- animal['Animal.Type']
animal_type
sex <- animal['Sex.upon.Intake']
sex
age <- animal['Age.upon.Intake']
age

pie(age)

color <- animal['Color']
color

Breeds <- dogs['Breed']
Breeds
