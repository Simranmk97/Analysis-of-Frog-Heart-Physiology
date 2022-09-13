%% Calibration of the transducer
clear all,clc

% No weight
test_file1 = readmatrix('Noweight.csv');
M = test_file1;
time = M(:,1); % part 4 units in ms
AI0 = M(:,2); 
AI1 = M(:,3) % transducer 

t1 = mean(AI1)

% 1.08 g
test_file2 = readmatrix('1_08g.csv');
M = test_file2;
time = M(:,1); % part 4 units in ms
AI0 = M(:,2); % transducer 
AI1 = M(:,3) % bipolar electrode

t2 = mean(AI1)

% 2.17 g
test_file3 = readmatrix('2_17g.csv');
M = test_file3;
time = M(:,1); % part 4 units in ms
AI0 = M(:,2); % transducer 
% AI1 = M(:,3) % bipolar electrode

t3 = mean(AI1)

% 3.26 g 

test_file4 = readmatrix('3_26g.csv');
M = test_file4;
time = M(:,1); % part 4 units in ms
% AI0 = M(:,2); % transducer 
AI1 = M(:,3) % bipolar electrode

t4 = mean(AI1)

% 4.22 g

test_file5 = readmatrix('4_22g.csv');
M = test_file5;
time = M(:,1); % part 4 units in ms
% AI0 = M(:,2); % transducer 
AI1 = M(:,3) % bipolar electrode

t5 = mean(AI1)

% 5.17 g

test_file6 = readmatrix('5_17g.csv');
M = test_file6;
time = M(:,1); % part 4 units in ms
% AI0 = M(:,2); % transducer 
AI1 = M(:,3) % bipolar electrode

t6 = mean(AI1)

% 6.22 g

test_file7 = readmatrix('6_22.csv');
M = test_file7;
time = M(:,1); % part 4 units in ms
% AI0 = M(:,2); % transducer 
AI1 = M(:,3) % bipolar electrode

t7 = mean(AI1)

% 10 g

test_file8 = readmatrix('10g.csv');
M = test_file8;
time = M(:,1); % part 4 units in ms
% AI0 = M(:,2); % transducer 
AI1 = M(:,3) % bipolar electrode

t8 = mean(AI1)

% 16.22 g

test_file9 = readmatrix('16_22g.csv');
M = test_file9;
time = M(:,1); % part 4 units in ms
% AI0 = M(:,2); % transducer 
AI1 = M(:,3) % bipolar electrode

t9 = mean(AI1)

% 20 g 

test_file10 = readmatrix('20g.csv');
M = test_file10;
time = M(:,1); % part 4 units in ms
% AI0 = M(:,2); % transducer 
AI1 = M(:,3) % bipolar electrode

t10 = mean(AI1)

Mass = [0;1.08;2.17;3.26;4.22;5.17;6.22;10;16.22;20]'
weight = Mass./1000
weight = weight*9.81
t = [t1;t2;t3;t4;t5;t6;t7;t8;t9;t10]'
plot(t,weight)
title('Transducer Calibration Plot')

% str = {'y = 0.000194x - 0.09908'}
% text(2,-0.095,str)

% %% Fit: 'untitled fit 1'.
% [xData, yData] = prepareCurveData( weight, t );
% 
% % Set up fittype and options.
% ft = fittype( 'poly1' );
% 
% % Fit model to data.
% [fitresult, gof] = fit( xData, yData, ft );
% 
% % Plot fit with data.
% figure( 'Name', 'Linear fit' );,
% h = plot( fitresult, xData, yData );
% legend( h, 'Transducer Force vs. Weight', 'Linear fit', 'Location', 'NorthEast', 'Interpreter', 'none' );
% % Label axes
% xlabel( 'Weight [g]', 'Interpreter', 'none' );
% ylabel( 'Transducer Force [N]', 'Interpreter', 'none' );
% title('Transducer Calibration plot')
% str = {'Linear: y = 0.000194x - 0.09908'}
% text(2,-0.095,str)
% grid on
% 
% set(gcf, 'units','inches','PaperPosition',[3,3,5,5])
% saveas(gcf,[('Trans_Calibration_Plot.png')])
% 

