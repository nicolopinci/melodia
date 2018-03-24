function [s] = pausa(durata, vett)
% Realizza una pausa
%   Detailed explanation goes here

fc=10000; % n. campioni al secondo
T=1/fc; % passo tra i campioni

t=0:T:durata/3;    % asse temporale
A=durata;

s=zeros(size(t));
s=cat(2,vett,s);

end

