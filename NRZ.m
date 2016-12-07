function x = NRZ(b,A,Nech_par_bit)

%--------------------------------------
%function x = NRZ(b,A,Nech_par_bit)
%
%Code NRZ
%b est la suite binaire � coder
%A est l'amplitude des raies
%Nech_par_bit est le rapport Tb/Te=Fe/Fb
%x est la suite cod�e
%---------------------------------------

N=length(b);
%--------------------------------------
%1- Association d'amplitude � chaque bit
%(chaque bit est de dur�e Tb=1/Fb)
%--------------------------------------
a=ones(N,1)*A;
for i =1:N,
    if b(i)==0
        a(i)=-A;
    end
end

%--------------------------------------------
%2- Passage dans le filtre de mise en forme 
%(on associe donc un signal discret dont 
% les �chantillons sont espac�s de Te=1/Fe)
%---------------------------------------------
%association Nech_par_bit �chantillons � chaque bit
Nech_tot = N*Nech_par_bit;
at=zeros(Nech_tot,1);
at(1:Nech_par_bit:Nech_tot)=a;
%r�ponse impulsionnelle du filtre rectangulaire
s=ones(1,Nech_par_bit);
%signal filtr�
x=filter(s,1,at);

