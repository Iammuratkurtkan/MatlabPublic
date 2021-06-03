clc;clear all;close all;
x=audioread('MatlabProjesiSesi.ogg');
Fs=50000;
sound(x,Fs)
p=nextpow2(length(x));
N=2^p;
X=fft(x,N);
w=(0:N-1)*(2*pi/N);
%%fftshift kullanıyorsanız
w2=(-N/2:N/2-1)*(2*pi/N);
X2=fftshift(X);
stem(w,abs(X))
figure;
stem(w2,abs(X2))
%% örnekleme frekansı Fs var ise
w3=w2/(2*pi)*Fs;
figure;
stem(w3,abs(X2)) %yatay eksen Hz cinsinden
%% FİLTRELEME KISMI
%% FIR filtre export edilmişse (Num)Highpass Filter
y1=filter(Num,1,x)
sound(y1,Fs)
%% IIR filtre export edilmişse (SOS,G) Lowpass Filter
[b,a]=sos2tf(SOS,G) 
y2=filter(b,a,x) 
sound(y2,Fs)
