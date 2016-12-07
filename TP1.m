close all;
clear all;

%Génération d'une suite binaire (à compléter)
%---------------------------------------------
N = 1000;                  %N est la longueur de la suite binaire
p0 = 0.5;                 %p0 est la probabilité de la valeur binaire 0
bits=gene_bin(N, p0, 0);       %la suite binaire à coder est à valeurs dans {0,1}

%Codage en ligne
%----------------
fe = 1200;
fe_sur_fb = 12; 
fb = fe/fe_sur_fb;
A=3;    %amplitude des raies

yNRZ=NRZ(bits, A, fe_sur_fb);
yBiph=Biphase(bits, A, fe_sur_fb);
%yBipNRZ=BipolaireNRZ(...);

%Tracé des signaux
%-------------------
Naff = 100;
temps_bits = [0:N-1]*1/fb;     %vecteur temps pour la suite de bits
temps_signal = [0:12*N-1]*1/fe;   %vecteur temps pour le signal

figure(1);
subplot(411);stem(temps_bits,bits);xlabel('Suite binaire');
grid
subplot(412);plot(temps_signal,yNRZ);xlabel('Signal NRZ');
grid
subplot(413);plot(temps_signal(1:Naff),yBiph(1:Naff));xlabel('Signal Biphase');
grid
%subplot(414);plot(temps_signal(1:Naff),yBipNRZ(1:Naff));xlabel('Signal Bipolaire-NRZ');
%grid

%Estimation et tracé des densités spectrales de puissance
%---------------------------------------------------------
Nfft = 512;
[S_NRZ,f]=pwelch(yNRZ, blackman(Nfft), 0, Nfft, fe);
[S_Biph,f]=pwelch(yBiph, blackman(Nfft), 0, Nfft, fe);
%[S_BipNRZ,f]=...;

f = [0:length(S_NRZ)-1]*fe/(2*length(S_NRZ));
figure(2);
plot(f,S_NRZ);
hold on;plot(f,S_Biph,'r');
%hold on;plot(f,S_BipNRZ,'g');
legend('Dsp du signal codé NRZ');%,'Dsp du signal codé Biphase','Dsp du signal codé Bipolaire NRZ');
grid

