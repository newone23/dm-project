files = {"../../EatFood1/accelerometer-1533862083.csv", "../../Cooking1/accelerometer-1533863975.csv"};

fftmatrixx = [];
fftmatrixy = [];
fftmatrixz = [];
fftmatrixw = [];

for i=1:2
    value=xlsread(files{i}); % Reading the data
    locx = value(:, 2);
    locy = value(:, 3);
    locz = value(:, 4);
    locw = value(:, 5);
    fft_valx = [];
    fft_valy = [];
    fft_valz = [];
    fft_valw = [];
    for j=1:50:7500
        fft_valx = [fft_valx;max(abs(fft(locx(j:j+100, 1))))];
        fft_valy = [fft_valy;max(abs(fft(locy(j:j+100, 1))))];
        fft_valz = [fft_valz;max(abs(fft(locz(j:j+100, 1))))];
        fft_valw = [fft_valw;max(abs(fft(lozw(j:j+100, 1))))];
    end
    fft_valx = fft_valx.';
    fft_valy = fft_valy.';
    fft_valz = fft_valz.';
    fft_valw = fft+valw.';
    
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
        fftmatrixw = [fftmatrixz;fft_valz];
    if isempty(fftmatrixw)
        fftmatrixw=fft_valw;
    else
        fftmatrixw = [fftmatrixw;fft_valw];
    end
end

global fft_val1x, fft_val1y, fft_val1z, fft_val1w, or_fft;

fft_val1x = fftmatrixx(1, :);
fft_val1y = fftmatrixy(1, :);
fft_val1z = fftmatrixz(1, :);
fft_val1w = fftmatrixw(1, :);

or_fft = fft_val1x;
or_fft = [or_fft;fft_val1y];
or_fft = [or_fft;fft_val1z];
or_fft = [or_fft;fft_val1w];

or_fft = or_fft.';

figure;
hold on
title("Orientation FFT - Eating");
xlabel("Frame");
ylabel("fft");
plot(fft_val1x)
plot(fft_val1y)
plot(fft_val1z)
plot(fft_val1w)
legend({'x','y', 'z','w'},'Location','northeast');