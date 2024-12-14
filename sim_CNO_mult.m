%%
%Simulate multiple CNO effect levels

load mod2lp_control_result

load model_chem_control.mat

parm_results2=parm_results;
parm_results2(:,2:4)=parm_results2(:,2:4)/10e7;
% figure;
% hold on;
figure
hold on;
for cnoeffect=[0.75 0.5 0.25];
    
% cnoeffect=0.56;
perfday=zeros(39,5,2);
for qq=1:size(parm_results,1)
qq=parm_results(qq,1);
 param=parm_results(qq,2:5);
 Disc=parm_results(qq,end);
  ResModData=modeldata{qq,1};




% weight

delta1=param(1);
spw=param(2);
delta2=param(3);
aw=0;
side=ResModData(:,1);
choice=ResModData(:,2);
perf=ResModData(:,3);
day=ResModData(:,4);

[perf_s awhist spwhist choice_s]=model_act_CNO_2lp_rand(delta1,delta2,aw,spw,side,cnoeffect);

perf_s=double(perf_s);
% sidediff=diff(side);
% row=find(sidediff~=0);
% audperf=perf(row+1);
% audperf_s=perf_s(row+1);
% 
% row=find(sidediff==0);
% ssperf=perf(row+1);
% ssperf_s=perf_s(row+1);
for d=1:4;
pfd=[];
pfsd=[];

    row=find(day==d);
    pfs=perf_s(row,1);
    pfs=sum(perf_s(row,1))/length(row);
    
    pf=perf_s(row,1);
    pf=sum(perf(row,1))/length(row);    
    pfd=[pfd;pf];
    pfsd=[pfsd;pfs];    
    
    perfday(qq,d,1)=100*pf;
     perfday(qq,d,2)=100*pfs;   

end


row=find(day==4);
aw2=awhist(row(end));

d=5;
%simul saline
if length(side)>500
    row=find(day==d);
    side_sal=side(row,1);
    perfo=perf(row,1);
else
    side_sal=[side(401:end);randi([0, 1],[500-length(side),1])];
     perfo=perf(401:end);
end
[perf_s awhist spwhist choice_s]=model_act_2lp_rand(delta1,delta2,aw2,spw,side_sal);
perf_s=double(perf_s);

perfday(qq,d,1)=100*(sum(perfo)/length(perfo));
perfday(qq,d,2)=100*(sum(perf_s)/100); 

end




%%
simresults=[];
for d=1:5
    pf=perfday(:,d,1);
    pfs=perfday(:,d,2); 
   simresults=[simresults;[mean(pf) std(pf)./length(pf)^0.5 mean(pfs) std(pfs)./length(pfs)^0.5]];
end

if cnoeffect<0.7
plot(simresults(:,3),'color',[cnoeffect+0.1 cnoeffect+0.1 cnoeffect+0.1],'linewidth',4,'linestyle','-');
errorbar(simresults(:,3),simresults(:,4),'color',[cnoeffect+0.1 cnoeffect+0.1 cnoeffect+0.1],'linewidth',4,'linestyle','-')
else
    
plot(simresults(:,3),'color',[cnoeffect cnoeffect cnoeffect],'linewidth',4,'linestyle','-');
errorbar(simresults(:,3),simresults(:,4),'color',[cnoeffect cnoeffect cnoeffect],'linewidth',4,'linestyle','-')

end





end

plot(simresults(:,1),'k-','linewidth',2);
errorbar(simresults(:,1),simresults(:,2),'k-','linewidth',2)
xlim([0.5 5.5])
ylim([30 100])


%%


%%
%Simulate multiple CNO effect levels

load mod2lp_control_result

load model_chem_control.mat

parm_results2=parm_results;
parm_results2(:,2:4)=parm_results2(:,2:4)/10e7;

load cno_mpfc2
figure



hold on;
cnoeffect=[0.559];
    
