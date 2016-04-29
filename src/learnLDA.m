[WS,DS] = importworddoccounts('vocab.txt');
load('dic');
T = 750;
Alpha = 50/T;
N = 300;
Beta = 0.01;
Output = 1;
Seed =3;

[WP,DP,Z] = GibbsSamplerLDA(WS,DS,T,N,Alpha,Beta,Seed,Output);

save('WP','WP');
save('DP','DP');
save('Z','Z');

cells = dic.keys();

[S] = WriteTopics(WP,Beta,cells,7,0.7);

save('S','S');