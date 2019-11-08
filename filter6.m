[z,fs]=audioread('test.wav'); 
len=length(z);
for i=1:2
for j=2:len-1
z(j,i) = (z(j-1,i) + z(j,i) + z(j+1,i))/3 ;
end
end
bfil=fft(z); %fft of input signal

wn=[70 4000]/(fs/2);   %bandpass
[b,a]=butter(6,wn);
fvtool(b,a);
f=filter(b,a,z);
afil=fft(f);
freqz(b,a)
% Apply the Butterworth filter.
filteredSignal = filter(b, a, z);
len2=length(filteredSignal);
for i=1:2
for j=2:len2-1
filteredSignal(j,i) = (filteredSignal(j-1,i) + filteredSignal(j,i) + filteredSignal(j+1,i))/3 ;
end
end
% Play the sound.
player = audioplayer(filteredSignal, fs);
audiowrite('final2.wav', z, fs);
play(player);
subplot(2,1,1);plot(real(bfil));
title('frequency respones of input signal');
xlabel('frequency');ylabel('magnitude');
subplot(2,1,2);plot(real(afil));
title('frequency respones of filtered signal');
xlabel('frequency');ylabel('magnitude');
