function [s] = suona_nota(nome_nota,ottava_nota, durata_nota, vett, fc, strumento)
% Suona una nota data
% Inserire i parametri nome, ottava e durata

if ((nome_nota=='la') | (nome_nota=="sibb") | (nome_nota=="solx"));
    dist=0;
end 
if ((nome_nota=='si') | (nome_nota=="lax") | (nome_nota=="dob"));
    dist=2;
end
if ((nome_nota=='do') | (nome_nota=="si#") | (nome_nota=="rebb"));
    dist=-9;
end
if ((nome_nota=='re') | (nome_nota=="dox") | (nome_nota=="mibb"));
    dist=-7;
end
if ((nome_nota=='mi') | (nome_nota=="rex") | (nome_nota=="fab"));
    dist=-5;
end
if ((nome_nota=='fa') | (nome_nota=="mi#") | (nome_nota=="solbb"));
    dist=-4;
end
if ((nome_nota=="sol") | (nome_nota=="labb") | (nome_nota=="fax"));
    dist=-2;
end



if ((nome_nota=="la#") | (nome_nota=="sib") | (nome_nota=="dobb"));
    dist=1;
end
   


if ((nome_nota=="do#") | (nome_nota=="reb")| (nome_nota=="six"));
    dist=-8;
end
   
if ((nome_nota=="re#") | (nome_nota=="mib") | (nome_nota=="fabb"));
    dist=-6;
end
   
if ((nome_nota=="fa#") | (nome_nota=="solb") | (nome_nota=="mix"));
    dist=-3;
end
   
if ((nome_nota=="sol#") | (nome_nota=="lab"));
    dist=-1;
end
   

fbase=27.5; % frequenza del la0 del pianoforte
incr=nthroot(2,12);
T=1/fc; % passo tra i campioni
f0=fbase*(incr)^(dist+12*ottava_nota); % formula per calcolare la frequenza
t=0:T:durata_nota/3;    % asse temporale
A=durata_nota;

s=zeros(size(t));

II=find(t>=0);  % trova gli indici del vettore t per i quali t>=0

s(II)=exp(-A*t(II));

if(strumento==1)     % base   
    s=s.*cos(2*pi*f0*t);
end

if(strumento==2)    % chitarra
    b=[1.0000 0.5498 0.5004 0.0520 0.0970 0.0690 0.0417  0.1401 0.0900 0.0152 0 0.0610];
    chit = 0;
    for k=1:numel(b);
        chit=chit+b(k)*cos(2*pi*f0*k*t);
    end
    s=s.*chit;
    
end


if(strumento==3)    % casuale
    b=rand(1,int16(rand()*30));
    cas = 0;
    for k=1:numel(b);
        cas=cas+b(k)*cos(2*pi*f0*k*t);
    end
    s=s.*cas;
    
end


if(strumento==4)    % violino - da https://stackoverflow.com/questions/10702942/note-synthesis-harmonics-violin-piano-guitar-bass-frequencies-midi
    b=[1.0 0.286699025 0.150079537 0.042909002 0.203797365  0.229228698  0.156931925  0.115470898  0.0  0.097401803  0.087653465  0.052331036  0.052922462  0.038850593 0.053554676  0.053697434  0.022270261    0.013072562  0.008585879  0.005771505 0.004343925  0.002141371  0.005343231  0.000530244  0.004711017  0.009014153];

    viol = 0;
    for k=1:numel(b);
        viol=viol+b(k)*cos(2*pi*f0*k*t);
    end
    s=s.*viol;
    plot(t,s)
    
end


if(strumento==5)    % pianoforte - da https://stackoverflow.com/questions/10702942/note-synthesis-harmonics-violin-piano-guitar-bass-frequencies-midi
    b=[1.0  0.399064778  0.229404484  0.151836061 0.196754229  0.093742264  0.060871957 0.138605419  0.010535002  0.071021868 0.029954614  0.051299684  0.055948288 0.066208224  0.010067391  0.00753679 0.008196947  0.012955577  0.007316738 0.006216476  0.005116215  0.006243983 0.002860679  0.002558108  0.0 0.001650392];
    viol = 0;
    for k=1:numel(b);
        viol=viol+b(k)*cos(2*pi*f0*k*t);
    end
    s=s.*viol;
    plot(t,s)
    
end




s=cat(2,vett,s);
return;
end

