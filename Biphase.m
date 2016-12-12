function x = Biphase(b,A,Nech_par_bit)

%--------------------------------------
%function x = Biphase(b,A,Nech_par_bit)
%
%Code Biphase
%b est la suite binaire à coder
%A est l'amplitude des raies
%Nech_par_bit est le rapport Tb/Te=Fe/Fb
%x est la suite codée
%---------------------------------------

N=length(b);
%--------------------------------------
%1- Association d'amplitude à chaque bit
%(chaque bit est de durée Tb=1/Fb)
%--------------------------------------
a=ones(2*N,1)*A;
for i =1:N,
    if b(i)==0 %Biphase : bit(i) = 0 ? -> 2e partie 1/2 amplitude = -A (default: sinon 1e partie 1/2 amplitude = -A)
        a((i*2)-1)=-A;
    else
        a(i*2)=-A;
    end
end

%--------------------------------------------
%2- Passage dans le filtre de mise en forme 
%(on associe donc un signal discret dont 
% les échantillons sont espacés de Te=1/Fe)
%---------------------------------------------
%association Nech_par_bit échantillons à chaque bit
Nech_tot = N*Nech_par_bit;
at=zeros(Nech_tot,1);
at(1:Nech_par_bit:Nech_tot)=a;
%réponse impulsionnelle du filtre rectangulaire
s=ones(1,Nech_par_bit);
%signal filtré
x=filter(s,1,at);

