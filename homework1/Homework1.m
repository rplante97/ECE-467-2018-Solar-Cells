%% Question 1 Calculate total solar insolation in units of kWh/m^2 and peak sun hours (psh)
data = xlsread('Homework1Q1.xls'); %Col 1: Time, Col 2: Irradiance in W/m^2
time = (0:.25:23.75); %Fix for time
data(:, 1) = time;

%Calculate total solar irradiation (kWh/m^2):
data2 = reshape(data(:,2), 4, [])'; %Reshape Matrix so each row contains 1 hours worth of values
wattHours = sum(data2, 2)/4; %sum each column and divide by 4 to get avg W/m^2 each hour
totalInsolationKWH = sum(wattHours)/1000 %sum all the rows to get total kWh/m^2, divide by 1000 to get total kWh/m^2

%Calculate total solar irradiation (psh): (trapz() does all of the above work for us)
totalInsolationPSH = trapz(data(:,1), data(:,2))/1000 %psh are exactly equal to kWh/m^2 units

%% Question 2 Percentage of solar energy absorbed by solar cell (a) in orono (b) in space
%Col 1: Wvlgth nm
%Col 2: Etr W*m-2*nm-1
%Col 3: Global tilt  W*m-2*nm-1
%Col 4: Direct+circumsolar W*m-2*nm-1
data = xlsread('ASTMG173.xls', 'SMARTS2'); 
%Earth (global tilt column)
totalSolarEnergyEarth = trapz(data(:,1), data(:,3)); %Total energy of entire solar spectrum in global tilt column
data2 = data(data(:,1) < 1100, :); %Contains only the values between 280nm and 1100nm
energyBelow1100Earth = trapz(data2(:,1), data2(:,3)); %Energy between 280nm and 1100nm in global tilt column
percentEnergyOrono = (energyBelow1100Earth/totalSolarEnergyEarth)*100

%Space (etr column)
totalSolarEnergySpace = trapz(data(:,1), data(:,2));
energyBelow1100Space = trapz(data2(:,1), data2(:,2));
percentEnergySpace = (energyBelow1100Space/totalSolarEnergySpace)*100

%% Question 3 Different solar collector designs preformance in Caribou, ME and Flagstaff, AZ
%Maine
Maine0TiltFixedAnnualAvg = 3.6;
MaineLatTiltFixedAnnualAvg = 4.2;
Maine2AxisTrackingAnnualAvg = 5.6;
MaineLatitudeTiltPercentImprovement = ((MaineLatTiltFixedAnnualAvg/Maine0TiltFixedAnnualAvg)-1)*100
Maine2AxisTrackPercentImprovementOverTilt = ((Maine2AxisTrackingAnnualAvg/MaineLatTiltFixedAnnualAvg)-1)*100
%Arizona
Arizona0TiltFixedAnnualAvg = 5.1;
ArizonaLatTiltFixedAnnualAvg = 6.0;
Arizona2AxisTrackingAnnualAvg = 8.4;
ArizonaLatitudeTiltPercentImprovement = ((ArizonaLatTiltFixedAnnualAvg/Arizona0TiltFixedAnnualAvg)-1)*100
Arizona2AxisTrackPercentImprovementOverTilt = ((Arizona2AxisTrackingAnnualAvg/ArizonaLatTiltFixedAnnualAvg)-1)*100