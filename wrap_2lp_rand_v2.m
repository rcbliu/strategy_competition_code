

function [finalParms , finDiscrepancy]=wrap_2lp_rand_v2(startParms,ResModData); 
% options = optimset('Display','iter')
  options = optimset('MaxFunEvals',500*length(startParms),'MaxIter',500*length(startParms));
 [finalParms , finDiscrepancy] = fminsearchbnd(@fitModBY,startParms,[0 0 0],[10e7 10e7 10e7],options) ;
% [finalParms , finDiscrepancy] = fminsearch(@fitModBY,startParms) ;
function rmsd=fitModBY(startParms)

param=startParms;
% weight

delta1=param(1);
spw=param(2);
delta2=param(3);
aw=0;
side=ResModData(:,1);
choice=ResModData(:,2);
perf=ResModData(:,3);
% resall=ResModData(:,4);

% [perf_s awhist spwhist choice_s]=model_act_2lp_rand_v2(delta1,delta2,aw,spw,side);
[perf_s awhist spwhist choice_s]=model_act_2lp_rand(delta1,delta2,aw,spw,side);

% figure;
% hold;
% plot(cumsum(perf_s),'r-')
% plot(cumsum(perf),'b-')
% figure;
% hold;
% plot((perf_s),'r-')
% plot((perf),'b-')

% fit all perf
% sd=(perf_s-perf).^ 2 ;
% sd=(cumsum(perf_s)-cumsum(perf)).^ 2 ;

% fit choice
% sd=(choice_s-choice).^ 2 ;
% sd=10000*(sd);

% fit cum aud perf
sidediff=diff(side);
row=find(sidediff~=0);
audperf=perf(row+1);
audperf_s=perf_s(row+1);

sd=(cumsum(audperf_s)-cumsum(audperf)).^ 2 ;
% sd=(cumsum(perf_s)-cumsum(perf)).^ 2 ;

% sd=(cumsum(subperf_s)-cumsum(subperf)).^ 2 ;

% fit mov ave aud perf
% sidediff=diff(side);
% row=find(sidediff~=0);
% audperf=perf(row+1);
% audperf_s=perf_s(row+1);
% audperf=movmean(audperf,10);
% audperf_s=movmean(audperf_s,10);
% audperf=smoothdata(audperf,'gaussian',10);
% audperf_s=smoothdata(audperf_s,'gaussian',10);

% figure;
% hold;
% plot((audperf_s),'r-')
% plot((audperf),'b-')

% sd=((audperf_s)-(audperf)).^ 2 ;


% fit aud perf + spatial perf 
% row=find(sidediff==0);
% sp_perf=int64(~abs(choice(2:end)-side(1:end-1)));
% sp_perf_s=int64(~abs(choice_s(2:end)-side(1:end-1)));
% sp_perf=sp_perf(row);
% sp_perf_s=sp_perf_s(row);
% sd2=(cumsum(sp_perf_s)-cumsum(sp_perf)).^ 2 ;
% sd=[sd;sd2];

rmsd= sqrt( sum(sd) / numel(sd) ) ;

end%function fitMod

end%wrap4min