files = {"../../EatFood1/accelerometer-1533862083.csv", "../../Cooking1/accelerometer-1533863975.csv"};

stdmatrixx = [];
stdmatrixy = [];
stdmatrixz = [];
stdmatrixw = [];

for i=1:2
    value=xlsread(files{i}); % Reading the data
    locx = value(:, 2);
    locy = value(:, 3);
    locz = value(:, 4);
    locw = value(:, 5);
    std_valx = [];
    std_valy = [];
    std_valz = [];
    std_valw = [];
    for j=1:50:7500
        std_valx = [std_valx;std(locx(j:j+100, 1))];
        std_valy = [std_valy;std(locy(j:j+100, 1))];
        std_valz = [std_valz;std(locz(j:j+100, 1))];
        std_valw = [std_valw;std(lozw(j:j+100, 1))];
    end
    std_valx = std_valx.';
    std_valy = std_valy.';
    std_valz = std_valz.';
    std_valw = std+valw.';
    
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
        stdmatrixw = [stdmatrixz;std_valz];
    if isempty(stdmatrixw)
        stdmatrixw=std_valw;
    else
        stdmatrixw = [stdmatrixw;std_valw];
    end
end

global or_std;

std_val1x = stdmatrixx(1, :);
std_val1y = stdmatrixy(1, :);
std_val1z = stdmatrixz(1, :);
std_val1w = stdmatrixw(1, :);

or_std = std_val1x;
or_std = [or_std;std_val1y];
or_std = [or_std;std_val1z];
or_std = [or_std;std_val1w];

or_std = or_std.';

figure;
hold on
title("Orientation SD - Eating");
xlabel("Frame");
ylabel("std");
plot(std_val1x)
plot(std_val1y)
plot(std_val1z)
plot(std_val1w)
legend({'x','y','z','w'},'Location','northeast');