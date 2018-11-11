files = {"../../EatFood1/accelerometer-1533862083.csv", "../../Cooking1/accelerometer-1533863975.csv"};

rmsmatrix1 = [];
rmsmatrix2 = [];
rmsmatrix3 = [];
rmsmatrix4 = [];
rmsmatrix5 = [];
rmsmatrix6 = [];
rmsmatrix7 = [];
rmsmatrix8 = [];

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
    rms_val1 = [];
    rms_val2 = [];
    rms_val3 = [];
    rms_val4 = [];
    rms_val5 = [];
    rms_val6 = [];
    rms_val7 = [];
    rms_val8 = [];
    for j=1:50:7500
        rms_val1 = [rms_val1;rms(loc1(j:j+100, 1))];
        rms_val2 = [rms_val2;rms(loc2(j:j+100, 1))];
        rms_val3 = [rms_val3;rms(loc3(j:j+100, 1))];
        rms_val4 = [rms_val4;rms(loz4(j:j+100, 1))];
        rms_val5 = [rms_val5;rms(loc5(j:j+100, 1))];
        rms_val6 = [rms_val6;rms(loc6(j:j+100, 1))];
        rms_val7 = [rms_val7;rms(loc7(j:j+100, 1))];
        rms_val8 = [rms_val8;rms(loz8(j:j+100, 1))];
    end
    rms_val1 = rms_val1.';
    rms_val2 = rms_val2.';
    rms_val3 = rms_val3.';
    rms_val4 = rms+val4.';
    rms_val5 = rms_val5.';
    rms_val6 = rms_val6.';
    rms_val7 = rms_val7.';
    rms_val8 = rms+val8.';
    
    if isempty(rmsmatrix1)
        rmsmatrix1=rms_val1;
    else
        rmsmatrix1 = [rmsmatrix1;rms_val1];
    end
    
    if isempty(rmsmatrix2)
        rmsmatrix2=rms_val2;
    else
        rmsmatrix2 = [rmsmatrix2;rms_val2];
    end
    
    if isempty(rmsmatrix3)
        rmsmatrix3=rms_val3;
    else
        rmsmatrix4 = [rmsmatrix3;rms_val3];
    if isempty(rmsmatrix4)
        rmsmatrix4=rms_val4;
    else
        rmsmatrix4 = [rmsmatrix4;rms_val4];
    end
    if isempty(rmsmatrix5)
        rmsmatrix5=rms_val5;
    else
        rmsmatrix5 = [rmsmatrix5;rms_val5];
    end
    if isempty(rmsmatrix6)
        rmsmatrix6=rms_val6;
    else
        rmsmatrix6 = [rmsmatrix6;rms_val6];
    end
    if isempty(rmsmatrix7)
        rmsmatrix7=rms_val7;
    else
        rmsmatrix7 = [rmsmatrix7;rms_val7];
    end
    if isempty(rmsmatrix8)
        rmsmatrix8=rms_val8;
    else
        rmsmatrix8 = [rmsmatrix8;rms_val8];
    end
end

global emg_rms;

rms_val11 = rmsmatrix1(1, :);
rms_val12 = rmsmatrix2(1, :);
rms_val13 = rmsmatrix3(1, :);
rms_val14 = rmsmatrix4(1, :);
rms_val15 = rmsmatrix5(1, :);
rms_val16 = rmsmatrix6(1, :);
rms_val17 = rmsmatrix7(1, :);
rms_val18 = rmsmatrix8(1, :);

emg_rms = rms_val11;
emg_rms = [emg_rms;rms_val12];
emg_rms = [emg_rms;rms_val13];
emg_rms = [emg_rms;rms_val14];
emg_rms = [emg_rms;rms_val15];
emg_rms = [emg_rms;rms_val16];
emg_rms = [emg_rms;rms_val17];

emg_rms = emg_rms.';

figure;
hold on
title("EMG RMS - Eating");
xlabel("Frame");
ylabel("rms");
plot(rms_val11)
plot(rms_val12)
plot(rms_val13)
plot(rms_val14)
plot(rms_val15)
plot(rms_val16)
plot(rms_val17)
plot(rms_val18)
legend({'e1','e2', 'e3','e4'.'e5','e6','e7','e8'},'Location','northeast');