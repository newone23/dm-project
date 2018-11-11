files = {"../../EatFood1/accelerometer-1533862083.csv", "../../Cooking1/accelerometer-1533863975.csv"};

meanmatrix1 = [];
meanmatrix2 = [];
meanmatrix3 = [];
meanmatrix4 = [];
meanmatrix5 = [];
meanmatrix6 = [];
meanmatrix7 = [];
meanmatrix8 = [];

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
    mean_val1 = [];
    mean_val2 = [];
    mean_val3 = [];
    mean_val4 = [];
    mean_val5 = [];
    mean_val6 = [];
    mean_val7 = [];
    mean_val8 = [];
    for j=1:50:7500
        mean_val1 = [mean_val1;mean(loc1(j:j+100, 1))];
        mean_val2 = [mean_val2;mean(loc2(j:j+100, 1))];
        mean_val3 = [mean_val3;mean(loc3(j:j+100, 1))];
        mean_val4 = [mean_val4;mean(loz4(j:j+100, 1))];
        mean_val5 = [mean_val5;mean(loc5(j:j+100, 1))];
        mean_val6 = [mean_val6;mean(loc6(j:j+100, 1))];
        mean_val7 = [mean_val7;mean(loc7(j:j+100, 1))];
        mean_val8 = [mean_val8;mean(loz8(j:j+100, 1))];
    end
    mean_val1 = mean_val1.';
    mean_val2 = mean_val2.';
    mean_val3 = mean_val3.';
    mean_val4 = mean+val4.';
    mean_val5 = mean_val5.';
    mean_val6 = mean_val6.';
    mean_val7 = mean_val7.';
    mean_val8 = mean+val8.';
    
    if isempty(meanmatrix1)
        meanmatrix1=mean_val1;
    else
        meanmatrix1 = [meanmatrix1;mean_val1];
    end
    
    if isempty(meanmatrix2)
        meanmatrix2=mean_val2;
    else
        meanmatrix2 = [meanmatrix2;mean_val2];
    end
    
    if isempty(meanmatrix3)
        meanmatrix3=mean_val3;
    else
        meanmatrix4 = [meanmatrix3;mean_val3];
    if isempty(meanmatrix4)
        meanmatrix4=mean_val4;
    else
        meanmatrix4 = [meanmatrix4;mean_val4];
    end
    if isempty(meanmatrix5)
        meanmatrix5=mean_val5;
    else
        meanmatrix5 = [meanmatrix5;mean_val5];
    end
    if isempty(meanmatrix6)
        meanmatrix6=mean_val6;
    else
        meanmatrix6 = [meanmatrix6;mean_val6];
    end
    if isempty(meanmatrix7)
        meanmatrix7=mean_val7;
    else
        meanmatrix7 = [meanmatrix7;mean_val7];
    end
    if isempty(meanmatrix8)
        meanmatrix8=mean_val8;
    else
        meanmatrix8 = [meanmatrix8;mean_val8];
    end
end

global emg_mean;

mean_val11 = meanmatrix1(1, :);
mean_val12 = meanmatrix2(1, :);
mean_val13 = meanmatrix3(1, :);
mean_val14 = meanmatrix4(1, :);
mean_val15 = meanmatrix5(1, :);
mean_val16 = meanmatrix6(1, :);
mean_val17 = meanmatrix7(1, :);
mean_val18 = meanmatrix8(1, :);

emg_mean = mean_val11;
emg_mean = [emg_mean;mean_val12];
emg_mean = [emg_mean;mean_val13];
emg_mean = [emg_mean;mean_val14];
emg_mean = [emg_mean;mean_val15];
emg_mean = [emg_mean;mean_val16];
emg_mean = [emg_mean;mean_val17];

emg_mean = emg_mean.';

figure;
hold on
title("EMG Mean - Eating");
xlabel("Frame");
ylabel("Mean");
plot(mean_val11)
plot(mean_val12)
plot(mean_val13)
plot(mean_val14)
plot(mean_val15)
plot(mean_val16)
plot(mean_val17)
plot(mean_val18)
legend({'e1','e2', 'e3','e4'.'e5','e6','e7','e8'},'Location','northeast');