clearvars;
close all;
[f,fs]=audioread('hoi.wav');
music=audioplayer(f,fs);
music.play;
N=size(f,1);

X_mags = abs(fft(f));
bin_vals = [0 : N-1];
fax_Hz = bin_vals*fs/N;
N_2 = ceil(N/2);
plot(fax_Hz(1:N_2), X_mags(1:N_2))
xlabel('Frequency (Hz)')
ylabel('Magnitude');
title('Single-sided Magnitude spectrum (Hertz)');
axis tight