% Melodia popolare ungherese

clear all

fc=100000; % n. campioni al secondo
prompt = 'Scegliere uno strumento musicale:\n1 - Base\n2 - Chitarra\n3 - Armoniche casuali\n4 - Violino\n5 - Pianoforte\nScelta: ';
strumento=input(prompt);

if(strumento<1 | strumento >5)
    'Scelta non valida. Verrà suonato lo strumento di base.'
    strumento = 1;
end
iniz=zeros(0);
[s]=suona_nota("si",3,1, iniz, fc, strumento);
[s]=suona_nota("do#",4,1, s, fc, strumento);
[s]=suona_nota("re",4,1, s, fc, strumento);
[s]=suona_nota("do#",4,1, s, fc, strumento);
[s]=suona_nota("re",4,1, s, fc, strumento);
[s]=suona_nota("do#",4,1, s, fc, strumento);

[s]=suona_nota("si",3,2, s, fc, strumento);

[s]=suona_nota("si",3,1, s, fc, strumento);
[s]=suona_nota("do#",4,1, s, fc, strumento);
[s]=suona_nota("re",4,1, s, fc, strumento);
[s]=suona_nota("do#",4,1, s, fc, strumento);

[s]=suona_nota("si",3,2, s, fc, strumento);
[s]=suona_nota("si",3,2, s, fc, strumento);

[s]=suona_nota("fa#",4,1, s, fc, strumento);
[s]=suona_nota("mi",4,1, s, fc, strumento);
[s]=suona_nota("re",4,1, s, fc, strumento);
[s]=suona_nota("do#",4,1, s, fc, strumento);

[s]=suona_nota("re",4,1, s, fc, strumento);
[s]=suona_nota("do#",4,1, s, fc, strumento);
[s]=suona_nota("si",3,2, s, fc, strumento);


[s]=suona_nota("si",3,1, s, fc, strumento);
[s]=suona_nota("do#",4,1, s, fc, strumento);
[s]=suona_nota("re",4,1, s, fc, strumento);
[s]=suona_nota("do#",4,1, s, fc, strumento);

[s]=suona_nota("si",3,2, s, fc, strumento);
[s]=suona_nota("si",3,2, s, fc, strumento);

soundsc(s,fc)


