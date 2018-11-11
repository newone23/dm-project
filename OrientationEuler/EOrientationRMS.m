files = {"../../EatFood1/accelerometer-1533862083.csv", "../../Cooking1/accelerometer-1533863975.csv"};

rmsmatrixx = [];
rmsmatrixy = [];
rmsmatrixz = [];

for i=1:2
    value=xlsread(files{i}); % Reading the data
    locx = value(:, 2);
    locy = value(:, 3);
    locz = value(:, 4);
    rms_valx = [];
    rms_valy = [];
    rms_valz = [];
    for j=1:50:7500
        rms_valx = [rms_valx;rms(locx(j:j+100, 1))];
        rms_valy = [rms_valy;rms(locy(j:j+100, 1))];
        rms_valz = [rms_valz;rms(locz(j:j+100, 1))];
    end
    rms_valx = rms_valx.';
    rms_valy = rms_valy.';
    rms_valz = rms_valz.';
    
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
        rmsmatrixz = [rmsmatrixz;rms_valz];
    end
end

global eor_rms;

rms_val1x = rmsmatrixx(1, :);
rms_val1y = rmsmatrixy(1, :);
rms_val1z = rmsmatrixz(1, :);

eor_rms = rms_val1x;
eor_rms = [eor_rms;rms_val1y];
eor_rms = [eor_rms;rms_val1z];

eor_rms = eor_rms.';

figure;
hold on
title("Eorientation RMS - Eating");
xlabel("Frame");
ylabel("rms");
plot(rms_val1x)
plot(rms_val1y)
plot(rms_val1z)
legend({'roll','pitch', 'yaw'},'Location','northeast');