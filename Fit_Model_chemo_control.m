







%model A--use cum all perf -independent 2 loops, with random noise

clear all
tic

load model_chem_control.mat



parm_results=[];


parfor qq=1:39


       
 ResModData=modeldata{qq,1};
  
results=[];



for parm1=[0.005 0.01 0.05 0.1 0.5]*10e7;% delta1
    for parm2=[0.3 0.4 0.5 0.6 0.7 0.8 0.9]*10e7;%start spw
        for parm3=[0.005 0.01 0.05 0.1 0.5]*10e7;% delta2            
            
            
        startParms=[parm1 parm2 parm3];

         [finalParms , finDiscrepancy]=wrap_2lp_rand(startParms,ResModData); 

        results=[results;[finalParms finDiscrepancy]];

        end
    end 
end


row=find(results(:,end)==min(results(:,end)));
finalParms=results(row,:);
if size(finalParms,1)>1
    finalParms=finalParms(1,:);
end
parm_results=[parm_results;[qq finalParms]];



end% end of q*************************


%  save(['mod2lp_control_result.mat'],'parm_results')%cum perf

 
toc









%%



%model B--only auditory weight, all perf

clear all
tic

load model_chem_control.mat



parm_results=[];


for qq=1:39


       
 ResModData=modeldata{qq,1};
  
results=[];



for parm1=[0.005 0.01 0.05 0.1 0.5]*10e7;% delta1
    for parm2=[0.3 0.4 0.5 0.6 0.7 0.8 0.9]*10e7;%start aw
        for parm3=[0.005 0.01 0.05 0.1 0.5]*10e7;% delta2            
            
            
        startParms=[parm1 parm2 parm3];

         [finalParms , finDiscrepancy]=wrap_onlyaud(startParms,ResModData); 

        results=[results;[finalParms finDiscrepancy]];

        end
    end 
end


row=find(results(:,end)==min(results(:,end)));
finalParms=results(row,:);
if size(finalParms,1)>1
    finalParms=finalParms(1,:);
end
parm_results=[parm_results;[qq finalParms]];



end% end of q*************************


%  save(['mod_audonly_control_result.mat'],'parm_results')%cum perf

toc


%%




%model C--only auditory weight, all perf,+ aversion to sound

clear all
tic

load model_chem_control.mat



parm_results=[];


for qq=1:39


       
 ResModData=modeldata{qq,1};
  
results=[];


for parm1=[0.005 0.01 0.05 0.1 0.5]*10e7;% delta1
    for parm2=[0.3 0.4 0.5 0.6 0.7 0.8 0.9]*10e7;%start aw
        for parm3=[0.005 0.01 0.05 0.1 0.5]*10e7;% delta2            
            for parm4=[0.01 0.1 0.5]*10e7;% aversion            
            
        startParms=[parm1 parm2 parm3 parm4];

         [finalParms , finDiscrepancy]=wrap_onlyaud_aversion(startParms,ResModData); 

        results=[results;[finalParms finDiscrepancy]];
            end 
        end
    end 
end


row=find(results(:,end)==min(results(:,end)));
finalParms=results(row,:);
if size(finalParms,1)>1
    finalParms=finalParms(1,:);
end
parm_results=[parm_results;[qq finalParms]];



end% end of q*************************


%  save(['mod_audonly_aversion_control_result.mat'],'parm_results')%cum perf

toc