%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( t, weight );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'Force vs. Transducer', 'untitled fit 1', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'Transducer [V]', 'Interpreter', 'none' );
ylabel( 'Force [N]', 'Interpreter', 'none' );
title('Transducer Calibration Plot')
str = {'Linear: y = 0.06761x + 0.002026'}
text(0.5,0.16,str)
grid on


set(gcf, 'units','inches','PaperPosition',[3,3,5,5])
saveas(gcf,[('Trans_Calibration_Plot.png')])




%% Frank Starling Curve

clear all,clc

test_file1 = readmatrix('Baselineforstretch-F1-S2.csv')
M = test_file1
time = M(:,1) % part 4 units in ms
AI0 = M(:,2) % bipolar electrode
AI1 = M(:,3) % transducer 

AI1b = (0.06761.*(AI1)+0.002026)+0.52
plot(time,AI1b)
ylabel('Transducer [V]')
xlabel('Time [s]')
title('Baseline Stretch Data')

Tb = mean([0.0604669;0.061223;0.0608228])
pretb = 0
Tb = Tb - pretb

set(gcf, 'units','inches','PaperPosition',[3,3,5,5])
saveas(gcf,[('Baseline_Plot.png')])
%% Stretch 1mm
test_file2 = readmatrix('Stretch-1mm-F1-S2.csv')
M = test_file2
time = M(:,1) % part 4 units in ms
AI0 = M(:,2) % transducer 
AI1 = M(:,3) % bipolar electrode

AI11 = (0.06761.*(AI1)+0.002026)+0.52
% plot(time,AI11,time, AI1b)

% stretch 8mm

test_file2 = readmatrix('Stretch-8mm-F1-S2.csv')
C = test_file2
time = C(:,1) % part 4 units in ms
AI0 = C(:,2) % transducer 
AI1 = C(:,3) % bipolar electrode

AI18 = (0.06761.*(AI1)+0.002026)+0.52
% plot(time,AI18)

% stretch 11 mm

test_file2 = readmatrix('Stretch-11mm-F1-S2.csv')
M = test_file2
time = M(:,1) % part 4 units in ms
AI0 = M(:,2) % transducer 
AI1 = M(:,3) % bipolar electrode

AI111 = (0.06761.*(AI1)+0.002026)+0.52

plot(time,AI1b,time,AI11,time,AI18,time,AI111,'LineWidth',1)
ylabel('Transducer Force [N]')
xlabel('Time [s]')
title('Increasing Force Magnitudes')
legend({'Baseline','1 mm Stretch','8 mm Stretch','11 mm Stretch'},'Location','northeast');

T1 = mean([0.129735;0.128245;0.127533])
pret1 = mean([0.038475;0.0293354;0.0294466])
T1 = T1 - pret1

set(gcf, 'units','inches','PaperPosition',[3,3,5,5])
saveas(gcf,[('Stretch_Plot.png')])


%% Stretch 2mm
test_file2 = readmatrix('Stretch-2mm-F1-S2.csv')
M = test_file2
time = M(:,1) % part 4 units in ms
AI0 = M(:,2) % transducer 
AI1 = M(:,3) % bipolar electrode

AI12 = (0.06761.*(AI1)+0.002026)+0.52
plot(time,AI12)
plot(time,AI12,time,AI1b)
ylabel('Transducer [V]')
xlabel('Time [s]')
title('2 mm Stretch Data')
legend({'2 mm stretch','Baseline'},'Location','Best');
T2 = mean([0.0581988;0.05775761;0.0578207])
pret2 = 0
T2 = T2 - pret2

set(gcf, 'units','inches','PaperPosition',[3,3,5,5])
saveas(gcf,[('Strectch2mm_Plot.png')])
%% Stretch 5mm
test_file2 = readmatrix('Stretch-5mm-F1-S2.csv')
M = test_file2
time = M(:,1) % part 4 units in ms
AI0 = M(:,2) % transducer 
AI1 = M(:,3) % bipolar electrode

AI15 = (0.06761.*(AI1)+0.002026)+0.52
plot(time,AI15)
plot(time,AI15,'b',time, AI1b)
ylabel('Transducer [V]')
xlabel('Time [s]')
title('5 mm Stretch Data')
legend({'5 mm stretch','Baseline'},'Location','Best');
T5 = mean([0.0802355;0.079079;0.0789889])
pret5 = mean([0.0211967;0.0200848;0.0192621])
T5 = T5 - pret5

