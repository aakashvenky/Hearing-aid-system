clearvars;
close all;
[f,fs]=audioread('test.wav');
music=audioplayer(f,fs);
music.play;
N=size(f,1);

figure;
subplot(2,1,1);
plot(1:N,f(:,1));
title('Left channel');
subplot(2,1,2);
plot(1:N, f(:,2));
title('Right Channel');
dB = mag2db(abs(f));


df = fs/N;
w = (-(N/2):(N/2)-1)*df;
y = fft(f(:,1), N)/N; % For normalizing, but not needed for our analysis
y2 = fftshift(y);
figure;
plot(w,abs(y2));
n = 6;
beginFreq = 70 / (fs/2);
endFreq = 4000 / (fs/2);
[b,a] = butter(n, [beginFreq, endFreq], 'bandpass');
fOut = filter(b, a, f);
[h,w] = freqz(b,a);

%dB = mag2db(abs(h));

%plot(w/pi,dB)
%xlabel('\omega / \pi')
%ylabel('Magnitude (dB)')
%fOut = std(fOut)/std(fOut)*(sqrt(10^(1)))*fOut;
%p = audioplayer(fOut, fs);
%audiowrite('hoi.wav', fOut, fs);
%p.play;