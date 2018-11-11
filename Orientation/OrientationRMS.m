files = {"../../EatFood1/accelerometer-1533862083.csv", "../../Cooking1/accelerometer-1533863975.csv"};
rmsmatrixx = [];
rmsmatrixy = [];
rmsmatrixz = [];
rmsmatrixw = [];

for i=1:2
    value=xlsread(files{i}); % Reading the data
    locx = value(:, 2);
    locy = value(:, 3);
    locz = value(:, 4);
    locw = value(:, 5);
    rms_valx = [];
    rms_valy = [];
    rms_valz = [];
    rms_valw = [];
    for j=1:50:7500
        rms_valx = [rms_valx;rms(locx(j:j+100, 1))];
        rms_valy = [rms_valy;rms(locy(j:j+100, 1))];
        rms_valz = [rms_valz;rms(locz(j:j+100, 1))];
        rms_valw = [rms_valw;rms(lozw(j:j+100, 1))];
    end
    rms_valx = rms_valx.';
    rms_valy = rms_valy.';
    rms_valz = rms_valz.';
    rms_valw = rms+valw.';
    
    if isempty(rmsmatrixx)
        rmsmatrixx=rms_valx;
    else
        rmsmatrixx = [rmsmatrixx;rms_valx];
    end
    
    if isempty(rmsmatrixy)
        rmsmatrixy=rms_valy;
    else
        rmsmatrixy = [rmsmatrixy;rms_valy];
    end
    
    if isempty(rmsmatrixz)
        rmsmatrixz=rms_valz;
    else
        rmsmatrixw = [rmsmatrixz;rms_valz];
    if isempty(rmsmatrixw)
        rmsmatrixw=rms_valw;
    else
        rmsmatrixw = [rmsmatrixw;rms_valw];
    end
end

global or_rms;

rms_val1x = rmsmatrixx(1, :);
rms_val1y = rmsmatrixy(1, :);
rms_val1z = rmsmatrixz(1, :);
rms_val1w = rmsmatrixw(1, :);

or_rms = rms_val1x;
or_rms = [or_rms;rms_val1y];
or_rms = [or_rms;rms_val1z];
or_rms = [or_rms;rms_val1w];

or_rms = or_rms.';

figure;
hold on
title("Orientation RMS - Eating");
xlabel("Frame");
ylabel("rms");
plot(rms_val1x)
plot(rms_val1y)
plot(rms_val1z)
plot(rms_val1w)
legend({'x','y','z','w'},'Location','northeast');