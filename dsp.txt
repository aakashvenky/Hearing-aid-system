[z,fs]=audioread('test.wav'); % fs=44110
N=size(z,1);
figure
plot(1:N,z(:,1));
title('input signal')
ylabel('amplitude');xlabel('sample');
bfil=fft(z); %fft of input signal

df = fs;
w = (-(N/2):(N/2)-1)*df;
y = fft(z(:,1), N); 
y2 = fftshift(y);
figure(2);
plot(w,abs(y2));
title('input signal')
ylabel('frequency');xlabel('sample');

wn=[70 4000]/(fs/2);   %bandpass
[b,a]=butter(6,wn);
fvtool(b,a);
f=filter(b,a,z);
afil=fft(f);
freqz(b,a)
% Butterworth filter.
filteredSignal = filter(b, a, z);

df2 = fs;
w2 = (-(N/2):(N/2)-1)*df2;
y = fft(filteredSignal(:,1), N); 
y2 = fftshift(y);
figure(3);
plot(w2,abs(y2));
title('frequency response of output signal')

% sound
player = audioplayer(filteredSignal, fs);
audiowrite('final.wav', z, fs);
play(player);
subplot(2,1,1);plot(real(bfil));
title('frequency respones of input signal');
xlabel('frequency');ylabel('magnitude');
subplot(2,1,2);
plot(real(afil));
title('frequency respones of filtered signal');
xlabel('frequency');ylabel('magnitude');

figure(3)
subplot(2,1,1);plot(1:N,z(:,1));
title('input signal');
xlabel('frequency');ylabel('magnitude');
subplot(2,1,2);
plot(1:N,filteredSignal(:,1));
title('filtered signal');
xlabel('frequency');ylabel('magnitude');