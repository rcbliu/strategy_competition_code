function [perf_s awhist choice_s phist]=model_act_onlyaud(delta1,delta2,aw,side);
% thre=1;
     delta1=delta1/10e7;
     delta2=delta2/10e7;
     aw=aw/10e7;
    
 
    
   rng("default")
%   rng(9,"threefry")

  
  perf_s=[]; 
  choice_s=[];
  awhist=aw;
phist=[];
  for i=1:length(side);
%         make an action


        
%         if aw>spw;    
%             act=side(i);
%         else
%             if i>1
%                 act=side(i-1);
%             else
%                 act=randi([0, 1]);
%             end
%         end
        
        p=(aw+1)/2;
        if p>1
            p=1;
        end
        awspw=binornd(1,p);   
        
         phist=[phist;awspw];
                
        if awspw==1;
            act=side(i);
        else
            act=int32(~side(i));
        end

        outcome=abs(act-side(i)) ;%if 1 wrong, if 0 correct
        perf_s=[perf_s;outcome];
        choice_s=[choice_s;act];    
        
        %update aud weight      
        if outcome==0 %correct
                if aw<1
                  aw=aw+delta1; %if correct, aw + delta
                end  
        else
                if aw<1
                  aw=aw+delta2; %if wrong, aw + small delta     
                end             
        end
        
        
%         %update spatial weight
%         if i>1
% 
%             altside=abs(side(i)-side(i-1)); %if 1 alt, if 0 ss
%             
%             if outcome==0 %correct
%                 if aw<1
%                   aw=aw+delta1; %if correct, aw + delta
%                 end     
%                 if altside==0&spw<1 
%                   spw=spw+delta1;  %if correct & ss, spw + delta           
%                 end
%             else
%                 if aw<1
%                   aw=aw+delta2; %if wrong, aw + small delta     
%                 end 
%                 if altside==0 &spw>0
%                   spw=spw-delta1;  %if wrong & ss, spw - delta                       
%                 end                
%             end
%         end
 

         
         awhist=[awhist;aw];
     
        
    end




perf_s=~perf_s;
% figure;plot(cumsum(perf_s))

