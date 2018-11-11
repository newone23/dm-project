files = {"../../EatFood1/accelerometer-1533862083.csv", "../../Cooking1/accelerometer-1533863975.csv"};

fftmatrixx = [];
fftmatrixy = [];
fftmatrixz = [];

for i=1:2
    value=xlsread(files{i}); % Reading the data
    locx = value(:, 2);
    locy = value(:, 3);
    locz = value(:, 4);
    fft_valx = [];
    fft_valy = [];
    fft_valz = [];
    for j=1:50:7500
        fft_valx = [fft_valx;max(abs(fft(locx(j:j+100, 1))))];
        fft_valy = [fft_valy;max(abs(fft(locy(j:j+100, 1))))];
        fft_valz = [fft_valz;max(abs(fft(locz(j:j+100, 1))))];
    end

    fft_valx = fft_valx.';
    fft_valy = fft_valy.';
    fft_valz = fft_valz.';
    
    if isempty(fftmatrixx)
        fftmatrixx=fft_valx;
    else
        fftmatrixx = [fftmatrixx;fft_valx];
    end
    
    if isempty(fftmatrixy)
        fftmatrixy=fft_valy;
    else
        fftmatrixy = [fftmatrixy;fft_valy];
    end
    
    if isempty(fftmatrixz)
        fftmatrixz=fft_valz;
    else
        fftmatrixz = [fftmatrixz;fft_valz];
    end
end

global fft_val1x;
global fft_val1y;
global fft_val1z;
global fft_val2x;
global fft_val2y;
global fft_val2z;
global acc_fft;

fft_val1x = fftmatrixx(1, :);
fft_val1y = fftmatrixy(1, :);
fft_val1z = fftmatrixz(1, :);

fft_val2x = fftmatrixx(2, :);
fft_val2y = fftmatrixy(2, :);
fft_val2z = fftmatrixz(2, :);

acc_fft = fft_val1x;
acc_fft = [acc_fft;fft_val1y];
acc_fft = [acc_fft;fft_val1z];

acc_fft = acc_fft.';

figure;
hold on
title("Acclerometer FFT - Cooking");
xlabel("Frame");
ylabel("Mean");
plot(fft_val2x)
plot(fft_val2y)
plot(fft_val2z)
legend({'x','y', 'z'},'Location','northeast');