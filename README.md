# MatlabPublic
Filtreleme

  Elektronik filtreler farklı frekanslara sahip sinyallerin bazı kısımlarını geçirip, bazı kısımlarını bastıran devrelerdir. Bu sayede sinyal üzerindeki istenmeyen kısımlar, parazitler ortadan kaldırılmış olur. ... Yüksek geçiren filtreler ise belirli frekansların üzerindeki sinyalleri geçirirler.

Kullanım Amaçları
Filtre devreleri, haberleşme sistemlerinin en önemli elemanlarından biri, belirli bir frekans bölgesinde istenilen bir zayıflama ya da geciktirme karakteristiğini sağlayan devrelerdir.
Hemen hemen haberleşme sistemlerinin tümünde bulunan filtreler, belli bir frekans bandının geçmesine izin verirken bu bant dışında kalan frekansların ise zayıflatılmasını sağlar ve bu amaç için tasarlanır.


 Bu projede yüksek ve alçak geçiren filtre MATLAB ortamında tasarlanıp uygulamaya çekilmiştir.
 
 x=audioread(‘MatlabProjesiSesi.ogg’); ile kendi oluşturduğum ses kaydını x değişkenine atamış oldum. Fs=50000 ile sesime en yakın frekansı Fs ye Hz cinsinden atadım. W ile grafiğimin hangi değerler arasında işlenmesi istediğimi belirttim. Stem ile de bu grafikleri ekranıma aldım. Daha sonra eğer bir örnekleme frekansı var ise onu matlab kodları ile düzenledim. Daha sonra filtreleme aşamasına geldim. İlk olarak FIR ile yüksek geçiren filtre yapmayı amaçladım.Daha sonra bu tanımladığım FIR doğrusal filtresini ‘Export’ ederek Workplace alanına taşıdım. Y1 değerine eşitledim ve sound(y1,Fs) ile kendi frekanslı olan sinyalimi filtreden geçecek şekilde dinliyorum.
Daha sonra ses kaydımı alçak geçiren filtreden geçirmek istedim ve ‘filterDesigner’ da alçak geçiren filtre tasarladım.
Daha sonra bu tanımladığım IIR alçak geçiren filtresini ‘Export’ ederek Workplace alanına taşıdım. IIR filtreden geçilmiş sinyali sound ederek duyulmasını sağlıyorum.

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