set(gcf, 'units','inches','PaperPosition',[3,3,5,5])
saveas(gcf,[('Strectch5mm_Plot.png')])
%% Stretch 8mm
test_file2 = readmatrix('Stretch-8mm-F1-S2.csv')
M = test_file2
time = M(:,1) % part 4 units in ms
AI0 = M(:,2) % transducer 
AI1 = M(:,3) % bipolar electrode

AI18 = (0.06761.*(AI1)+0.002026)+0.52
plot(time,AI18)
plot(time,AI18,time, AI1b)

T8 = mean([0.201871;0.199691;0.200937])
pret8 = mean([0.092778;0.09202;0.0927326])
T8 = T8 - pret8
%% Stretch 11mm
test_file2 = readmatrix('Stretch-11mm-F1-S2.csv')
M = test_file2
time = M(:,1) % part 4 units in ms
AI0 = M(:,2) % transducer 
AI1 = M(:,3) % bipolar electrode

AI110 = (0.06761.*(AI1)+0.002026)+0.52
plot(time,AI110)
plot(time,AI110,time, AI1b)

T11 = mean([0.212255;0.213745;0.215479])
pret11 = mean([0.094023,0.094153,0.093822])
T11 = T11 - pret11

%plot 

Tension = [Tb T1 T8 T11]
PreT = [pretb pret1 pret8 pret11]

plot(PreT,Tension,'b-o','LineWidth',1)
ylabel('Contraction Tension [N]')
xlabel('Pretension [N]')
title('Frank-Starling Measurements')
set(gcf, 'units','inches','PaperPosition',[3,3,5,5])
saveas(gcf,[('TensionvsPretension_7 points.png')])


%% Response to Drugs

clear all,clc

% Ach 1mM
test_file = readmatrix('Baseline1-F1-S2.csv');
test_file1 = readmatrix('Ach-1mM-F1-S2.csv');
M = test_file1;
time = M(:,1); % part 4 units in ms
AI0 = M(:,2); % bipolar electrode
AI1 = M(:,3) % transducer 

X = test_file;
time = X(:,1); % part 4 units in ms
AI0b = X(:,2); % bipolar electrode
AI1b = X(:,3) % transducer 

AI1 = (0.06761.*(AI1)+0.002026)+0.518
AI1b = (0.06761.*(AI1b)+0.002026)+0.518

subplot(4,1,1)
plot(time,AI0b)
ylabel('ECG [V]')
xlabel('Time [s]')
legend({'Baseline'},'Location','northeast');
subplot(4,1,2)
plot(time,AI0,'r')
ylabel('ECG [V]')
xlabel('Time [s]')
legend({'Ach 1mM'},'Location','northeast');
subplot(4,1,3)
plot(time,AI1b)
ylabel('Force [N]')
xlabel('Time [s]')
legend({'Baseline'},'Location','northeast');
subplot(4,1,4)
plot(time,AI1,'r')
ylabel('Force [N]')
xlabel('Time [s]')
legend({'Ach 1mM'},'Location','northeast');
sgtitle('Response to Acetylcholine 1mM in ECG and Transducer Force')

% saveas(gcf,'Ach_1mM.png')
%% Representative Baseline ECG
plot(time,AI0b)
ylabel('ECG [V]')
xlabel('Time [s]')
legend({'Baseline'},'Location','northeast');
title('ECG of Frog Heart')

saveas(gcf,'Representative Baseline ECG.png')
%% ACh 5mM

clear all,clc

% Ach 5mM
test_file = readmatrix('Baseline1-F1-S2.csv');
test_file1 = readmatrix('Ach-5mM-F1-S2.csv');
M = test_file1;
time = M(:,1); % part 4 units in ms
AI0 = M(:,2); % bipolar electrode
AI1 = M(:,3) % transducer 

X = test_file; % baseline data
time = X(:,1); % part 4 units in ms
AI0b = X(:,2); % bipolar electrode
AI1b = X(:,3) % transducer 

AI1 = (0.06761.*(AI1)+0.002026)+0.518
AI1b = (0.06761.*(AI1b)+0.002026)+0.518

