files = {"../../EatFood1/accelerometer-1533862083.csv", "../../Cooking1/accelerometer-1533863975.csv"};

stdmatrixx = [];
stdmatrixy = [];
stdmatrixz = [];

for i=1:2
    value=xlsread(files{i}); % Reading the data
    locx = value(:, 2);
    locy = value(:, 3);
    locz = value(:, 4);
    std_valx = [];
    std_valy = [];
    std_valz = [];
    for j=1:50:7500
        std_valx = [std_valx;std(locx(j:j+100, 1))];
        std_valy = [std_valy;std(locy(j:j+100, 1))];
        std_valz = [std_valz;std(locz(j:j+100, 1))];
    end
    std_valx = std_valx.';
    std_valy = std_valy.';
    std_valz = std_valz.';
    
    if isempty(stdmatrixx)
        stdmatrixx=std_valx;
    else
        stdmatrixx = [stdmatrixx;std_valx];
    end
    
    if isempty(stdmatrixy)
        stdmatrixy=std_valy;
    else
        stdmatrixy = [stdmatrixy;std_valy];
    end
    
    if isempty(stdmatrixz)
        stdmatrixz=std_valz;
    else
        stdmatrixz = [stdmatrixz;std_valz];
    end
end

global std_val1x;
global std_val1y;
global std_val1z;

global std_val2x;
global std_val2y;
global std_val2z;

std_val1x = stdmatrixx(1, :);
std_val1y = stdmatrixy(1, :);
std_val1z = stdmatrixz(1, :);

std_val2x = stdmatrixx(2, :);
std_val2y = stdmatrixy(2, :);
std_val2z = stdmatrixz(2, :);

acc_sd = std_val1x;
acc_sd = [acc_sd;std_val1y];
acc_sd = [acc_sd;std_val1z];

acc_sd = acc_sd.';

figure;
title("Acclerometer - Driving");
xlabel("Frame");
ylabel("Standard Deviation");
hold on
plot(std_val1x)
plot(std_val1y)
plot(std_val1z)
legend({'x','y', 'z'},'Location','northeast');