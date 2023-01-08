function rythmSelect()

global hMenu1 hAxes1 hAxes2 hAxes3 RR3

r=get(hMenu1,'Value');
if r==1
    axes(hAxes1)
    cla
    axes(hAxes2)
    cla
    axes(hAxes3)
    cla
    return
end
RR=RR3(:,r-1); % Load selected cardiorhythm

% Plotting rhythmogram
axes(hAxes1)
cla
hold on
NRR=length(RR);
for i=1:NRR
    x(1)=i;
    x(2)=i;
    R(1)=0;
    R(2)=RR(i);
    plot(x,R);
end
maxRR=max(RR)*1.2;
set(hAxes1,'Ylim',[0 maxRR])

% Plotting the histogram of RR distribution
axes(hAxes2)
dH=0.05;
X=0:dH:maxRR;
H=histc(RR,X);
SH=sum(H);
PH=H/SH*100;
bar(X,PH,'histc')
maxh=max(PH)*1.2;
set(hAxes2,'Ylim',[0 maxh])

% Сalculation of statistical characteristics of cardiorhythm
RRmean=mean(RR); % RR duration mean value
RRmin=min(RR); % RR duration minimum value
RRmax=max(RR); % RR duration maximum value
dRR=RRmax-RRmin; %% RR variation range
[AMo,iMo]=max(PH); %% RR mode amplitude
Mo=iMo*dH; %% RR moda

% Plotting the scattergram and calcuclated characteristics
axes(hAxes3)
plot(RR(1:NRR-1),RR(2:NRR),'.')
text(maxRR/20,maxRR-maxRR/15,['RRmean=' num2str(RRmean) ' c'])
text(maxRR/20,maxRR-2*maxRR/15,['RRmin=' num2str(RRmin) ' c'])
text(maxRR/20,maxRR-3*maxRR/15,['RRmax=' num2str(RRmax) ' c'])
text(maxRR/20,maxRR-4*maxRR/15,['dRR=' num2str(dRR) ' c'])
text(maxRR/20,maxRR-5*maxRR/15,['AMo=' num2str(AMo) ' %'])
text(maxRR/20,maxRR-6*maxRR/15,['iMo=' num2str(iMo)])
text(maxRR/20,maxRR-7*maxRR/15,['Mo=' num2str(Mo) ' c'])
set(hAxes3,'Xlim',[0 maxRR],'Ylim',[0 maxRR])

xlabel(hAxes1,'RR number')
ylabel(hAxes1,'RR duration, s')
title(hAxes1,'Rhythmogram')

xlabel(hAxes2,'RR duration, s')
ylabel(hAxes2,'Rate')
title(hAxes2,'RR histogram')

xlabel(hAxes3,'RR duration, s')
ylabel(hAxes3,'RR duration, s')
title(hAxes3,'Scattergram')
end