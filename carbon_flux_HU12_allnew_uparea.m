% %This script is to distribute the carbon flux/area to each HUC12 
% %classify the catchment first and start from HUC2s which don't have an upstream HUC2
load('site_output_final15.mat')

%% add a station flag to determine if included in calculating the flux area ratio
% for i=1:length(toc_site_geo3)
%    toc_site_geo3(i).staflag  =  toc_site_geo3(i).areaflag;
% end
% 
% for i=1:length(toc_site_geo3)
%     toc_site_geo3(i).staflag =  toc_site_geo3(i).areaflag;
% end
% 
% for i=1:length(toc_site_geo3)
%    toc_site_geo3(i).staflag =  toc_site_geo3(i).areaflag;
% end


for i=1:length(toc_site_geo3)
   toc_huc12(i) = toc_site_geo3(i).HUC12loc;
end

for i=1:length(doc_site_geo3)
   doc_huc12(i) =  doc_site_geo3(i).HUC12loc;
end

for i=1:length(poc_site_geo3)
   poc_huc12(i) =  poc_site_geo3(i).HUC12loc;
end

%  need to run trace_up_HUC12.m before running the rest script
% 

boundname = {'bound_shp1_12','bound_shp2_12','bound_shp3_12','bound_shp4_12','bound_shp5_12'...
             'bound_shp6_12','bound_shp7_12','bound_shp8_12','bound_shp9_12','bound_shp10_12'...
             'bound_shp11_12','bound_shp12_12','bound_shp13_12','bound_shp14_12','bound_shp15_12'...
             'bound_shp16_12','bound_shp17_12','bound_shp18_12'};
         
         
         

% toc_site_geo3(1719) HUC12loc located wrong location, the according toc,
% toc  as well: USGS-06889000, should be in 102701020903 not 102701020902
%toc_site_geo3(1719).HUC12loc= 102701020903; % done in trace_up_HUC12.m
% then rerun to update upHUC
 
