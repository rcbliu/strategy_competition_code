
%    matlabpool('open',4);
%%

tic

load modeldata_12.mat
% load behMod.mat

%  q_list=[1]';
parm_results=[];
% for qq=q_list;
% for qq=2

parfor qq=1:12
% parfor(qq=1:8,8)

       
 ResModData=modeldata{qq,1};
  
results=[];


for parm1=[0.005 0.01 0.05 0.1 0.5]*10e7;% delta1
    for parm2=[0.3 0.4 0.5 0.6 0.7 0.8 0.9]*10e7;%start spw
        for parm3=[0.005 0.01 0.05 0.1 0.5]*10e7;% delta2            
            
            
        startParms=[parm1 parm2 parm3];

         [finalParms , finDiscrepancy]=wraponeloop(startParms,ResModData); 

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

% save(['fina_1lp_model_results.mat'],'parm_results')

 
toc