% cnoeffect=0.54;
perfday=zeros(39,5,2);
for qq=1:size(parm_results,1)
qq=parm_results(qq,1);
 param=parm_results(qq,2:5);
 Disc=parm_results(qq,end);
  ResModData=modeldata{qq,1};




% weight

delta1=param(1);
spw=param(2);
delta2=param(3);
aw=0;
side=ResModData(:,1);
choice=ResModData(:,2);
perf=ResModData(:,3);
day=ResModData(:,4);

[perf_s awhist spwhist choice_s]=model_act_CNO_2lp_rand(delta1,delta2,aw,spw,side,cnoeffect);

perf_s=double(perf_s);

for d=1:4;
pfd=[];
pfsd=[];

    row=find(day==d);
    pfs=perf_s(row,1);
    pfs=sum(perf_s(row,1))/length(row);
    
    pf=perf_s(row,1);
    pf=sum(perf(row,1))/length(row);    
    pfd=[pfd;pf];
    pfsd=[pfsd;pfs];    
    
    perfday(qq,d,1)=100*pf;
     perfday(qq,d,2)=100*pfs;   

end


row=find(day==4);
aw2=awhist(row(end));

d=5;
%simul saline
if length(side)>500
    row=find(day==d);
    side_sal=side(row,1);
    perfo=perf(row,1);
else
    side_sal=[side(401:end);randi([0, 1],[500-length(side),1])];
     perfo=perf(401:end);
end
[perf_s awhist spwhist choice_s]=model_act_2lp_rand(delta1,delta2,aw2,spw,side_sal);
perf_s=double(perf_s);

perfday(qq,d,1)=100*(sum(perfo)/length(perfo));
perfday(qq,d,2)=100*(sum(perf_s)/100); 

end





simresults=[];
for d=1:5
    pf=perfday(:,d,1);
    pfs=perfday(:,d,2); 
   simresults=[simresults;[mean(pf) std(pf)./length(pf)^0.5 mean(pfs) std(pfs)./length(pfs)^0.5]];
end

if cnoeffect<0.7
plot(simresults(:,3),'color',[cnoeffect+0.1 cnoeffect+0.1 cnoeffect+0.1],'linewidth',4,'linestyle','-');
errorbar(simresults(:,3),simresults(:,4),'color',[cnoeffect+0.1 cnoeffect+0.1 cnoeffect+0.1],'linewidth',4,'linestyle','-')
else
    
plot(simresults(:,3),'color',[cnoeffect cnoeffect cnoeffect],'linewidth',4,'linestyle','-');
errorbar(simresults(:,3),simresults(:,4),'color',[cnoeffect cnoeffect cnoeffect],'linewidth',4,'linestyle','-')

end


resall=[];
for d=1:4
    row=find(cnoperfdayall(:,2)==d);
    res=100*cnoperfdayall(row,3);
    mres=mean(res);
    reser=std(res)/length(res)^0.5;
    resall=[resall;[mres reser]];
end

plot((1:4)',resall(:,1),'color',[0.8500 0.2250 0.8980],'linewidth',2);
errorbar((1:4)',resall(:,1),resall(:,2),'color',[0.8500 0.2250 0.8980],'linewidth',2)

plot(5.2,100*mean(saltest(:,3)),'o','markersize',12,'color',[0.8500 0.2250 0.8980],'linewidth',2)
plot(5.2,100*mean(saltest(:,3)),'color',[0.8500 0.2250 0.8980],'linewidth',2)
errorbar(5.2,100*mean(saltest(:,3)),100*std(saltest(:,3))./12^0.5,'color',[0.8500 0.2250 0.8980],'linewidth',2) 





xlim([0.5 5.5])
ylim([30 100])


pvalues=[];
for d=1:4
    pfs=perfday(:,d,2); 
    row=find(cnoperfdayall(:,2)==d);
    res=100*cnoperfdayall(row,3);   
    [p h stats]=ranksum(pfs,res);
    
    pvalues=[pvalues;[d p stats.zval]];
end