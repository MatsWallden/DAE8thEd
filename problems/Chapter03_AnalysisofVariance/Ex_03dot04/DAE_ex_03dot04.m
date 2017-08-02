%DAE 8th Example 3.4
%Bartlett test
%

%H0: all variances are equal
%H1: at least one is different from the rest

alfa=0.05;
% The data. 
Y=[575, 542, 530, 539, 570;
565, 593, 590, 579, 610;
600, 651, 610, 637, 629;
725, 700, 715, 685, 710];

%power levels [W], corresponding to rows in Y
P=[160, 180, 200, 220];

n=size(Y,2); %number of replicates
N=size(Y,1)*size(Y,2);  %number of runs
a=length(P); % number of treatments

S_i=std(Y,0,2);
n_vector=n*ones(size(S_i));

S_p=sqrt(((n_vector-1)'*S_i.^2)/(N-a)); %note the vector multiplication

q=(N-a)*log10(S_p^2)-(n_vector-1)'*log10(S_i.^2); % 0.2079
c=1+((3*(a-1))^-1)*sum((n_vector-1).^-1-(N-a)^-1); %X1.0833

X0pw2=2.3026*q/c; %0.4418

Xrefpw2=chi2inv(1-alfa,a-1); %7.8147

%X0pw2<Xrefpw2 H0 cannot be rejected!! No evidence suggesting that the
%variances are not equal.