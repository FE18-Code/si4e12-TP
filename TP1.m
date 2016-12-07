close all;
clear all;

%G�n�ration d'une suite binaire (� compl�ter)
%---------------------------------------------
N = ...;                  %N est la longueur de la suite binaire
p0 = ...;                 %p0 est la probabilit� de la valeur binaire 0
bits=gene_bin(...);       %la suite binaire � coder est � valeurs dans {0,1}

%Codage en ligne
%----------------
fe = ...;
fe_sur_fb = ...; 
fb = ...;
A=3;

yNRZ=NRZ(...);
%yBiph=Biphase(...);
%yBipNRZ=BipolaireNRZ(...);

%Trac� des signaux
%-------------------
Naff = 100;
temps_bits = ...;     %vecteur temps pour la suite de bits
temps_signal = ...;   %vecteur temps pour le signal

figure(1);
subplot(411);stem(temps_bits,bits);xlabel('Suite binaire');
grid
subplot(412);plot(temps_signal,yNRZ);xlabel('Signal NRZ');
grid
%subplot(413);plot(temps_signal(1:Naff),yBiph(1:Naff));xlabel('Signal Biphase');
%grid
%subplot(414);plot(temps_signal(1:Naff),yBipNRZ(1:Naff));xlabel('Signal Bipolaire-NRZ');
%grid

%Estimation et trac� des densit�s spectrales de puissance
%---------------------------------------------------------
[S_NRZ,f]=pwelch(...);
%[S_Biph,f]=...;
%[S_BipNRZ,f]=...;

f = [0:length(S_NRZ)-1]*fe/(2*length(S_NRZ));
figure(2);
plot(f,S_NRZ);
%hold on;plot(f,S_Biph,'r');
%hold on;plot(f,S_BipNRZ,'g');
legend('Dsp du signal cod� NRZ','Dsp du signal cod� Biphase','Dsp du signal cod� Bipolaire NRZ');
grid

