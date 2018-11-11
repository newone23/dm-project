files = {"../../EatFood1/accelerometer-1533862083.csv", "../../Cooking1/accelerometer-1533863975.csv"};

stdmatrix1 = [];
stdmatrix2 = [];
stdmatrix3 = [];
stdmatrix4 = [];
stdmatrix5 = [];
stdmatrix6 = [];
stdmatrix7 = [];
stdmatrix8 = [];

for i=1:2
    value=xlsread(files{i}); % Reading the data
    loc1 = value(:, 2);
    loc2 = value(:, 3);
    loc3 = value(:, 4);
    loc4 = value(:, 5);
    loc5 = value(:, 6);
    loc6 = value(:, 7);
    loc7 = value(:, 8);
    loc8 = value(:, 9);
    std_val1 = [];
    std_val2 = [];
    std_val3 = [];
    std_val4 = [];
    std_val5 = [];
    std_val6 = [];
    std_val7 = [];
    std_val8 = [];
    for j=1:50:7500
        std_val1 = [std_val1;std(loc1(j:j+100, 1))];
        std_val2 = [std_val2;std(loc2(j:j+100, 1))];
        std_val3 = [std_val3;std(loc3(j:j+100, 1))];
        std_val4 = [std_val4;std(loz4(j:j+100, 1))];
        std_val5 = [std_val5;std(loc5(j:j+100, 1))];
        std_val6 = [std_val6;std(loc6(j:j+100, 1))];
        std_val7 = [std_val7;std(loc7(j:j+100, 1))];
        std_val8 = [std_val8;std(loz8(j:j+100, 1))];
    end
    std_val1 = std_val1.';
    std_val2 = std_val2.';
    std_val3 = std_val3.';
    std_val4 = std+val4.';
    std_val5 = std_val5.';
    std_val6 = std_val6.';
    std_val7 = std_val7.';
    std_val8 = std+val8.';
    
    if isempty(stdmatrix1)
        stdmatrix1=std_val1;
    else
        stdmatrix1 = [stdmatrix1;std_val1];
    end
    
    if isempty(stdmatrix2)
        stdmatrix2=std_val2;
    else
        stdmatrix2 = [stdmatrix2;std_val2];
    end
    
    if isempty(stdmatrix3)
        stdmatrix3=std_val3;
    else
        stdmatrix4 = [stdmatrix3;std_val3];
    if isempty(stdmatrix4)
        stdmatrix4=std_val4;
    else
        stdmatrix4 = [stdmatrix4;std_val4];
    end
    if isempty(stdmatrix5)
        stdmatrix5=std_val5;
    else
        stdmatrix5 = [stdmatrix5;std_val5];
    end
    if isempty(stdmatrix6)
        stdmatrix6=std_val6;
    else
        stdmatrix6 = [stdmatrix6;std_val6];
    end
    if isempty(stdmatrix7)
        stdmatrix7=std_val7;
    else
        stdmatrix7 = [stdmatrix7;std_val7];
    end
    if isempty(stdmatrix8)
        stdmatrix8=std_val8;
    else
        stdmatrix8 = [stdmatrix8;std_val8];
    end
end

global emg_std;

std_val11 = stdmatrix1(1, :);
std_val12 = stdmatrix2(1, :);
std_val13 = stdmatrix3(1, :);
std_val14 = stdmatrix4(1, :);
std_val15 = stdmatrix5(1, :);
std_val16 = stdmatrix6(1, :);
std_val17 = stdmatrix7(1, :);
std_val18 = stdmatrix8(1, :);

emg_std = std_val11;
emg_std = [emg_std;std_val12];
emg_std = [emg_std;std_val13];
emg_std = [emg_std;std_val14];
emg_std = [emg_std;std_val15];
emg_std = [emg_std;std_val16];
emg_std = [emg_std;std_val17];

emg_std = emg_std.';

figure;
hold on
title("EMG Standard Deviation - Eating");
xlabel("Frame");
ylabel("std");
plot(std_val11)
plot(std_val12)
plot(std_val13)
plot(std_val14)
plot(std_val15)
plot(std_val16)
plot(std_val17)
plot(std_val18)
legend({'e1','e2', 'e3','e4'.'e5','e6','e7','e8'},'Location','northeast');