global std_val1x;
size(std_val1x)
global std_val1y;
global std_val1z;

global std_val2x;
size(std_val2x)
global std_val2y;
global std_val2z;

global fft_val1x;
size(fft_val1x)
global fft_val1y;
global fft_val1z;
global fft_val2x;
size(fft_val2x)
global fft_val2y;
global fft_val2z;

global mean_val1x;
size(mean_val1x)
global mean_val1y;
global mean_val1z;

global mean_val2x;
size(mean_val2x)
global mean_val2y;
global mean_val2z;

global range_val1x;
size(range_val1x)
global range_val1y;
global range_val1z;

global range_val2x;
size(range_val2x)
global range_val2y;
global range_val2z;

global rms_val1x;
size(rms_val1x)
global rms_val1y;
global rms_val1z;

global rms_val2x;
size(rms_val2x)
global rms_val2y;
global rms_val2z;

features = [];

features = std_val1x;
features = [features;std_val1y];
features = [features;std_val1z];

features = [features;rms_val1x];
features = [features;rms_val1y];
features = [features;rms_val1z];

features = [features;fft_val1x];
features = [features;fft_val1y];
features = [features;fft_val1z];

features = [features;mean_val1x];
features = [features;mean_val1y];
features = [features;mean_val1z];

features = [features;range_val1x];
features = [features;range_val1y];
features = [features;range_val1z];

features = [features;std_val2x];
features = [features;std_val2y];
features = [features;std_val2y];

features = [features;fft_val2x];
features = [features;fft_val2y];
features = [features;fft_val2z];

features = [features;mean_val2x];
features = [features;mean_val2y];
features = [features;mean_val2z];

features = [features;range_val2x];
features = [features;range_val2y];
features = [features;range_val2z];

features = [features;rms_val2x];
features = [features;rms_val2y];
features = [features;rms_val2z];

features = features.';
size(features)

[coeff, score, latent] = pca(features);
size(coeff)
all_pca = features*coeff;
size(all_pca)
ea_pca = all_pca(:, 1:15);
nonea_pca = all_pca(:, 15:30);

[v,d] = eig(features'*features);

plot(ea_pca(:, 1), ea_pca(:, 2), 'b.');
hold on;
plot(nonea_pca(:, 1), nonea_pca(:, 2), 'g*');