subplot(4,1,1)
plot(time,AI0b)
ylabel('ECG [V]')
xlabel('Time [s]')
legend({'Baseline'},'Location','northeast');
subplot(4,1,2)
plot(time,AI0,'r')
ylabel('ECG [V]')
xlabel('Time [s]')
legend({'Ach 5mM'},'Location','northeast');
subplot(4,1,3)
plot(time,AI1b)
ylabel('Force [N]')
xlabel('Time [s]')
legend({'Baseline'},'Location','northeast');
subplot(4,1,4)
plot(time,AI1,'r')
ylabel('Force [N]')
xlabel('Time [s]')
legend({'Ach 5mM'},'Location','northeast');
sgtitle('Response to Acetylcholine 5 mM in ECG and Transducer Force')

saveas(gcf,'Ach_5mM.png')



%% ACh 10mM

clear all,clc

% Ach 10mM
test_file = readmatrix('Baseline1-F1-S2.csv');
test_file1 = readmatrix('Ach-10mM-F1-S2.csv');
M = test_file1;
time = M(:,1); % part 4 units in ms
AI0 = M(:,2); % bipolar electrode
AI1 = M(:,3) % transducer 

X = test_file; % baseline data
time = X(:,1); % part 4 units in ms
AI0b = X(:,2); % bipolar electrode
AI1b = X(:,3) % transducer 

AI1 = (0.06761.*(AI1)+0.002026)+0.518
AI1b = (0.06761.*(AI1b)+0.002026)+0.518

subplot(4,1,1)
plot(time,AI0b)
ylabel('ECG [V]')
xlabel('Time [s]')
legend({'Baseline'},'Location','northeast');
subplot(4,1,2)
plot(time,AI0,'r')
ylabel('ECG [V]')
xlabel('Time [s]')
legend({'Ach 10 mM'},'Location','northeast');
subplot(4,1,3)
plot(time,AI1b)
ylabel('Force [N]')
xlabel('Time [s]')
legend({'Baseline'},'Location','northeast');
subplot(4,1,4)
plot(time,AI1,'r')
ylabel('Force [N]')
xlabel('Time [s]')
legend({'Ach 10 mM'},'Location','northeast');
sgtitle('Response to Acetylcholine 10 mM in ECG and Transducer Force')

% saveas(gcf,'Ach_10mM.png')

%% Atropine 1 mg/ml

clear all,clc
test_file = readmatrix('Baseline2-F1-S2.csv');
test_file1 = readmatrix('Atropine-F1-S2.csv');
M = test_file1;
time = M(:,1); % part 4 units in ms
AI0 = M(:,2); % bipolar electrode
AI1 = M(:,3) % transducer 

X = test_file; % baseline data
time = X(:,1); % part 4 units in ms
AI0b = X(:,2); % bipolar electrode
AI1b = X(:,3) % transducer 

AI1 = (0.06761.*(AI1)+0.002026)+0.53
AI1b = (0.06761.*(AI1b)+0.002026)+0.53

subplot(4,1,1)
plot(time,AI0b)
ylabel('ECG [V]')
xlabel('Time [s]')
legend({'Baseline'},'Location','northeast');
subplot(4,1,2)
plot(time,AI0,'r')
ylabel('ECG [V]')
xlabel('Time [s]')
legend({'Atropine 1 mg/ml'},'Location','northeast');
subplot(4,1,3)
plot(time,AI1b)
ylabel('Force [N]')
xlabel('Time [s]')
legend({'Baseline'},'Location','northeast');
subplot(4,1,4)
plot(time,AI1,'r')
ylabel('Force [N]')
xlabel('Time [s]')
legend({'Atropine 1 mg/ml'},'Location','northeast');
sgtitle('Response to Atropine 1 mg/ml in ECG and Transducer Force')

% saveas(gcf,'Atropine_1_mgml.png')

%% Cadmium Chloride 0.5 mM

clear all,clc
test_file = readmatrix('Baseline3-F1-S2.csv');
test_file1 = readmatrix('Cadmiumchloride-F1-S2.csv');
M = test_file1;
time = M(:,1); % part 4 units in ms
AI0 = M(:,2); % bipolar electrode
AI1 = M(:,3) % transducer 

X = test_file; % baseline data
time = X(:,1); % part 4 units in ms
AI0b = X(:,2); % bipolar electrode
AI1b = X(:,3) % transducer 

AI1 = (0.06761.*(AI1)+0.002026)+0.507
AI1b = (0.06761.*(AI1b)+0.002026)+0.507

