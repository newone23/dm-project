files = {"../../EatFood1/accelerometer-1533862083.csv", "../../Cooking1/accelerometer-1533863975.csv"};

minmatrixx = [];
minmatrixy = [];
minmatrixz = [];

maxmatrixx = [];
maxmatrixy = [];
maxmatrixz = [];

for i=1:2
    value=xlsread(files{i}); % Reading the data
    locx = value(:, 2);
    locy = value(:, 3);
    locz = value(:, 4);
    min_valx = [];
    min_valy = [];
    min_valz = [];
    max_valx = [];
    max_valy = [];
    max_valz = [];
    for j=1:50:7500
        min_valx = [min_valx;min(locx(j:j+100, 1))];
        min_valy = [min_valy;min(locy(j:j+100, 1))];
        min_valz = [min_valz;min(locz(j:j+100, 1))];
        max_valx = [max_valx;max(locx(j:j+100, 1))];
        max_valy = [max_valy;max(locy(j:j+100, 1))];
        max_valz = [max_valz;max(locz(j:j+100, 1))];
    end
    min_valx = min_valx.';
    min_valy = min_valy.';
    min_valz = min_valz.';
    max_valx = max_valx.';
    max_valy = max_valy.';
    max_valz = max_valz.';
    if isempty(minmatrixx)
        minmatrixx=min_valx;
        minmatrixy=min_valy;
        minmatrixz=min_valz;
        maxmatrixx=max_valx;
        maxmatrixy=max_valy;
        maxmatrixz=max_valz;
    else
        minmatrixx = [minmatrixx;min_valx];
        minmatrixy = [minmatrixy;min_valy];
        minmatrixz = [minmatrixz;min_valz];
        maxmatrixx = [maxmatrixx;max_valx];
        maxmatrixy = [maxmatrixy;max_valy];
        maxmatrixz = [maxmatrixz;max_valz];
    end
end

global range_val1x, range_val1y, range_val1z, eor_range;

range_val1x = maxmatrixx(1, :) - minmatrixx(1, :);
range_val1y = maxmatrixy(1, :) - minmatrixy(1, :);
range_val1z = maxmatrixz(1, :) - minmatrixz(1, :);

eor_range = range_val1x;
eor_range = [eor_range;range_val1y];
eor_range = [eor_range;range_val1z];

eor_range = eor_range.';

figure;
hold on
title("EOrientation Range - Eating");
xlabel("Frame");
ylabel("Range");
plot(range_val1x)
plot(range_val1y)
plot(range_val1z)
legend({'roll','pitch', 'yaw'},'Location','northeast');
%plot(min_val2)
%plot(max_val1)
%plot(max_val2)