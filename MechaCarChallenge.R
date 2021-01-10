library(dplyr)
mecha_car <- read.csv('MechaCar_mpg.csv') #import dataset
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mecha_car) #generate multiple linear regression model

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mecha_car)) #generate summary statistics

suspension_coil <- read.csv('Suspension_Coil.csv') #import dataset

?summarize()

total_summary <- suspension_coil %>%  summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

sample_table <- suspension_coil %>% sample_n(50)
t.test(sample_table$PSI, mu=mean(suspension_coil$PSI))

t.test(subset(suspension_coil$PSI,suspension_coil$Manufacturing_Lot == "Lot1"), mu=total_summary$Mean)
t.test(subset(suspension_coil$PSI,suspension_coil$Manufacturing_Lot == "Lot2"), mu=total_summary$Mean)
t.test(subset(suspension_coil$PSI,suspension_coil$Manufacturing_Lot == "Lot3"), mu=total_summary$Mean)
