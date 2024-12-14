

%Compare 3 three models
% use 39 control animal behavior data

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
%One animal example

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

hold;
plot(cumsum(perf_s),'b-','linewidth',3)
plot(cumsum(perf),'k-','linewidth',3)

sd=(cumsum(perf_s)-cumsum(perf)).^ 2 ;
rmsd1= sqrt( sum(sd) / numel(sd) ) ;





%Evaluate Model B--only auditory weight, all perf
%plot fit performance


load mod_audonly_control_result

parm_results2=parm_results;
parm_results2(:,2:4)=parm_results2(:,2:4)/10e7;


rmsd_all=[];


qq=parm_results(qq,1);
 param=parm_results(qq,2:5);
 Disc=parm_results(qq,end);
 






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
plot(cumsum(perf_s),'r-','linewidth',3)

sd=(cumsum(perf_s)-cumsum(perf)).^ 2 ;
rmsd2= sqrt( sum(sd) / numel(sd) ) ;

%Evaluate Model C--only auditory weight, all perf,+ aversion to sound
%plot fit performance



load mod_audonly_aversion_control_result

parm_results2=parm_results;
parm_results2(:,2:4)=parm_results2(:,2:4)/10e7;


rmsd_all=[];

qq=parm_results(qq,1);
 param=parm_results(qq,2:5);
 Disc=parm_results(qq,end);
 






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



% figure
plot(cumsum(perf_s),'y-','linewidth',3)

sd=(cumsum(perf_s)-cumsum(perf)).^ 2 ;
rmsd3= sqrt( sum(sd) / numel(sd) ) ;

title(num2str(qq))

end

%%


load control_three_model_results

%compare rmsd 3 models


figure
hold on;
cdfplot(rmsd_all1(:,1));
cdfplot(rmsd_all2(:,1));
cdfplot(rmsd_all3(:,1));
grid off
title('')

[p h stats]=signrank(rmsd_all1(:,1),rmsd_all2(:,1))
% p =   1.2541e-05
% zval: -4.3680

[p h stats]=signrank(rmsd_all1(:,1),rmsd_all3(:,1))
% p =   5.2533e-08
% zval: -5.4425
%%

%Learning curves 3 models of all 39 animals
load model_chem_control.mat




figure

rmsd_all=[];
for qq=1:39
    
    
    
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


subplot(10,4,qq);

hold;
plot(cumsum(perf_s),'linewidth',3)








%Evaluate Model B--only auditory weight, all perf
%plot fit performance


load mod_audonly_control_result

parm_results2=parm_results;
parm_results2(:,2:4)=parm_results2(:,2:4)/10e7;


rmsd_all=[];


qq=parm_results(qq,1);
 param=parm_results(qq,2:5);
 Disc=parm_results(qq,end);
 






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
plot(cumsum(perf_s),'linewidth',3)



%Evaluate Model C--only auditory weight, all perf,+ aversion to sound
%plot fit performance



load mod_audonly_aversion_control_result

parm_results2=parm_results;
parm_results2(:,2:4)=parm_results2(:,2:4)/10e7;


rmsd_all=[];

qq=parm_results(qq,1);
 param=parm_results(qq,2:5);
 Disc=parm_results(qq,end);
 






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



% figure
plot(cumsum(perf_s),'linewidth',3)



plot(cumsum(perf),'k-','linewidth',1.5)

% subtitle(num2str(qq))

end




%%




%simulate CNO effect on controls with daily perf, switch to saline

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%
%Do simulation



load mod2lp_control_result
load model_chem_control.mat

parm_results2=parm_results;
parm_results2(:,2:4)=parm_results2(:,2:4)/10e7;
% figure;
% hold on;

cnoeffect=0.559;
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

[perf_s awhist spwhist choice_s aw]=model_act_CNO_2lp_rand(delta1,delta2,aw,spw,side,cnoeffect);

perf_s=double(perf_s);
% sidediff=diff(side);
% row=find(sidediff~=0);
% audperf=perf(row+1);
% audperf_s=perf_s(row+1);
% 
% row=find(sidediff==0);
% ssperf=perf(row+1);
% ssperf_s=perf_s(row+1);
d=1;
pfd=[];
pfsd=[];
for dd=[1 101 201 301]
    row=(dd:dd+99)';
%     row=find(day==d);
    pfs=perf_s(row,1);
    pfs=sum(perf_s(row,1))/length(row);
    
    pf=perf_s(row,1);
    pf=sum(perf(row,1))/length(row);    
    pfd=[pfd;pf];
    pfsd=[pfsd;pfs];    
    
    perfday(qq,d,1)=pf;
     perfday(qq,d,2)=pfs;   
    
    d=d+1;