subplot(4,1,1)
plot(time,AI0b)
ylabel('ECG [V]')
xlabel('Time [s]')
legend({'Baseline'},'Location','northeast');
subplot(4,1,2)
plot(time,AI0,'r')
ylabel('ECG [V]')
xlabel('Time [s]')
legend({'CdCl2 0.5 mM'},'Location','northeast');
subplot(4,1,3)
plot(time,AI1b)
ylabel('Force [N]')
xlabel('Time [s]')
legend({'Baseline'},'Location','northeast');
subplot(4,1,4)
plot(time,AI1,'r')
ylabel('Force [N]')
xlabel('Time [s]')
legend({'CdCl2 0.5 mM'},'Location','northeast');
sgtitle('Response to Cadmium Chloride 0.5 mM in ECG and Transducer Force')

% saveas(gcf,'Cadmium_Chloride_0.5mM.png')


%% Caffeine 30 mM

clear all,clc
test_file = readmatrix('Baseline4-F1-S2.csv');
test_file1 = readmatrix('Caffeine-F1-S2.csv');
M = test_file1;
time = M(:,1); % part 4 units in ms
AI0 = M(:,2); % bipolar electrode
AI1 = M(:,3) % transducer 

X = test_file; % baseline data
time = X(:,1); % part 4 units in ms
AI0b = X(:,2); % bipolar electrode
AI1b = X(:,3) % transducer 

AI1 = (0.06761.*(AI1)+0.002026)+0.472453
AI1b = (0.06761.*(AI1b)+0.002026)+0.472453

subplot(4,1,1)
plot(time,AI0b)
ylabel('ECG [V]')
xlabel('Time [s]')
legend({'Baseline'},'Location','northeast');
subplot(4,1,2)
plot(time,AI0,'r')
ylabel('ECG [V]')
xlabel('Time [s]')
legend({'Caffeine 30 mM'},'Location','northeast');
subplot(4,1,3)
plot(time,AI1b)
ylabel('Force [N]')
xlabel('Time [s]')
legend({'Baseline'},'Location','northeast');
subplot(4,1,4)
plot(time,AI1,'r')
ylabel('Force [N]')
xlabel('Time [s]')
legend({'Caffeine 30 mM'},'Location','northeast');
sgtitle('Response to Caffeine 30 mM in ECG and Transducer Force')

% saveas(gcf,'Caffeine 30 mM.png')



%% Cold Ringer's Solution (CRS)

clear all,clc
test_file = readmatrix('Baseline5-F1-S2.csv');
test_file1 = readmatrix('ColdFRS-F1-S2.csv');
M = test_file1;
time = M(:,1); % part 4 units in ms
AI0 = M(:,2); % bipolar electrode
AI1 = M(:,3) % transducer 

X = test_file; % baseline data
time = X(:,1); % part 4 units in ms
AI0b = X(:,2); % bipolar electrode
AI1b = X(:,3) % transducer 

AI1 = (0.06761.*(AI1)+0.002026)+0.52462
AI1b = (0.06761.*(AI1b)+0.002026)+0.52462

subplot(4,1,1)
plot(time,AI0b)
ylabel('ECG [V]')
xlabel('Time [s]')
legend({'Baseline'},'Location','northeast');
subplot(4,1,2)
plot(time,AI0,'r')
ylabel('ECG [V]')
xlabel('Time [s]')
legend({'CRS'},'Location','northeast');
subplot(4,1,3)
plot(time,AI1b)
ylabel('Force [N]')
xlabel('Time [s]')
legend({'Baseline'},'Location','northeast');
subplot(4,1,4)
plot(time,AI1,'r')
ylabel('Force [N]')
xlabel('Time [s]')
legend({'CRS'},'Location','northeast');
sgtitle('Response to Cold Ringer''s Solution (CRS) in ECG and Transducer Force')

% saveas(gcf,'CRS.png')

%% Epinephrine 50 microM

clear all,clc
test_file = readmatrix('Baseline6-F1-S2.csv');
test_file1 = readmatrix('Epinephrine-F1-S2.csv');
M = test_file1;
time = M(:,1); % part 4 units in ms
AI0 = M(:,2); % bipolar electrode
AI1 = M(:,3) % transducer 

