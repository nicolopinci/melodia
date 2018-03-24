clear all


fc=100000; % n. campioni al secondo
prompt = 'Scegliere uno strumento musicale:\n1 - Base\n2 - Chitarra\n3 - Armoniche casuali\n4 - Violino\n5 - Pianoforte\nScelta: ';
strumento=input(prompt);

if(strumento<1 | strumento >5)
    'Scelta non valida. Verrà suonato lo strumento di base.'
    strumento = 1;
end

iniz=zeros(0);
[s]=suona_nota("mib",5,1, iniz, fc, strumento);
[s]=suona_nota("re",5,1, s, fc, strumento);

[s]=suona_nota("reb",5,2/3, s, fc, strumento);
[s]=suona_nota("mib",5,2/3, s, fc, strumento);
[s]=suona_nota("reb",5,2/3, s, fc, strumento);
[s]=suona_nota("do",5,1, s, fc, strumento);
[s]=suona_nota("reb",5,1, s, fc, strumento);
[s]=suona_nota("fa",5,1, s, fc, strumento);
[s]=suona_nota("mib",5,1, s, fc, strumento);

[s]=suona_nota("reb",5,4, s, fc, strumento);
[s]=suona_nota("do",5,2, s, fc, strumento);

s=pausa(1,s);
[s]=suona_nota("la",4,1, s, fc, strumento);
[s]=suona_nota("sib",4,1, s, fc, strumento);
[s]=suona_nota("do",5,2/3, s, fc, strumento);
[s]=suona_nota("mib",5,2/3, s, fc, strumento);
[s]=suona_nota("reb",5,2/3, s, fc, strumento);

[s]=suona_nota("do",5,4, s, fc, strumento);
[s]=suona_nota("sib",4,2, s, fc, strumento);

[s]=suona_nota("sib",4,3, s, fc, strumento);
[s]=suona_nota("lab",4,1, s, fc, strumento);
[s]=suona_nota("lab",4,2/3, s, fc, strumento);
[s]=suona_nota("sol",4,2/3, s, fc, strumento);
[s]=suona_nota("fa",4,2/3, s, fc, strumento);

[s]=suona_nota("fa",4,4, s, fc, strumento);
[s]=suona_nota("mib",4,2, s, fc, strumento);


% plot(s)
soundsc(s,fc)


