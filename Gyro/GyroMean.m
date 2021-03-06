files = {"../../EatFood1/accelerometer-1533862083.csv", "../../Cooking1/accelerometer-1533863975.csv"};

meanmatrixx = [];
meanmatrixy = [];
meanmatrixz = [];

for i=1:1
    value=xlsread(files{i}); % Reading the data
    locx = value(:, 2);
    locy = value(:, 3);
    locz = value(:, 4);
    mean_valx = [];
    mean_valy = [];
    mean_valz = [];
    for j=1:5:7500
        mean_valx = [mean_valx;mean(locx(j:j+100, 1))];
        mean_valy = [mean_valy;mean(locy(j:j+100, 1))];
        mean_valz = [mean_valz;mean(locz(j:j+100, 1))];
    end
    mean_valx = mean_valx.';
    mean_valy = mean_valy.';
    mean_valz = mean_valz.';
    
    if isempty(meanmatrixx)
        meanmatrixx=mean_valx;
    else
        meanmatrixx = [meanmatrixx;mean_valx];
    end
    
    if isempty(meanmatrixy)
        meanmatrixy=mean_valy;
    else
        meanmatrixy = [meanmatrixy;mean_valy];
    end
    
    if isempty(meanmatrixz)
        meanmatrixz=mean_valz;
    else
        meanmatrixz = [meanmatrixz;mean_valz];
    end
end

global mean_val1x,mean_val1y,mean_val1z, gyro_mean;


mean_val1x = meanmatrixx(1, :);
mean_val1y = meanmatrixy(1, :);
mean_val1z = meanmatrixz(1, :);

gyro_mean = mean_val1x;
gyro_mean = [gyro_mean;mean_val1y];
gyro_mean = [gyro_mean;mean_val1z];

gyro_mean = gyro_mean.';

figure;
hold on
title("Gyro Mean - Eating");
xlabel("Frame");
ylabel("Mean");
plot(mean_val1x)
plot(mean_val1y)
plot(mean_val1z)
legend({'x','y', 'z'},'Location','northeast');