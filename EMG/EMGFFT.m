files = {"../../EatFood1/accelerometer-1533862083.csv", "../../Cooking1/accelerometer-1533863975.csv"};

fftmatrix1 = [];
fftmatrix2 = [];
fftmatrix3 = [];
fftmatrix4 = [];
fftmatrix5 = [];
fftmatrix6 = [];
fftmatrix7 = [];
fftmatrix8 = [];

for i=1:2
    value=xlsread(files{i}); % Reading the data
    loc1 = value(:, 2);
    loc2 = value(:, 3);
    loc3 = value(:, 4);
    loc4 = value(:, 5);
    loc5 = value(:, 6);
    loc6 = value(:, 7);
    loc7 = value(:, 8);
    loc8 = value(:, 9);
    fft_val1 = [];
    fft_val2 = [];
    fft_val3 = [];
    fft_val4 = [];
    fft_val5 = [];
    fft_val6 = [];
    fft_val7 = [];
    fft_val8 = [];
    femg j=1:50:7500
        fft_val1 = [fft_val1;max(abs(fft(loc1(j:j+100, 1))))];
        fft_val2 = [fft_val2;max(abs(fft(loc2(j:j+100, 1))))];
        fft_val3 = [fft_val3;max(abs(fft(loc3(j:j+100, 1))))];
        fft_val4 = [fft_val4;max(abs(fft(loz4(j:j+100, 1))))];
        fft_val5 = [fft_val5;max(abs(fft(loc5(j:j+100, 1))))];
        fft_val6 = [fft_val6;max(abs(fft(loc6(j:j+100, 1))))];
        fft_val7 = [fft_val7;max(abs(fft(loc7(j:j+100, 1))))];
        fft_val8 = [fft_val8;max(abs(fft(loz8(j:j+100, 1))))];
    end
    fft_val1 = fft_val1.';
    fft_val2 = fft_val2.';
    fft_val3 = fft_val3.';
    fft_val4 = fft+val4.';
    fft_val5 = fft_val5.';
    fft_val6 = fft_val6.';
    fft_val7 = fft_val7.';
    fft_val8 = fft+val8.';
    
    if isempty(fftmatrix1)
        fftmatrix1=fft_val1;
    else
        fftmatrix1 = [fftmatrix1;fft_val1];
    end
    
    if isempty(fftmatrix2)
        fftmatrix2=fft_val2;
    else
        fftmatrix2 = [fftmatrix2;fft_val2];
    end
    
    if isempty(fftmatrix3)
        fftmatrix3=fft_val3;
    else
        fftmatrix4 = [fftmatrix3;fft_val3];
    if isempty(fftmatrix4)
        fftmatrix4=fft_val4;
    else
        fftmatrix4 = [fftmatrix4;fft_val4];
    end
    if isempty(fftmatrix5)
        fftmatrix5=fft_val5;
    else
        fftmatrix5 = [fftmatrix5;fft_val5];
    end
    if isempty(fftmatrix6)
        fftmatrix6=fft_val6;
    else
        fftmatrix6 = [fftmatrix6;fft_val6];
    end
    if isempty(fftmatrix7)
        fftmatrix7=fft_val7;
    else
        fftmatrix7 = [fftmatrix7;fft_val7];
    end
    if isempty(fftmatrix8)
        fftmatrix8=fft_val8;
    else
        fftmatrix8 = [fftmatrix8;fft_val8];
    end
end

global fft_val11, fft_val12, fft_val13, fft_val14, fft_val15, fft_val16, fft_val17, fft_val18,emg_fft;

fft_val11 = fftmatrix1(1, :);
fft_val12 = fftmatrix2(1, :);
fft_val13 = fftmatrix3(1, :);
fft_val14 = fftmatrix4(1, :);
fft_val15 = fftmatrix5(1, :);
fft_val16 = fftmatrix6(1, :);
fft_val17 = fftmatrix7(1, :);
fft_val18 = fftmatrix8(1, :);

emg_fft = fft_val11;
emg_fft = [emg_fft;fft_val12];
emg_fft = [emg_fft;fft_val13];
emg_fft = [emg_fft;fft_val14];
emg_fft = [emg_fft;fft_val15];
emg_fft = [emg_fft;fft_val16];
emg_fft = [emg_fft;fft_val17];

emg_fft = emg_fft.';



figure;
hold on
title("EMG FFT - Eating");
xlabel("Frame");
ylabel("fft");
plot(fft_val11)
plot(fft_val12)
plot(fft_val13)
plot(fft_val14)
plot(fft_val15)
plot(fft_val16)
plot(fft_val17)
plot(fft_val18)
legend({'e1','e2', 'e3','e4'.'e5','e6','e7','e8'},'Location','nemgtheast');