X = test_file; % baseline data
time = X(:,1); % part 4 units in ms
AI0b = X(:,2); % bipolar electrode
AI1b = X(:,3) % transducer 

AI1 = (0.06761.*(AI1)+0.002026)+0.454752
AI1b = (0.06761.*(AI1b)+0.002026)+0.454752

subplot(4,1,1)
plot(time,AI0b)
ylabel('ECG [V]')
xlabel('Time [s]')
legend({'Baseline'},'Location','northeast');
subplot(4,1,2)
plot(time,AI0,'r')
ylabel('ECG [V]')
xlabel('Time [s]')
legend({'Epi'},'Location','northeast');
subplot(4,1,3)
plot(time,AI1b)
ylabel('Force [N]')
xlabel('Time [s]')
legend({'Baseline'},'Location','northeast');
subplot(4,1,4)
plot(time,AI1,'r')
ylabel('Force [N]')
xlabel('Time [s]')
legend({'Epi'},'Location','northeast');
sgtitle('Response to Epinephrine 50 \muM in ECG and Transducer Force')
% 
% saveas(gcf,'Epinephrine.png')




%% KCL 1M
clear all,clc
test_file = readmatrix('Baseline7-F1-S2.csv');
test_file1 = readmatrix('KCL-F1-S2-2.csv');
M = test_file1;
time = M(:,1); % part 4 units in ms
AI0 = M(:,2); % bipolar electrode
AI1 = M(:,3) % transducer 

X = test_file; % baseline data
time = X(:,1); % part 4 units in ms
AI0b = X(:,2); % bipolar electrode
AI1b = X(:,3) % transducer 

AI1 = (0.06761.*(AI1)+0.002026)+0.52104
AI1b = (0.06761.*(AI1b)+0.002026)+0.52104

subplot(4,1,1)
plot(time,AI0b)
ylabel('ECG [V]')
xlabel('Time [s]')
legend({'Baseline'},'Location','northeast');
subplot(4,1,2)
plot(time,AI0,'r')
ylabel('ECG [V]')
xlabel('Time [s]')
legend({'KCL'},'Location','northeast');
subplot(4,1,3)
plot(time,AI1b)
ylabel('Force [N]')
xlabel('Time [s]')
legend({'Baseline'},'Location','northeast');
subplot(4,1,4)
plot(time,AI1,'r')
ylabel('Force [N]')
xlabel('Time [s]')
legend({'KCL'},'Location','northeast');
sgtitle('Response to KCL 1M in ECG and Transducer Force')

% saveas(gcf,'KCL.png')

%% Percentage change in EMG and Force

heartrp = [28;18.75;7.6;4;13;4]

Forcepc = [78;58;3.485;18;11;3]

Index = [1;2;3;4;5;6]

plot(Index,heartrp,'o','Linewidth',2)

hold on

plot(Index,Forcepc,'o','Linewidth',2)
ylabel('Percentage Change [%]')
xlabel('Index of Drug')
legend({'% Change in Heart Rate','% Change in Force Contraction'},'Location','Best');
title('% Change in Heart Rate and Contraction Force from Baseline')

text(1,28,'\leftarrow ACh','FontSize',10,'Color','b')
text(Index(2),heartrp(2),'\leftarrow Atropine','FontSize',10,'Color','b')
text(Index(3),heartrp(3),'\leftarrow CdCl2','FontSize',10,'Color','b')
text(Index(4),heartrp(4),'\leftarrow Caffeine','FontSize',10,'Color','b')
text(Index(5),heartrp(5),'\leftarrow CRS','FontSize',10,'Color','b')
text(Index(6),heartrp(6),'\leftarrow Epi','FontSize',10,'Color','b')


text(Index(1),Forcepc(1),'\leftarrow ACh','FontSize',10,'Color','r')
text(Index(2),Forcepc(2),'\leftarrow Atropine','FontSize',10,'Color','r')
text(Index(3),Forcepc(3),'\leftarrow CdCl2','FontSize',10,'Color','r')
text(Index(4),Forcepc(4),'\leftarrow Caffeine','FontSize',10,'Color','r')
text(Index(5),Forcepc(5),'\leftarrow CRS','FontSize',10,'Color','r')
text(Index(6),Forcepc(6),'\leftarrow Epi','FontSize',10,'Color','r')

saveas(gcf,'Percentage_Change.png')

















