files = {"../../EatFood1/accelerometer-1533862083.csv", "../../Cooking1/accelerometer-1533863975.csv"};

minmatrixx = [];
minmatrixy = [];
minmatrixz = [];
minmatrixw = [];

maxmatrixx = [];
maxmatrixy = [];
maxmatrixz = [];
maxmatrixw = [];

for i=1:2
    value=xlsread(files{i}); % Reading the data
    locx = value(:, 2);
    locy = value(:, 3);
    locz = value(:, 4);
    locw = value(:, 5);
    min_valx = [];
    min_valy = [];
    min_valz = [];
    min_valw = [];
    max_valx = [];
    max_valy = [];
    max_valz = [];
    max_valw = [];

    for j=1:50:7500
        min_valx = [min_valx;min(locx(j:j+100, 1))];
        min_valy = [min_valy;min(locy(j:j+100, 1))];
        min_valz = [min_valz;min(locz(j:j+100, 1))];
        min_valw = [min_valw;min(locw(j:j+100, 1))];
        max_valx = [max_valx;max(locx(j:j+100, 1))];
        max_valy = [max_valy;max(locy(j:j+100, 1))];
        max_valz = [max_valz;max(locz(j:j+100, 1))];
        max_valw = [max_valw;max(locw(j:j+100, 1))];
    end
    min_valx = min_valx.';
    min_valy = min_valy.';
    min_valz = min_valz.';
    min_valw = min_valw.';
    max_valx = max_valx.';
    max_valy = max_valy.';
    max_valz = max_valz.';
    max_valw = max_valw.';

    if isempty(minmatrixx)
        minmatrixx=min_valx;
        minmatrixy=min_valy;
        minmatrixz=min_valz;
        minmatrixw=min_valw;

        maxmatrixx=max_valx;
        maxmatrixy=max_valy;
        maxmatrixz=max_valz;
        maxmatrixw=max_valw;

    else
        minmatrixx = [minmatrixx;min_valx];
        minmatrixy = [minmatrixy;min_valy];
        minmatrixz = [minmatrixz;min_valz];
        minmatrixw = [minmatrixw;min_valw];

        maxmatrixx = [maxmatrixx;max_valx];
        maxmatrixy = [maxmatrixy;max_valy];
        maxmatrixz = [maxmatrixz;max_valz];
        maxmatrixw = [maxmatrixz;max_valw];
    end
end

global range_val1x, range_val1y, range_val1z, range_val1w,or_range;

range_val1x = maxmatrixx(1, :) - minmatrixx(1, :);
range_val1y = maxmatrixy(1, :) - minmatrixy(1, :);
range_val1z = maxmatrixz(1, :) - minmatrixz(1, :);
range_val1w = maxmatrixw(1, :) - minmatrixw(1, :);

or_range = range_val1x;
or_range = [or_range;range_val1y];
or_range = [or_range;range_val1z];
or_range = [or_range;range_val1w];

or_range = or_range.';

figure;
hold on
title("Orientation Range - Eating");
xlabel("Frame");
ylabel("Range");
plot(range_val1x)
plot(range_val1y)
plot(range_val1z)
plot(range_val1w)
legend({'x','y', 'z', 'w'},'Location','northeast');
%plot(min_val2)
%plot(max_val1)
%plot(max_val2)