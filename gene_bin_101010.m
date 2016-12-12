function bits=gene_bin(N,p0,flag);
%
%function bits=gene_bin(N,p0,flag);
%
% Cette fonction génère une suite binaire pas aleatoire.
% Les valeurs binaires sont +1 et -1 si flag=1 et 0 et 1 si flag=0.
% p0 = proba(0);
% N = nombre de la suite
%
% Auteur blkjhx, 2016

bits_int=ones(N,1);
for i =1:N,
    if mod(i,2)==0 %NRZ : bit(i) = 0 ? -> amplitude = -A (default: sinon amplitude = A)
        bits_int(i)=0;
    end
end

bits=bits_int;