end


%simul saline
if length(side)>500
    side_sal=side(401:500);
    perfo=perf(401:500);
else
    side_sal=[side(401:end);randi([0, 1],[500-length(side),1])];
     perfo=perf(401:end);
end
[perf_s awhist spwhist choice_s]=model_act_2lp_rand(delta1,delta2,aw,spw,side_sal);
perf_s=double(perf_s);

perfday(qq,d,1)=sum(perfo)/100;
perfday(qq,d,2)=sum(perf_s)/100; 

end



% figure;
% hold on;
% for qq=1:39
%     pf=perfday(qq,:,1);
%     pfs=perfday(qq,:,2); 
%     plot(pf,'b-');
%     plot(pfs,'r-');    
% end

%%
simresults=[];
for d=1:5
    pf=perfday(:,d,1);
    pfs=perfday(:,d,2); 
   simresults=[simresults;[mean(pf) std(pf)./length(pf)^0.5 mean(pfs) std(pfs)./length(pfs)^0.5]];
end
figure;
hold on;
plot(simresults(:,1),'k-','linewidth',2);
errorbar(simresults(:,1),simresults(:,2),'k-','linewidth',2)
plot(simresults(:,3),'color',[0.6 0.6 0.6],'linewidth',4,'linestyle','-');
errorbar(simresults(:,3),simresults(:,4),'color',[0.6 0.6 0.6],'linewidth',4,'linestyle','-')



% load cno_mpfc
load cno_mpfc2

resall=[];
for d=1:4
    row=find(cnoperfdayall(:,2)==d);
    res=cnoperfdayall(row,3);
    mres=mean(res);
    reser=std(res)/length(res)^0.5;
    resall=[resall;[mres reser]];
