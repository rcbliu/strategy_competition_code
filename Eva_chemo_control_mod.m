

%%
%Evaluate Model A--use cum all perf -independent 2 loops, with random noise
%plot fit performance



load mod2lp_control_result

parm_results2=parm_results;
parm_results2(:,2:4)=parm_results2(:,2:4)/10e7;


rmsd_all=[];
for qq=1:size(parm_results,1)
qq=parm_results(qq,1);
 param=parm_results(qq,2:5);
 Disc=parm_results(qq,end);
 
load model_chem_control.mat





 ResModData=modeldata{qq,1};
 side=ResModData(:,1);
choice=ResModData(:,2);
perf=ResModData(:,3);

 


% weight

delta1=param(1);
spw=param(2);
delta2=param(3);
aw=0.001;
side=ResModData(:,1);
choice=ResModData(:,2);
perf=ResModData(:,3);
% resall=ResModData(:,4);

[perf_s awhist spwhist choice_s]=model_act_2lp_rand(delta1,delta2,aw,spw,side);

sidediff=diff(side);
row=find(sidediff~=0);
audperf=perf(row+1);
audperf_s=perf_s(row+1);

row=find(sidediff==0);
ssperf=perf(row+1);
ssperf_s=perf_s(row+1);

figure;
subplot(2,2,1)
hold;
plot(cumsum(perf_s),'r-','linewidth',3)
plot(cumsum(perf),'b-','linewidth',3)
sd=(cumsum(perf_s)-cumsum(perf)).^ 2 ;
rmsd1= sqrt( sum(sd) / numel(sd) ) ;
subplot(2,2,2)
hold;
plot(cumsum(audperf_s),'r-','linewidth',3)
plot(cumsum(audperf),'b-','linewidth',3)
sd=(cumsum(audperf_s)-cumsum(audperf)).^ 2 ;
rmsd2= sqrt( sum(sd) / numel(sd) ) ;
subplot(2,2,3)
hold;
plot(cumsum(ssperf_s),'r-','linewidth',3)
plot(cumsum(ssperf),'b-','linewidth',3)
sd=(cumsum(ssperf_s)-cumsum(ssperf)).^ 2 ;
rmsd3= sqrt( sum(sd) / numel(sd) ) ;
rmsd_all=[rmsd_all;[rmsd1 rmsd2 rmsd3]];

end
rmsd_all1=rmsd_all;


%%



%%
%Evaluate Model B--only auditory weight, all perf
%plot fit performance


load mod_audonly_control_result

parm_results2=parm_results;
parm_results2(:,2:4)=parm_results2(:,2:4)/10e7;


rmsd_all=[];
for qq=1:size(parm_results,1)

qq=parm_results(qq,1);
 param=parm_results(qq,2:5);
 Disc=parm_results(qq,end);
 
load model_chem_control.mat





 ResModData=modeldata{qq,1};
 side=ResModData(:,1);
choice=ResModData(:,2);
perf=ResModData(:,3);

delta1=param(1);
aw=param(2);
delta2=param(3);
% aw=0.001;
side=ResModData(:,1);
choice=ResModData(:,2);
perf=ResModData(:,3);
% resall=ResModData(:,4);

[perf_s awhist choice_s phist]=model_act_onlyaud(delta1,delta2,aw,side);

sidediff=diff(side);
row=find(sidediff~=0);
audperf=perf(row+1);
audperf_s=perf_s(row+1);

row=find(sidediff==0);
ssperf=perf(row+1);
ssperf_s=perf_s(row+1);

% figure
% plot(perf_s)
% figure
% plot(phist)
% 


figure;
subplot(2,2,1)
hold;
plot(cumsum(perf_s),'r-','linewidth',3)
plot(cumsum(perf),'b-','linewidth',3)
sd=(cumsum(perf_s)-cumsum(perf)).^ 2 ;
rmsd1= sqrt( sum(sd) / numel(sd) ) ;
subplot(2,2,2)
hold;
plot(cumsum(audperf_s),'r-','linewidth',3)
plot(cumsum(audperf),'b-','linewidth',3)
sd=(cumsum(audperf_s)-cumsum(audperf)).^ 2 ;
rmsd2= sqrt( sum(sd) / numel(sd) ) ;
subplot(2,2,3)
hold;
plot(cumsum(ssperf_s),'r-','linewidth',3)
plot(cumsum(ssperf),'b-','linewidth',3)
sd=(cumsum(ssperf_s)-cumsum(ssperf)).^ 2 ;
rmsd3= sqrt( sum(sd) / numel(sd) ) ;
rmsd_all=[rmsd_all;[rmsd1 rmsd2 rmsd3]];
end
rmsd_all2=rmsd_all;

%%


%%

%%
%Evaluate Model C--only auditory weight, all perf,+ aversion to sound
%plot fit performance



load mod_audonly_aversion_control_result

parm_results2=parm_results;
parm_results2(:,2:4)=parm_results2(:,2:4)/10e7;


rmsd_all=[];
for qq=1:size(parm_results,1)
qq=parm_results(qq,1);
 param=parm_results(qq,2:5);
 Disc=parm_results(qq,end);
 
load model_chem_control.mat





 ResModData=modeldata{qq,1};
 side=ResModData(:,1);
choice=ResModData(:,2);
perf=ResModData(:,3);

delta1=param(1);
aw=param(2);
delta2=param(3);
aversion=param(4);
% aw=0.001;
side=ResModData(:,1);
choice=ResModData(:,2);
perf=ResModData(:,3);
% resall=ResModData(:,4);

[perf_s awhist choice_s]=model_act_onlyaud_aversion(delta1,delta2,aw,aversion,side);

sidediff=diff(side);
row=find(sidediff~=0);
audperf=perf(row+1);
audperf_s=perf_s(row+1);

row=find(sidediff==0);
ssperf=perf(row+1);
ssperf_s=perf_s(row+1);

figure;
subplot(2,2,1)
hold;
plot(cumsum(perf_s),'r-','linewidth',3)
plot(cumsum(perf),'b-','linewidth',3)
sd=(cumsum(perf_s)-cumsum(perf)).^ 2 ;
rmsd1= sqrt( sum(sd) / numel(sd) ) ;
subplot(2,2,2)
hold;
plot(cumsum(audperf_s),'r-','linewidth',3)
plot(cumsum(audperf),'b-','linewidth',3)
sd=(cumsum(audperf_s)-cumsum(audperf)).^ 2 ;
rmsd2= sqrt( sum(sd) / numel(sd) ) ;
subplot(2,2,3)
hold;
plot(cumsum(ssperf_s),'r-','linewidth',3)
plot(cumsum(ssperf),'b-','linewidth',3)
sd=(cumsum(ssperf_s)-cumsum(ssperf)).^ 2 ;
rmsd3= sqrt( sum(sd) / numel(sd) ) ;
rmsd_all=[rmsd_all;[rmsd1 rmsd2 rmsd3]];


end
rmsd_all3=rmsd_all;



% save('control_three_model_results')