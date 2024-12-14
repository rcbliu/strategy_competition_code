function [perf_s awhist spwhist choice_s aw]=model_act_CNO_2lp_rand(delta1,delta2,aw,spw,side,cnoeffect);
% thre=1;
     delta1=delta1/10e7;
     delta2=delta2/10e7;
     spw=spw/10e7;
     spw=spw*cnoeffect;
    
 
    
   rng("default")
%   rng(9,"threefry")

  
  perf_s=[]; 
  choice_s=[];
  awhist=aw;
  spwhist=spw;
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
        
        p=aw/(aw+spw);
        awspw=binornd(1,p);        
        if awspw==1;
            act=side(i);
        else
            if i>1
                act=side(i-1);
            else
                act=randi([0, 1]);
            end
        end

        outcome=abs(act-side(i)) ;%if 1 wrong, if 0 correct
        perf_s=[perf_s;outcome];
        choice_s=[choice_s;act];          
        %update spatial weight
        if i>1

            altside=abs(side(i)-side(i-1)); %if 1 alt, if 0 ss
            
            if outcome==0 %correct
                if aw<1
                  aw=aw+delta1; %if correct alt trial, aw + delta1
%                   spw=spw-delta1;  %if correct spw - delta1     
                end     
%                 if altside==0&spw<1 
%                   spw=spw+delta1*cnoeffect;  %if correct & ss, spw + delta           
%                 end
              

                
            else
                if aw<1
                  aw=aw+delta2; %if wrong, aw + small delta     
                end 
%                 if altside==0 &spw>0
%                   spw=spw-delta1;  %if wrong & ss, spw - delta                       
%                 end                
            end
        end
 
%         %negative interaction/proportional
%         if aw>0&spw>0&spw<1;
%         aw=aw*(1-spw);
%         end
%         
%         if spw>0&aw>0&aw<1;
%         spw=spw*(1-aw);
%         end   
         
         awhist=[awhist;aw];
         spwhist=[spwhist;spw];        
        
    end




perf_s=~perf_s;
% figure;plot(cumsum(perf_s))
