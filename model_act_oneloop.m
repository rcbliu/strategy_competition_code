function [perf_s awhist spwhist choice_s]=model_act_oneloop(delta1,delta2,aw,spw,side);
% thre=1;
     delta1=delta1/10e7;
     delta2=delta2/10e7;
     spw=spw/10e7;
    
 
    
   rng("default")
%   rng(2,"threefry")

  
  perf_s=[]; 
  choice_s=[];
  awhist=aw;
  spwhist=spw;
  for i=1:length(side);
%         make an action



%         noise=randn/40; %scale between -0.1 and 0.1
%         if aw+noise>spw;    
%             act=side(i);
%         else
%             if i>1
%                 act=side(i-1);
%             else
%                 act=randi([0, 1]);
%             end
%         end
        
        if aw>spw;    
            act=side(i);
        else
            if i>1
                act=side(i-1);
            else
                act=randi([0, 1]);
            end
        end
        
%         p=aw/(aw+spw);
%         awspw=binornd(1,p);        
%         if awspw==1;
%             act=side(i);
%         else
%             if i>1
%                 act=side(i-1);
%             else
%                 act=randi([0, 1]);
%             end
%         end

        outcome=abs(act-side(i)) ;%if 1 wrong, if 0 correct
        perf_s=[perf_s;outcome];
        choice_s=[choice_s;act];          
        %update spatial weight
        if i>1

            altside=abs(side(i)-side(i-1)); %if 1 alt, if 0 ss
            
            if outcome==0 %correct
                if aw<1
                  aw=aw+delta1; %if correct, aw + delta
                end     
%                 if altside==0&spw<1 
%                   spw=spw+delta1;  %if correct & ss, spw + delta           
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

%          %negative interaction/additive
%          if i>1
%              dt_aw=aw-awhist(i-1);
%              dt_spw=spw-spwhist(i-1); 
%              
%              if aw>0
%              aw=aw-dt_spw;
%              end
%              if spw>0
%              spw=spw-dt_aw; 
%              end
%          end
         
         awhist=[awhist;aw];
         spwhist=[spwhist;spw];        
        
    end




perf_s=~perf_s;
% figure;plot(cumsum(perf_s))

