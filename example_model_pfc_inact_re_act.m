

%%



%model normal learning
%plot auditory vs. spatial weight

load model_chem_control.mat






rmsd_all=[];
for qq=10
    
    
    
load mod2lp_control_result

parm_results2=parm_results;
parm_results2(:,2:4)=parm_results2(:,2:4)/10e7;
qq=parm_results(qq,1);
 param=parm_results(qq,2:5);
 Disc=parm_results(qq,end);
 






 ResModData=modeldata{qq,1};
 side=ResModData(:,1);
choice=ResModData(:,2);
perf=ResModData(:,3);

 


% weight

delta1=param(1);
spw=param(2);
delta2=param(3);
aw=0;

side=ResModData(:,1);
choice=ResModData(:,2);
perf=ResModData(:,3);
day=ResModData(:,4);

[perf_s awhist spwhist choice_s]=model_act_2lp_rand(delta1,delta2,aw,spw,side);

sidediff=diff(side);
row=find(sidediff~=0);
audperf=perf(row+1);
audperf_s=perf_s(row+1);

row=find(sidediff==0);
ssperf=perf(row+1);
ssperf_s=perf_s(row+1);


figure;
subplot(1,3,1)
hold;
plot(cumsum(perf_s),'b-','linewidth',3)
plot(cumsum(perf),'k-','linewidth',3)
xlim([1 500])


subplot(1,3,2)
hold;
for d=1:4
    row=find(day==d);
    r=perf(row,1);
    dperf=sum(r)/length(r);
    r=perf_s(row,1);
    dperf_s=sum(r)/length(r);   
    plot(d,dperf,'ko')
    plot(d,dperf_s,'k+')    
end
ylim([0 1])
xlim([0.5 5.5])


load mod2lp_control_result

parm_results2=parm_results;
parm_results2(:,2:4)=parm_results2(:,2:4)/10e7;


rmsd_all=[];

qq=parm_results(qq,1);
 param=parm_results(qq,2:5);
 Disc=parm_results(qq,end);
 
% load modeldata_12.mat





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


subplot(1,3,3)
hold;
% plot(cumsum(perf_s),'b-','linewidth',3)
% plot(cumsum(perf),'k-','linewidth',3)


plot(awhist,'g--','linewidth',3)
plot(spwhist,'c--','linewidth',3)
ylim([0 1.1])

xlim([1 500])

title(num2str(qq))
end



%%





%model mPFC inactivation
%plot auditory vs. spatial weight

load model_chem_control.mat






rmsd_all=[];
for qq=10
    
    
    
load mod2lp_control_result

parm_results2=parm_results;
parm_results2(:,2:4)=parm_results2(:,2:4)/10e7;
qq=parm_results(qq,1);
 param=parm_results(qq,2:5);
 Disc=parm_results(qq,end);
 






 ResModData=modeldata{qq,1};
 
 row=find(ResModData(:,4)==5);
 ResModData2=ResModData(row,:);
 
 row=find(ResModData(:,4)<5);
 ResModData=ResModData(row,:);
 
 side=ResModData(:,1);
choice=ResModData(:,2);
perf=ResModData(:,3);

 


% weight

delta1=param(1);
spw=param(2);
delta2=param(3);
aw=0;
side=ResModData(:,1);
choice=ResModData(:,2);
perf=ResModData(:,3);
day=ResModData(:,4);
% resall=ResModData(:,4);
cnoeffect=0.56;
[perf_s awhist spwhist choice_s aw]=model_act_CNO_2lp_rand(delta1,delta2,aw,spw,side,cnoeffect);

figure
subplot(1,3,2)
hold;
for d=1:4
    row=find(day==d);
    r=perf(row,1);
    dperf=sum(r)/length(r);
    r=perf_s(row,1);
    dperf_s=sum(r)/length(r);   
    plot(d,dperf,'ko')
    plot(d,dperf_s,'k+')    
end
ylim([0 1])
xlim([0.5 5.5])

cperf=cumsum(perf);
cperf_s=cumsum(perf_s);



 side=ResModData2(:,1);
choice=ResModData2(:,2);
perf=ResModData2(:,3);


aw=awhist(end);
spw=param(2);;
[perf_s2 awhist2 spwhist2 choice_s2]=model_act_2lp_rand(delta1,delta2,aw,spw,side);

    r=perf;
    dperf=sum(r)/length(r);
    r=perf_s;
    dperf_s=sum(r)/length(r);   
    plot(5,dperf,'ko')
    plot(5,dperf_s,'k+')   




cperf2=cumsum(perf)+cperf(end);
cperf_s2=cumsum(perf_s2)+cperf_s(end);



subplot(1,3,1)
hold;
plot(cperf_s,'b-','linewidth',3)
plot(cperf,'k-','linewidth',3)

x=(1:length(cperf2))'+length(cperf);
plot(x,cperf_s2,'b.','linewidth',3)
plot(x,cperf2,'k.','linewidth',3)

plot([length(cperf) length(cperf)],ylim,'k--')
xlim([1 500])






subplot(1,3,3)
hold;
% plot(cumsum(perf_s),'b-','linewidth',3)
% plot(cumsum(perf),'k-','linewidth',3)


plot(awhist(1:400),'g-','linewidth',3)
plot(spwhist(1:400),'c-','linewidth',3)


plot(x,awhist2(1:100),'g.','linewidth',3)
plot(x,spwhist2(1:100),'c.','linewidth',3)

plot([400 400],ylim,'k--')

ylim([0 1.1])
xlim([1 500])

title(num2str(qq))
end

