%DAE 8th Example 3.7
%Tukeys test, pairwise differences in the mean
%H0: µi=µj
%H1: not

alfa=0.05;
% The data. 
Y=[575, 542, 530, 539, 570;
565, 593, 590, 579, 610;
600, 651, 610, 637, 629;
725, 700, 715, 685, 710];

a=size(Y,1); %number of treatments
n=size(Y,2); %number of replicates for each treatment
N=a*n;
n_vector=n*ones(size(Y,1),1);
y_mean=mean(Y,2); %means  wrt the treatments
y_mean_max=max(y_mean);
y_mean_min=min(y_mean);
S_i=std(Y,0,2);
MSE=((n_vector-1)'*S_i.^2)/(N-a); %note the vector operation

%this was called Sp^2 in exampe 3.4. What's the difference? 
q=qdist(alfa,a,N-a); %I found this function at https://se.mathworks.com/matlabcentral/fileexchange/49144-qdist-alpha-k-v-

%The statistic
T005=q*sqrt(MSE/n); %33.0536

%Therefore any difference in means which are greater in absolute value
%indicate a significant difference

D=pdist2(y_mean,y_mean); %the absolute values of the differences between the means

% D =
% 
%          0   36.2000   74.2000  155.8000
%    36.2000         0   38.0000  119.6000
%    74.2000   38.0000         0   81.6000
%   155.8000  119.6000   81.6000         0

D>T005
% 
% ans =
% 
%      0     1     1     1
%      1     0     1     1
%      1     1     0     1
%      1     1     1     0
