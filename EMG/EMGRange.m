files = {"../../EatFood1/accelerometer-1533862083.csv", "../../Cooking1/accelerometer-1533863975.csv"};

minmatrix1 = [];
minmatrix2 = [];
minmatrix3 = [];
minmatrix4 = [];
minmatrix5 = [];
minmatrix6 = [];
minmatrix7 = [];
minmatrix8 = [];

maxmatrix1 = [];
maxmatrix2 = [];
maxmatrix3 = [];
maxmatrix4 = [];
maxmatrix5 = [];
maxmatrix6 = [];
maxmatrix7 = [];
maxmatrix8 = [];

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

    min_val1 = [];
    min_val2 = [];
    min_val3 = [];
    min_val4 = [];
    min_val5 = [];
    min_val6 = [];
    min_val7 = [];
    min_val8 = [];


    max_val1 = [];
    max_val2 = [];
    max_val3 = [];
    max_val4 = [];
    max_val5 = [];
    max_val6 = [];
    max_val7 = [];
    max_val8 = [];

    for j=1:50:7500
        min_val1 = [min_val1;min(loc1(j:j+100, 1))];
        min_val2 = [min_val2;min(loc2(j:j+100, 1))];
        min_val3 = [min_val3;min(loc3(j:j+100, 1))];
        min_val4 = [min_val4;min(loc4(j:j+100, 1))];
        min_val5 = [min_val1;min(loc5(j:j+100, 1))];
        min_val6 = [min_val2;min(loc6(j:j+100, 1))];
        min_val7 = [min_val3;min(loc7(j:j+100, 1))];
        min_val8 = [min_val4;min(loc8(j:j+100, 1))];

        max_val1 = [max_val1;max(loc1(j:j+100, 1))];
        max_val2 = [max_val2;max(loc2(j:j+100, 1))];
        max_val3 = [max_val3;max(loc3(j:j+100, 1))];
        max_val4 = [max_val4;max(loc4(j:j+100, 1))];
        max_val5 = [max_val5;max(loc5(j:j+100, 1))];
        max_val6 = [max_val6;max(loc6(j:j+100, 1))];
        max_val7 = [max_val7;max(loc7(j:j+100, 1))];
        max_val8 = [max_val8;max(loc8(j:j+100, 1))];
    end
    min_val1 = min_val1.';
    min_val2 = min_val2.';
    min_val3 = min_val3.';
    min_val4 = min_val4.';
    min_val5 = min_val5.';
    min_val6 = min_val6.';
    min_val7 = min_val7.';
    min_val8 = min_val8.';

    max_val1 = max_val1.';
    max_val2 = max_val2.';
    max_val3 = max_val3.';
    max_val4 = max_val4.';
    max_val5 = max_val5.';
    max_val6 = max_val6.';
    max_val7 = max_val7.';
    max_val8 = max_val8.';

    if isempty(minmatrix1)
        minmatrix1=min_val1;
        minmatrix2=min_val2;
        minmatrix3=min_val3;
        minmatrix4=min_val4;
        minmatrix5=min_val5;
        minmatrix6=min_val6;
        minmatrix7=min_val7;
        minmatrix8=min_val8;

        maxmatrix1=max_val1;
        maxmatrix2=max_val2;
        maxmatrix3=max_val3;
        maxmatrix4=max_val4;
        maxmatrix5=max_val5;
        maxmatrix6=max_val6;
        maxmatrix7=max_val7;
        maxmatrix8=max_val8;


    else
        minmatrix1 = [minmatrix1;min_val1];
        minmatrix2 = [minmatrix2;min_val2];
        minmatrix3 = [minmatrix3;min_val3];
        minmatrix4 = [minmatrix4;min_val4];
        minmatrix5 = [minmatrix5;min_val5];
        minmatrix6 = [minmatrix6;min_val6];
        minmatrix7 = [minmatrix7;min_val7];
        minmatrix8 = [minmatrix8;min_val8];

        maxmatrix1 = [maxmatrix1;max_val1];
        maxmatrix2 = [maxmatrix2;max_val2];
        maxmatrix3 = [maxmatrix3;max_val3];
        maxmatrix4 = [maxmatrix4;max_val4];
        maxmatrix5 = [maxmatrix5;max_val5];
        maxmatrix6 = [maxmatrix6;max_val6];
        maxmatrix7 = [maxmatrix7;max_val7];
        maxmatrix8 = [maxmatrix8;max_val8];
    end
end

global range_val1, range_val2, range_val3, range_val4, range_val5, range_val6, range_val7, range_val8,emg_range;

range_val1 = maxmatrix1(1, :) - minmatrix1(1, :);
range_val2 = maxmatrix2(1, :) - minmatrix2(1, :);
range_val3 = maxmatrix3(1, :) - minmatrix3(1, :);
range_val4 = maxmatrix4(1, :) - minmatrix4(1, :);
range_val5 = maxmatrix5(1, :) - minmatrix5(1, :);
range_val6 = maxmatrix6(1, :) - minmatrix6(1, :);
range_val7 = maxmatrix7(1, :) - minmatrix7(1, :);
range_val8 = maxmatrix8(1, :) - minmatrix8(1, :);

emg_range = range_val11;
emg_range = [emg_range;range_val12];
emg_range = [emg_range;range_val13];
emg_range = [emg_range;range_val14];
emg_range = [emg_range;range_val15];
emg_range = [emg_range;range_val16];
emg_range = [emg_range;range_val17];

emg_range = emg_range.';

figure;
hold on
title("EMG Range - Eating");
xlabel("Frame");
ylabel("Range");
plot(range_val1)
plot(range_val2)
plot(range_val3)
plot(range_val4)
plot(range_val5)
plot(range_val6)
plot(range_val7)
plot(range_val8)
legend({'e1','e1', 'e3', 'e4', 'e5', 'e6', 'e7', 'e8'},'Location','northeast');
%plot(min_val2)
%plot(max_val1)
%plot(max_val2)