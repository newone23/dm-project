files = {"../../EatFood1/accelerometer-1533862083.csv", "../../Cooking1/accelerometer-1533863975.csv"};

meanmatrixx = [];
meanmatrixy = [];
meanmatrixz = [];
meanmatrixw = [];

for i=1:2
    value=xlsread(files{i}); % Reading the data
    locx = value(:, 2);
    locy = value(:, 3);
    locz = value(:, 4);
    locw = value(:, 5);
    mean_valx = [];
    mean_valy = [];
    mean_valz = [];
    mean_valw = [];
    for j=1:50:7500
        mean_valx = [mean_valx;mean(locx(j:j+100, 1))];
        mean_valy = [mean_valy;mean(locy(j:j+100, 1))];
        mean_valz = [mean_valz;mean(locz(j:j+100, 1))];
        mean_valw = [mean_valw;mean(lozw(j:j+100, 1))];
    end
    mean_valx = mean_valx.';
    mean_valy = mean_valy.';
    mean_valz = mean_valz.';
    mean_valw = mean+valw.';
    
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
        meanmatrixw = [meanmatrixz;mean_valz];
    if isempty(meanmatrixw)
        meanmatrixw=mean_valw;
    else
        meanmatrixw = [meanmatrixw;mean_valw];
    end
end

global or_mean;

mean_val1x = meanmatrixx(1, :);
mean_val1y = meanmatrixy(1, :);
mean_val1z = meanmatrixz(1, :);
mean_val1w = meanmatrixw(1, :);

or_mean = mean_val1x;
or_mean = [or_mean;mean_val1y];
or_mean = [or_mean;mean_val1z];
or_mean = [or_mean;mean_val1w];

or_mean = or_mean.';

figure;
hold on
title("Orientation Mean - Eating");
xlabel("Frame");
ylabel("Mean");
plot(mean_val1x)
plot(mean_val1y)
plot(mean_val1z)
plot(mean_val1w)
legend({'x','y', 'z','w'},'Location','northeast');