end
resall=[resall;[mean(saltest(:,3)) std(saltest(:,3))./12^0.5]];
plot((1:5)',resall(:,1),'color',[0.8500 0.2250 0.8980],'linewidth',2);
errorbar((1:5)',resall(:,1),resall(:,2),'color',[0.8500 0.2250 0.8980],'linewidth',2)

xlim([0.5 5.5])
ylim([0.3 1])


%%
d=5
pf=perfday(:,d,1);
pfs=perfday(:,d,2); 
pfcon=saltest(:,3);
[p h z]=signrank(pf,pfs)
% p =    0.5044
%  zval: -0.6675
 
%simulated pfc restoration vs. normal Day 5 perf (control)
[p h z]=ranksum(pfcon,pfs)
%  p =    0.4742
%  zval: 0.7157
 
 
d=1
    row=find(cnoperfdayall(:,2)==d);
    pfcon=cnoperfdayall(row,3);
    pfs=perfday(:,d,2); 
    [p h z]=ranksum(pfcon,pfs)
% p =    0.0867
% zval: 1.7129
12,39

d=2
    row=find(cnoperfdayall(:,2)==d);
    pfcon=cnoperfdayall(row,3);
    pfs=perfday(:,d,2); 
    [p h z]=ranksum(pfcon,pfs)
% p =    0.1068
% zval: -1.6127


d=3
    row=find(cnoperfdayall(:,2)==d);
    pfcon=cnoperfdayall(row,3);
    pfs=perfday(:,d,2); 
    [p h z]=ranksum(pfcon,pfs)
% p =    0.2338
% zval: 1.1907


d=4
    row=find(cnoperfdayall(:,2)==d);
    pfcon=cnoperfdayall(row,3);
    pfs=perfday(:,d,2); 
    [p h z]=ranksum(pfcon,pfs)
% p =    0.8220
% zval: 0.2250


%%




%
%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%

%%



%Example of modeling normal learning
%plot auditory vs. spatial weight

load model_chem_control.mat






rmsd_all=[];
for qq=27
% for qq=[7 10 12 16 22 23 24 25 27]
    
    
    
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
plot(cumsum(perf_s),'b-','linewidth',2)
plot(cumsum(perf),'k-','linewidth',2)
xlim([1 500])


subplot(1,3,2)
hold;
for d=1:5
    row=find(day==d);
    r=perf(row,1);
    dperf=sum(r)/length(r);
    r=perf_s(row,1);
    dperf_s=sum(r)/length(r);   
    plot(d,dperf,'ko','markersize',10,'linewidth',1)
    plot(d,dperf_s,'b+','markersize',10,'linewidth',1)    
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


plot(awhist,'g-','linewidth',3)
plot(spwhist,'c-','linewidth',3)
ylim([0 1])

xlim([1 500])

title(num2str(qq))
end



%%




%Example of modeling mPFC inactivation and restoration
%plot auditory vs. spatial weight

load model_chem_control.mat






rmsd_all=[];
for qq=27
% for qq=[7 10 12 16 22 23 24 25 27]
    
    
    
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
    plot(d,dperf,'ko','markersize',10,'linewidth',1)
    plot(d,dperf_s,'+','color',[0.5 0.5 0.5],'markersize',10,'linewidth',3)   

    
    
    
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
    plot(5,dperf,'ko','markersize',10,'linewidth',1)
    plot(5,dperf_s,'+','color',[0.5 0.5 0.5],'markersize',10,'linewidth',3)   




cperf2=cumsum(perf)+cperf(end);
cperf_s2=cumsum(perf_s2)+cperf_s(end);



subplot(1,3,1)
hold;
plot(cperf_s,'--','color',[0.5 0.5 0.5],'linewidth',4)
plot(cperf,'k-','linewidth',2)

x=(1:length(cperf2))'+length(cperf);
plot(x,cperf_s2,'--','color',[0.5 0.5 0.5],'linewidth',4)
plot(x,cperf2,'k-','linewidth',2)

plot([length(cperf) length(cperf)],ylim,'k--')
xlim([1 length(cperf)+length(cperf2)])






subplot(1,3,3)
hold;
% plot(cumsum(perf_s),'b-','linewidth',3)
% plot(cumsum(perf),'k-','linewidth',3)


plot(awhist(1:length(day)),'g-','linewidth',3)
plot(spwhist(1:length(day)),'c-','linewidth',3)


plot(x,awhist2(1:end-1),'g-','linewidth',3)
plot(x,spwhist2(1:end-1),'c-','linewidth',3)



ylim([0 1])
plot([length(day) length(day)],ylim,'k--')
xlim([1 length(cperf)+length(cperf2)])

title(num2str(qq))
end





%%


%model results from all 39 animals

load model_chem_control.mat



figure

t=1;
rmsd_all=[];
for qq=1:39
% for qq=[7 10 12 16 22 23 24 25 27]
    
    
    
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


subplot(10,4,t)
hold;
dayperf=[];
for d=1:4
    row=find(day==d);
    r=perf(row,1);
    dperf=sum(r)/length(r);
    r=perf_s(row,1);
    dperf_s=sum(r)/length(r);  
    dayperf=[dayperf;[dperf dperf_s]];
%     plot(d,dperf,'k-')
%     plot(d,dperf_s,'k+')    
end


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
    r=perf_s2;
    dperf_s=sum(r)/length(r);   
 
    dayperf=[dayperf;[dperf dperf_s]];
    
        patch([4.5 5.5 5.5 4.5], [0 0 100 100], [0 0.9 0.9])
    
    plot((1:5)',dayperf(:,1)*100,'k-','linewidth',1)
%     plot((1:5)',dayperf(:,2)*100,'-','color',[0 0.4470 0.7410],'linewidth',2) % #0072BD
    plot((1:5)',dayperf(:,2)*100,'-.','color',[0.5 0.5 0.5],'linewidth',3) % #0072BD
%     plot((1:5)',dayperf(:,2)*100,'+','color',[0.5 0.5 0.5],'markersize',6,'linewidth',2) % #0072BD
    
    ylim([30 100])
    xlim([0.5 5.5])
%     plot([4 4],ylim,'k--')
    t=t+1;


    
cperf2=cumsum(perf)+cperf(end);
cperf_s2=cumsum(perf_s2)+cperf_s(end);



% subplot(10,4,t)
% hold;
% plot(cperf_s,'b-','linewidth',3)
% plot(cperf,'k-','linewidth',3)
% 
% x=(1:length(cperf2))'+length(cperf);
% plot(x,cperf_s2,'b-','linewidth',3)
% plot(x,cperf2,'k-','linewidth',3)
% 
% plot([length(cperf) length(cperf)],ylim,'k--')
% xlim([1 length(cperf)+length(cperf2)])
% 
% t=t+1;



% 
% 
% subplot(1,3,3)
% hold;
% % plot(cumsum(perf_s),'b-','linewidth',3)
% % plot(cumsum(perf),'k-','linewidth',3)
% 
% 
% plot(awhist(1:length(day)),'g-','linewidth',3)
% plot(spwhist(1:length(day)),'c-','linewidth',3)
% 
% 
% plot(x,awhist2(1:end-1),'g-','linewidth',3)
% plot(x,spwhist2(1:end-1),'c-','linewidth',3)
% 
% 
% 
% ylim([0 1])
% plot([length(day) length(day)],ylim,'k--')
% xlim([1 length(cperf)+length(cperf2)])
% 
% title(num2str(qq))
end



%%