for iii=4:18 % lower mississippi or lower colorado
    bound_num =trace_up_HUC12(iii);
    if(~isempty(bound_num))  %check area km
        for aaa=1:length(bound_num)
            if(bound_num(aaa).AreaSqKm==0)
                bound_num(aaa).AreaSqKm=bound_num(aaa).AreaAcres*0.00404686;
            end
        end
        downHUC12= [];
        HUC12 =[];
        HUC12_l1=[];
        
        if (iii==15)
            for k=1:length(bound_num)
                HUC_temp12 = str2double(bound_num(k).ToHUC);
                downHUC12 = [downHUC12,HUC_temp12];
                HUC12 =  [HUC12,str2double(bound_num(k).HUC12)];
                if(strcmp(bound_num(k).ToHUC,'OCEAN')||strcmp(bound_num(k).ToHUC,'MEXICO'))
                    HUC12_l1=[HUC12_l1,str2double(bound_num(k).HUC12)];
                end
            end
            HUC12_l1 = [HUC12_l1,150503030310]; %150503030310 is the downstream of 150503010507 which is not marked
        elseif (iii==1)
            for k=1:length(bound_num)
                HUC_temp12 = str2double(bound_num(k).ToHUC);
                downHUC12 = [downHUC12,HUC_temp12];
                HUC12 =  [HUC12,str2double(bound_num(k).HUC12)];
                
                if(floor(HUC_temp12/10^10)~=iii)
                    
                    HUC12_l1=[HUC12_l1,str2double(bound_num(k).HUC12)];
                    
                end
            end
             HUC12_l1 = [HUC12_l1,020302030000]; % Long island sound is a downstream end
        elseif (iii==8)
            for k=1:length(bound_num)
                HUC_temp12 = str2double(bound_num(k).ToHUC);
                downHUC12 = [downHUC12,HUC_temp12];
                HUC12 =  [HUC12,str2double(bound_num(k).HUC12)];
                
                if(strcmp(bound_num(k).ToHUC,'OCEAN'))
                    
                    HUC12_l1=[HUC12_l1,str2double(bound_num(k).HUC12)];
                    
                end
                
            end
            HUC12_l1 = [HUC12_l1,040400010603,031700091402];
        elseif (iii==18)
            for k=1:length(bound_num)
                HUC_temp12 = str2double(bound_num(k).ToHUC);
                downHUC12 = [downHUC12,HUC_temp12];
                HUC12 =  [HUC12,str2double(bound_num(k).HUC12)];
                
                if(strcmp(bound_num(k).ToHUC,'OCEAN')||strcmp(bound_num(k).ToHUC,'CLOSED BASIN'))
                    
                    HUC12_l1=[HUC12_l1,str2double(bound_num(k).HUC12)];
                    
                end
                
            end
        else
            for k=1:length(bound_num)
                HUC_temp12 = str2double(bound_num(k).ToHUC);
                downHUC12 = [downHUC12,HUC_temp12];
                HUC12 =  [HUC12,str2double(bound_num(k).HUC12)];
                
                if(floor(HUC_temp12/10^10)~=iii)
                    
                    HUC12_l1=[HUC12_l1,str2double(bound_num(k).HUC12)];
                    
                end
            end
        end
        %% ranking
        %count level
        rank_mark2={'01','02','03','04','05','06','07','08','09','10'...
            '11','12','13','14','15','16','17','18','19','20'...
            '21','22','23','24','25','26','27','28','29','30'...
            '31','32','33','34','35','36','37','38','39','40'...
            '41','42','43','44','45','46','47','48','49','50'...
            '51','52','53','54','55','56','57','58','59','60'...
            '61','62','63','64','65','66','67','68','69','70'...
            '71','72','73','74','75','76','77','78','79','80'...
            '81','82','83','84','85','86','87','88','89','90'...
            '91','92','93','94','95','96','97','98','99','a0'...
            'a1','a2','a3','a4','a5','a6','a7','a8','a9','b0'...
            'b1','b2','b3','b4','b5','b6','b7','b8','b9','c0'...
            'c1','c2','c3','c4','c5','c6','c7','c8','c9','d0'...
            'd1','d2','d3','d4','d5','d6','d7','d8','d9','e0'...
            'e1','e2','e3','e4','e5','e6','e7','e8','e9','f0'...
            'f1','f2','f3','f4','f5','f6','f7','f8','f9','g0'...
            'g1','g2','g3','g4','g5','g6','g7','g8','g9','h0'...
            'h1','h2','h3','h4','h5','h6','h7','h8','h9','i0'...
            'i1','i2','i3','i4','i5','i6','i7','i8','i9','j0'...
            'j1','j2','j3','j4','j5','j6','j7','j8','j9','k0'...
            'k1','k2','k3','k4','k5','k6','k7','k8','k9','l0'...
            'l1','l2','l3','l4','l5','l6','l7','l8','l9','m0'};
        rank_mark={'1','2','3','4','5','6','7','8','9','a','b','c','d','e','f', ...
            'g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w', ...
            'x','y','z','0','+','-','*','\','%','#','!','[',']',',','.','!','@','^'...
            '1','2','3','4','5','6','7','8','9','a','b','c','d','e','f', ...
            'g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w', ...
            'x','y','z','0','+','-','*','\','%','#','!','[',']',',','.','!','@','^'...
            '1','2','3','4','5','6','7','8','9','a','b','c','d','e','f', ...
            'g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w', ...
            'x','y','z','0','+','-','*','\','%','#','!','[',']',',','.','!','@','^'...
            '1','2','3','4','5','6','7','8','9','a','b','c','d','e','f', ...
            'g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w', ...
            'x','y','z','0','+','-','*','\','%','#','!','[',']',',','.','!','@','^'...
            '1','2','3','4','5','6','7','8','9','a','b','c','d','e','f', ...
            'g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w', ...
            'x','y','z','0','+','-','*','\','%','#','!','[',']',',','.','!','@','^'...
            '1','2','3','4','5','6','7','8','9','a','b','c','d','e','f', ...
            'g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w', ...
            'x','y','z','0','+','-','*','\','%','#','!','[',']',',','.','!','@','^'};
        
        %for i= 1:length(toc_site_geo3)
        %usgs 07022000  % locate the most downstrem sampling point for each HUC2;
        %if(str2double(toc_site_geo3(i).id(6:end))==7022000) %level 1 most downstream
        HUC7=[];
        n=2;
        loc1=[];
        loc1_lev=[];
        loc1_lev2=[];
        pp=0;
        
        if(length(HUC12_l1)>40)
            warning('level 1 has a larger size than symbols');
   
        end
        for jjj= 1:length(HUC12_l1)
            HUC7(1).rank{jjj} = rank_mark2(jjj);
            HUC7(1).HUC12loc(jjj) = HUC12_l1(jjj);
            [aa,bb] = find(toc_huc12 ==HUC12_l1(jjj));
            if(aa>0)
                HUC7(1).sampleflag(jjj) = 1;
                HUC7(1).flux(jjj) = toc_site_geo3(bb).flux;
                HUC7(1).area(jjj) = toc_site_geo3(bb).area;
            else
                HUC7(1).sampleflag(jjj) = 0;
                HUC7(1).flux(jjj) = 0;
                HUC7(1).area(jjj) = 0;
            end
            
            [isupexist,loc2] = find(downHUC12== HUC12_l1(jjj));
            loc1=[loc1,loc2];
            loc1_lev=[loc1_lev,repmat(jjj,1,length(loc2))];
            loc1_lev2=[loc1_lev2,1:length(loc2)];
            
            if(length(loc2)>25)
                warning('has more than 25 upstream HUC12')
            end
            if(~isempty(loc2))
                for tt=1:length(loc2)
                    pp=pp+1;
                    HUC7(n).rank{pp} = strcat(HUC7(n-1).rank{jjj},rank_mark(tt));
                    
                end
            end
        end
        for kk=1:length(loc1)
            HUC7(n).HUC12loc(kk) =  str2double(bound_num(loc1(kk)).HUC12);
            [aa,bb] = find(toc_huc12 == HUC7(n).HUC12loc(kk));
            if (aa>0)
                % could has multiple sites within the same HUC12
                % length(bb) >1
                if(length(bb)>1)
                    HUC7(n).sampleflag(kk) = 1;
                    [aax,bbx]=find([toc_site_geo3(bb).area]== max([toc_site_geo3(bb).area]));
                    HUC7(n).flux(kk) = toc_site_geo3(bb(bbx)).flux;
                    HUC7(n).area(kk) = toc_site_geo3(bb(bbx)).area;
                    if (toc_site_geo3(bb(bbx)).staflag==0)
                        HUC7(n).sampleflag(kk) = 0;
                        HUC7(n).flux(kk) = 0;
                        HUC7(n).area(kk) = 0;
                    end
                    if (toc_site_geo3(bb(bbx)).area<20)
                        HUC7(n).sampleflag(kk) = 0;
                        HUC7(n).flux(kk) = 0;
                        HUC7(n).area(kk) = 0;
                    end
%                     if (abs(toc_site_geo3(bb(bbx)).accarea-toc_site_geo3(bb(bbx)).area)>0.3*toc_site_geo3(bb(bbx)).area)
%                         HUC7(n).sampleflag(kk) = 0;
%                         HUC7(n).flux(kk) = 0;
%                         HUC7(n).area(kk) = 0;
%                     end
                    
                else
                    HUC7(n).sampleflag(kk) = 1;
                    HUC7(n).flux(kk) = toc_site_geo3(bb).flux;
                    HUC7(n).area(kk) = toc_site_geo3(bb).area;
                    if (toc_site_geo3(bb).staflag==0)
                        HUC7(n).sampleflag(kk) = 0;
                        HUC7(n).flux(kk) = 0;
                        HUC7(n).area(kk) = 0;
                    end
                    if (toc_site_geo3(bb).area<20)
                        HUC7(n).sampleflag(kk) = 0;
                        HUC7(n).flux(kk) = 0;
                        HUC7(n).area(kk) = 0;
                    end
                    if (abs(toc_site_geo3(bb).accarea-toc_site_geo3(bb).area)>0.3*toc_site_geo3(bb).area)
                        HUC7(n).sampleflag(kk) = 0;
                        HUC7(n).flux(kk) = 0;
                        HUC7(n).area(kk) = 0;
                    end
                    
                end
                
                
            else
                HUC7(n).sampleflag(kk) = 0;
                HUC7(n).flux(kk) = 0;
                HUC7(n).area(kk) = 0;
            end
        end
        loc=loc1;
        
        while(~isempty(loc))
            n=n+1;
            loc1=[];
            loc1_lev=[];
            loc1_lev2=[];
            pp=0;
            for nn = 1:length(loc)
                [isupexist,loc2] = find(downHUC12== str2double(bound_num(loc(nn)).HUC12));
                loc1=[loc1,loc2];
                loc1_lev=[loc1_lev,repmat(nn,1,length(loc2))];
                loc1_lev2=[loc1_lev2,1:length(loc2)];
                
                if(length(loc2)>40)
                    warning('has more than 40 upstream HUC12')
                end
                if(~isempty(loc2))
                    for tt=1:length(loc2)
                        pp=pp+1;
                        HUC7(n).rank{pp} = strcat(HUC7(n-1).rank{nn},rank_mark(tt));
                        
                    end
                end
            end
            for kk=1:length(loc1)
                HUC7(n).HUC12loc(kk) =  str2double(bound_num(loc1(kk)).HUC12);
                [aa,bb] = find(toc_huc12 == HUC7(n).HUC12loc(kk));
                if (aa>0)
                    % could has multiple sites within the same HUC12
                    % length(bb) >1
                    if(length(bb)>1)
                        HUC7(n).sampleflag(kk) = 1;
                        [aax,bbx]=find([toc_site_geo3(bb).area]== max([toc_site_geo3(bb).area]));
                        if(length(bbx)>1)
                            bbx=find([toc_site_geo3(bb).flux]== max([toc_site_geo3(bb).flux]));
                        end
                        HUC7(n).flux(kk) = toc_site_geo3(bb(bbx)).flux;
                        HUC7(n).area(kk) = toc_site_geo3(bb(bbx)).area;
                        if (toc_site_geo3(bb(bbx)).staflag==0)
                            HUC7(n).sampleflag(kk) = 0;
                            HUC7(n).flux(kk) = 0;
                            HUC7(n).area(kk) = 0;
                        end
                        if (toc_site_geo3(bb(bbx)).area<20)
                            HUC7(n).sampleflag(kk) = 0;
                            HUC7(n).flux(kk) = 0;
                            HUC7(n).area(kk) = 0;
                        end
%                         if (abs(toc_site_geo3(bb(bbx)).accarea-toc_site_geo3(bb(bbx)).area)>1.0*toc_site_geo3(bb(bbx)).area)
%                             HUC7(n).sampleflag(kk) = 0;
%                             HUC7(n).flux(kk) = 0;
%                             HUC7(n).area(kk) = 0;
%                         end
                        
                    else
                        HUC7(n).sampleflag(kk) = 1;
                        HUC7(n).flux(kk) = toc_site_geo3(bb).flux;
                        HUC7(n).area(kk) = toc_site_geo3(bb).area;
                        if (toc_site_geo3(bb).staflag==0)
                            HUC7(n).sampleflag(kk) = 0;
                            HUC7(n).flux(kk) = 0;
                            HUC7(n).area(kk) = 0;
                        end
                        if (toc_site_geo3(bb).area<20)
                            HUC7(n).sampleflag(kk) = 0;
                            HUC7(n).flux(kk) = 0;
                            HUC7(n).area(kk) = 0;
                        end
%                         if (abs(toc_site_geo3(bb).accarea-toc_site_geo3(bb).area)>1.0*toc_site_geo3(bb).area)
%                             HUC7(n).sampleflag(kk) = 0;
%                             HUC7(n).flux(kk) = 0;
%                             HUC7(n).area(kk) = 0;
%                         end
                        
                    end
                    
                    
                else
                    HUC7(n).sampleflag(kk) = 0;
                    HUC7(n).flux(kk) = 0;
                    HUC7(n).area(kk) = 0;
                end
                
            end
            loc=loc1;
        end
        
        
        %end
        
        
        %%
        % after ranking the subwatersheds, use the function:
        %(Flux_ds-Flux_us)/(Area_ds-Area_us) to calculate the flux/area ratio for each HUC12
        %find all the upstream HUC12 that have samplings which the total of them is Flux_us
        %also find the upstream area for each HUC12
        %initialize:
        area_all =[];
        loc_all =[];
        for ii=1:length(bound_num)
           area_all(ii) = bound_num(ii).AreaSqKm;
           loc_all(ii) = str2num(bound_num(ii).HUC12);
        end
        
        
        for ii =1:length(bound_num)
            bound_num(ii).uparea = [];
        end
        
        for ii =1:length(HUC7)
            HUC7(ii).uparea = [];
        end
        for ii=1:length(HUC7)
            jj=length(HUC7)-ii+1;
            for kk=1:length(HUC7(jj).HUC12loc)
                
                [aa,bb]=find(loc_all==HUC7(jj).HUC12loc(kk));
                if(~isempty(aa))
                    if (jj==length(HUC7))
                        bound_num(bb).uparea =   bound_num(bb).AreaSqKm;
                        HUC7(jj).uparea(kk) = bound_num(bb).AreaSqKm;
                    else
                       for tt=1:length(bb) 
                        bound_num(bb(tt)).uparea =  bound_num(bb(tt)).AreaSqKm;
                        HUC7(jj).uparea(kk) = bound_num(bb).AreaSqKm;
                       end
                        for pp = 1:length(HUC7(jj+1).HUC12loc)
                            if(strcmp(HUC7(jj).rank{kk}{1}(1:jj+1),HUC7(jj+1).rank{pp}{1}(1:jj+1)))
                                for tt=1:length(bb)
                                bound_num(bb(tt)).uparea =   bound_num(bb(tt)).uparea+HUC7(jj+1).uparea(pp);
                                HUC7(jj).uparea(kk) = HUC7(jj).uparea(kk)+ HUC7(jj+1).uparea(pp);
                                end
                            end
                        end
                    end
                end
            end
        end
        
        % for yield calculation
        for i=1:length(bound_num)
            bound_num(i).flux_ratio=[];
        end
        value_flag=1;
        for i=1:length(HUC7)
            HUC12_all=[];
            for j=1:length(HUC7(i).sampleflag)
                if(HUC7(i).sampleflag(j)>0)
                    [aa,bb] = find(HUC7(i).HUC12loc(j)==toc_huc12);
                    HUC12_all=toc_site_geo3(bb).upHUC;
                    if(HUC7(i).HUC12loc(j)==040301050606)
                        
                        4;
                    end

                    HUC12_up=[];
                    n=i;
                    us_rank={[]};
                    flux_rest=HUC7(i).flux(j);
                    if(flux_rest==283000000)
                        6;
                    end
                    flux_rank=HUC7(i).rank{j};
                    while(n<length(HUC7))
                        n=n+1;
                        
                        for k =1:length(HUC7(n).sampleflag)
                            %if(strcmp(HUC7(n).rank{k}(1:end-(n-i)),flux_rank)) % determine if under this branch
                            if (HUC7(n).sampleflag(k)>0) % find a new branch that has sampling
                                if(strcmp(HUC7(n).rank{k}{1}(1:end-(n-i)),flux_rank{1}))
                                    
                                    rank_flag=0;
                                    for rrr=1:n-1
                                        %aa0=strfind(us_rank,HUC7(n).rank{k}{1}(1:end-rrr));
                                        for ppp=1:length(us_rank)
                                            aa0=strcmp(us_rank{ppp},HUC7(n).rank{k}{1}(1:end-rrr));
                                            if (aa0>0) % included in any upstream that has sampling
                                                rank_flag=1;
                                            end
                                        end
                                    end
                                    
                                    if(rank_flag==0)
                                        
                                        if(HUC7(i).area(j)<HUC7(n).area(k))
                                            warning('upstream downstream reversed?')
                                            iii
                                           
                                        else
                                            
                                            
                                            flux_rest=flux_rest-HUC7(n).flux(k);
                                            
                                            
                                        end
                                        if(flux_rest<-10)
                                            
                                            
                                            i
                                            j
                                            n
                                            k
                                            
                                        end
                                        [aa1,bb1]=find(HUC7(n).HUC12loc(k)==toc_huc12);
                                        HUC12_up=[HUC12_up,toc_site_geo3(bb1).upHUC];
                                        [xxx,yyy]=find(HUC12_up==041900000200);
                                        if(~isempty(xxx))
                                            
                                           5; 
                                        end
                                        
                                        
                                        us_rank=[us_rank,HUC7(n).rank{k}{1}]; % record rank
                                    else
                                        us_rank=[us_rank,HUC7(n).rank{k}{1}];
                                        
                                    end
                                end
                            end
                        end
                    end
  
                    
                    HUC12_up_unique=unique(HUC12_up);
                    
                    HUC12_rest=setdiff(HUC12_all, HUC12_up_unique);
                    area_rest=0;
                    for zz=1:length(HUC12_rest)
                        [aa3,bb3] = find(HUC12_rest(zz)==HUC12);
                        for zzi=1:length(bb3)
                            area_rest = area_rest+bound_num(bb3(zzi)).AreaSqKm  ;
                            
                        end
                    end
                    flux_ratio = flux_rest/area_rest;
                    if(area_rest==0)
                        warning('area equals zero?')
                        iii
                        i
                        j
                        n
                        k
                    end

                    for zz=1:length(HUC12_rest)
                        [aa3,bb3] = find(HUC12_rest(zz)==HUC12);
                        for zz2=1:length(bb3)
                            bound_num(bb3(zz2)).flux_ratio=flux_ratio;
                            
                        end
                    end
                end
                
            end
        end
        n;
    end
    %% check no data HUC12
    n=0;
    flux_ratio_test=[];
    for i = 1:length(bound_num)
        if(~isempty(bound_num(i).flux_ratio))
            n=n+1;
        else
            bound_num(i).flux_ratio=-999999;
        end
%         if(str2num(bound_num(i).HUC12) ==041900000200)
%             
%               bound_num(i).flux_ratio=-999999;
%         end
        flux_ratio_test(i)=bound_num(i).flux_ratio;
        
        if(isempty(bound_num(i).uparea))
            
             bound_num(i).uparea=-999999;
            
        end
        
        
    end
    
    if(~isempty(bound_num))
    shapewrite(bound_num,['HUC_fluxratiotoc',num2str(iii),'.shp']);
    save(['HUC12_fluxtoc_',num2str(iii),'.mat'],'HUC7');
    end
    clear(boundname{iii});
    clear HUC7 bound_num
end


 bound1 = shaperead('HUC_fluxratiotoc1.shp');
 bound2 = shaperead('HUC_fluxratiotoc2.shp');
 bound3 = shaperead('HUC_fluxratiotoc3.shp');
 bound4 = shaperead('HUC_fluxratiotoc4.shp');
 bound8 = shaperead('HUC_fluxratiotoc8.shp');
 bound9 = shaperead('HUC_fluxratiotoc9.shp');
 bound12 = shaperead('HUC_fluxratiotoc12.shp');
 bound13 = shaperead('HUC_fluxratiotoc13.shp');
 bound15 = shaperead('HUC_fluxratiotoc15.shp');
 bound16 = shaperead('HUC_fluxratiotoc16.shp');
 bound17 = shaperead('HUC_fluxratiotoc17.shp');
 bound18 = shaperead('HUC_fluxratiotoc18.shp');
 
     
 bound_all=[bound1;bound2;bound3;bound4;bound9;bound12;bound13;bound15;...
     bound16;bound17;bound18];
 clear bound1 bound2 bound3 bound4 bound9 bound12 bound13 bound15 bound16 bound17 bound18
 for i=1:length(bound_all)
     bound_all2(i,1).Geometry=bound_all(i).Geometry;
     bound_all2(i,1).BoundingBox=bound_all(i).BoundingBox;
     bound_all2(i,1).X=bound_all(i).X;
     bound_all2(i,1).Y=bound_all(i).Y;
     bound_all2(i,1).flux_ratio=bound_all(i).flux_ratio;
     bound_all2(i,1).uparea=bound_all(i).uparea;
 end
 for i=1:length(bound8)
     bound8_2(i,1).Geometry=bound8(i).Geometry;
     bound8_2(i,1).BoundingBox=bound8(i).BoundingBox;
     bound8_2(i,1).X=bound8(i).X;
     bound8_2(i,1).Y=bound8(i).Y;
     bound8_2(i,1).flux_ratio=bound8(i).flux_ratio;
     bound8_2(i,1).uparea=bound8(i).uparea;
 end
 bound_all3=[bound_all2;bound8_2];
 shapewrite(bound_all3,'national_all');


