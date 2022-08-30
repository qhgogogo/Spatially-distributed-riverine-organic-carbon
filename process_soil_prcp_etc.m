%load('soil_zonal.mat')

for i=1:length(clayzonal)
   [mm,nn] =find(FID_num==clayzonal(i,1)) ;
    HUC12_seq_clay(i,1) = HUC12_num(mm);
end

for i=1:length(sandzonal)
   [mm,nn] =find(FID_num==sandzonal(i,1)) ;
    HUC12_seq_sand(i,1) = HUC12_num(mm);
end

for i=1:length(siltzonal)
   [mm,nn] =find(FID_num==siltzonal(i,1)) ;
    HUC12_seq_silt(i,1) = HUC12_num(mm);
end

for i=1:length(siltzonal)
   [mm,nn] =find(FID_num==orgtop(i,1)) ;
    HUC12_seq_orgtop(i,1) = HUC12_num(mm);
end

for i=1:length(siltzonal)
   [mm,nn] =find(FID_num==orgsub(i,1)) ;
    HUC12_seq_orgsub(i,1) = HUC12_num(mm);
end


for i=1:length(siltzonal)
   [mm,nn] =find(FID_num==prcp(i,1)) ;
    HUC12_seq_prcp2(i,1) = HUC12_num(mm);
end

for i=1:length(siltzonal)
   [mm,nn] =find(FID_num==temperature(i,1)) ;
    HUC12_seq_temperature2(i,1) = HUC12_num(mm);
end



for i=1:length(toc_site_geo)

     toc_site_geo(i).clay2=[];
     toc_site_geo(i).silt2=[];
     toc_site_geo(i).sand2=[];
     toc_site_geo(i).orgtop=[];
     toc_site_geo(i).orgsub=[];
     toc_site_geo(i).prcp2=[];
     toc_site_geo(i).temperature2=[];
     
 end
%
 for i=1:length(doc_site_geo)
     doc_site_geo(i).clay2=[];
     doc_site_geo(i).silt2=[];
     doc_site_geo(i).sand2=[];
     doc_site_geo(i).orgtop=[];
     doc_site_geo(i).orgsub=[];
     doc_site_geo(i).prcp2=[];
     doc_site_geo(i).temperature2=[];
 end
%  
 for i=1:length(poc_site_geo)
     poc_site_geo(i).clay2=[];
     poc_site_geo(i).silt2=[];
     poc_site_geo(i).sand2=[];
     poc_site_geo(i).orgtop=[];
     poc_site_geo(i).orgsub=[];
     poc_site_geo(i).prcp2=[];
     poc_site_geo(i).temperature2=[];
 end
%
%  for i=1:length(inorganic_site_geo)
%      inorganic_site_geo(i).wetland=[];
%      inorganic_site_geo(i).crop=[];
%      inorganic_site_geo(i).forest=[];
%      inorganic_site_geo(i).grass=[];
%      inorganic_site_geo(i).city=[];
%      inorganic_site_geo(i).shrub=[];
%  end
% %
%  for i=1:length(tc_site_geo)
%      tc_site_geo(i).wetland=[];
%      tc_site_geo(i).crop=[];
%      tc_site_geo(i).forest=[];
%      tc_site_geo(i).grass=[];
%      tc_site_geo(i).city=[];
%      tc_site_geo(i).shrub=[];
%  end
%
  for i=1:length(biom_site_geo)
     biom_site_geo(i).clay2=[];
     biom_site_geo(i).silt2=[];
     biom_site_geo(i).sand2=[];
     biom_site_geo(i).prcp2=[];
     biom_site_geo(i).orgtop=[];
     biom_site_geo(i).orgsub=[];
     biom_site_geo(i).temperature2=[];
  end
  
  %toc
    for i=1:length(toc_site_geo)
       
       if(~isempty(toc_site_geo(i).NEEupHUC))
        % loc site in each HUC12
        [a,b]=find(HUC12_seq_clay==toc_site_geo(i).NEEupHUC);
        [a2,b2]=find(HUC12_seq_sand==toc_site_geo(i).NEEupHUC);
        [a3,b3]=find(HUC12_seq_silt==toc_site_geo(i).NEEupHUC);
        [a4,b4]=find(HUC12_seq_orgsub==toc_site_geo(i).NEEupHUC);
        [a5,b5]=find(HUC12_seq_orgtop==toc_site_geo(i).NEEupHUC);
        [a6,b6]=find(HUC12_seq_prcp2==toc_site_geo(i).NEEupHUC);
        [a7,b7]=find(HUC12_seq_temperature2==toc_site_geo(i).NEEupHUC);
        toc_site_geo(i).clay2= clayzonal(a,4);
        toc_site_geo(i).sand2= sandzonal(a2,4);
        toc_site_geo(i).silt2= siltzonal(a3,4);
        toc_site_geo(i).orgsub= orgsub(a4,4);
        toc_site_geo(i).orgtop= orgtop(a5,4);
        toc_site_geo(i).prcp2= prcp(a6,4);
        toc_site_geo(i).temperature2= temperature(a7,4);

       end
       if(~isempty(toc_site_geo(i).forest))  
            if(toc_site_geo(i).NEEarea==0)
                toc_site_geo(i).NEEarea=toc_site_geo(i).DrainageAr;
            end    
            toc_site_geo(i).clay2_mean= sum(toc_site_geo(i).clay2.*toc_site_geo(i).NEEarea(b)')/sum(toc_site_geo(i).NEEarea(b));
            toc_site_geo(i).sand2_mean= sum(toc_site_geo(i).sand2.*toc_site_geo(i).NEEarea(b2)')/sum(toc_site_geo(i).NEEarea(b2));
            toc_site_geo(i).silt2_mean= sum(toc_site_geo(i).silt2.*toc_site_geo(i).NEEarea(b3)')/sum(toc_site_geo(i).NEEarea(b3));
            toc_site_geo(i).orgsub_mean= sum(toc_site_geo(i).orgsub.*toc_site_geo(i).NEEarea(b4)')/sum(toc_site_geo(i).NEEarea(b4));
            toc_site_geo(i).orgtop_mean= sum(toc_site_geo(i).orgtop.*toc_site_geo(i).NEEarea(b5)')/sum(toc_site_geo(i).NEEarea(b5));
            toc_site_geo(i).prcp2_mean= sum(toc_site_geo(i).prcp2.*toc_site_geo(i).NEEarea(b6)')/sum(toc_site_geo(i).NEEarea(b6));
            toc_site_geo(i).temperature2_mean= sum(toc_site_geo(i).temperature2.*toc_site_geo(i).NEEarea(b7)')/sum(toc_site_geo(i).NEEarea(b7));
            temp = toc_site_geo(i).clay2_mean+toc_site_geo(i).sand2_mean+toc_site_geo(i).silt2_mean;
            if(temp>100)
               
               toc_site_geo(i).clay2_mean = toc_site_geo(i).clay2_mean- (temp-100)/temp*toc_site_geo(i).clay2_mean;
               toc_site_geo(i).sand2_mean = toc_site_geo(i).sand2_mean- (temp-100)/temp*toc_site_geo(i).sand2_mean;
               toc_site_geo(i).silt2_mean = toc_site_geo(i).silt2_mean- (temp-100)/temp*toc_site_geo(i).silt2_mean;

            elseif(temp<100)
               toc_site_geo(i).clay2_mean = toc_site_geo(i).clay2_mean- (temp-100)/3;
               toc_site_geo(i).sand2_mean = toc_site_geo(i).sand2_mean- (temp-100)/3;
               toc_site_geo(i).silt2_mean = toc_site_geo(i).silt2_mean- (temp-100)/3; 
            
            end
       end
    end  

 %doc
    for i=1:length(doc_site_geo)
       
       if(~isempty(doc_site_geo(i).NEEupHUC))
        % loc site in each HUC12
        [a,b]=find(HUC12_seq_clay==doc_site_geo(i).NEEupHUC);
        [a2,b2]=find(HUC12_seq_sand==doc_site_geo(i).NEEupHUC);
        [a3,b3]=find(HUC12_seq_silt==doc_site_geo(i).NEEupHUC);
        [a4,b4]=find(HUC12_seq_orgsub==doc_site_geo(i).NEEupHUC);
        [a5,b5]=find(HUC12_seq_orgtop==doc_site_geo(i).NEEupHUC);
        [a6,b6]=find(HUC12_seq_prcp2==doc_site_geo(i).NEEupHUC);
        [a7,b7]=find(HUC12_seq_temperature2==doc_site_geo(i).NEEupHUC);
        doc_site_geo(i).clay2= clayzonal(a,4);
        doc_site_geo(i).sand2= sandzonal(a2,4);
        doc_site_geo(i).silt2= siltzonal(a3,4);
        doc_site_geo(i).orgsub= orgsub(a4,4);
        doc_site_geo(i).orgtop= orgtop(a5,4);
        doc_site_geo(i).prcp2= prcp(a6,4);
        doc_site_geo(i).temperature2= temperature(a7,4);

       end
       if(~isempty(doc_site_geo(i).forest))  
            if(doc_site_geo(i).NEEarea==0)
                doc_site_geo(i).NEEarea=doc_site_geo(i).DrainageAr;
            end    
            doc_site_geo(i).clay2_mean= sum(doc_site_geo(i).clay2.*doc_site_geo(i).NEEarea(b)')/sum(doc_site_geo(i).NEEarea(b));
            doc_site_geo(i).sand2_mean= sum(doc_site_geo(i).sand2.*doc_site_geo(i).NEEarea(b2)')/sum(doc_site_geo(i).NEEarea(b2));
            doc_site_geo(i).silt2_mean= sum(doc_site_geo(i).silt2.*doc_site_geo(i).NEEarea(b3)')/sum(doc_site_geo(i).NEEarea(b3));
            doc_site_geo(i).orgsub_mean= sum(doc_site_geo(i).orgsub.*doc_site_geo(i).NEEarea(b4)')/sum(doc_site_geo(i).NEEarea(b4));
            doc_site_geo(i).orgtop_mean= sum(doc_site_geo(i).orgtop.*doc_site_geo(i).NEEarea(b5)')/sum(doc_site_geo(i).NEEarea(b5));
            doc_site_geo(i).prcp2_mean= sum(doc_site_geo(i).prcp2.*doc_site_geo(i).NEEarea(b6)')/sum(doc_site_geo(i).NEEarea(b6));
            doc_site_geo(i).temperature2_mean= sum(doc_site_geo(i).temperature2.*doc_site_geo(i).NEEarea(b7)')/sum(doc_site_geo(i).NEEarea(b7));
            temp = doc_site_geo(i).clay2_mean+doc_site_geo(i).sand2_mean+doc_site_geo(i).silt2_mean;
            if(temp>100)
               
               doc_site_geo(i).clay2_mean = doc_site_geo(i).clay2_mean- (temp-100)/temp*doc_site_geo(i).clay2_mean;
               doc_site_geo(i).sand2_mean = doc_site_geo(i).sand2_mean- (temp-100)/temp*doc_site_geo(i).sand2_mean;
               doc_site_geo(i).silt2_mean = doc_site_geo(i).silt2_mean- (temp-100)/temp*doc_site_geo(i).silt2_mean;

            elseif(temp<100)
               doc_site_geo(i).clay2_mean = doc_site_geo(i).clay2_mean- (temp-100)/3;
               doc_site_geo(i).sand2_mean = doc_site_geo(i).sand2_mean- (temp-100)/3;
               doc_site_geo(i).silt2_mean = doc_site_geo(i).silt2_mean- (temp-100)/3; 
            
            end
       end
    end  

    %poc
    for i=1:length(poc_site_geo)
       
       if(~isempty(poc_site_geo(i).NEEupHUC))
        % loc site in each HUC12
        [a,b]=find(HUC12_seq_clay==poc_site_geo(i).NEEupHUC);
        [a2,b2]=find(HUC12_seq_sand==poc_site_geo(i).NEEupHUC);
        [a3,b3]=find(HUC12_seq_silt==poc_site_geo(i).NEEupHUC);
        [a4,b4]=find(HUC12_seq_orgsub==poc_site_geo(i).NEEupHUC);
        [a5,b5]=find(HUC12_seq_orgtop==poc_site_geo(i).NEEupHUC);
        [a6,b6]=find(HUC12_seq_prcp2==poc_site_geo(i).NEEupHUC);
        [a7,b7]=find(HUC12_seq_temperature2==poc_site_geo(i).NEEupHUC);
        poc_site_geo(i).clay2= clayzonal(a,4);
        poc_site_geo(i).sand2= sandzonal(a2,4);
        poc_site_geo(i).silt2= siltzonal(a3,4);
        poc_site_geo(i).orgsub= orgsub(a4,4);
        poc_site_geo(i).orgtop= orgtop(a5,4);
        poc_site_geo(i).prcp2= prcp(a6,4);
        poc_site_geo(i).temperature2= temperature(a7,4);

       end
       if(~isempty(poc_site_geo(i).forest))  
            if(poc_site_geo(i).NEEarea==0)
                poc_site_geo(i).NEEarea=poc_site_geo(i).DrainageAr;
            end    
            poc_site_geo(i).clay2_mean= sum(poc_site_geo(i).clay2.*poc_site_geo(i).NEEarea(b)')/sum(poc_site_geo(i).NEEarea(b));
            poc_site_geo(i).sand2_mean= sum(poc_site_geo(i).sand2.*poc_site_geo(i).NEEarea(b2)')/sum(poc_site_geo(i).NEEarea(b2));
            poc_site_geo(i).silt2_mean= sum(poc_site_geo(i).silt2.*poc_site_geo(i).NEEarea(b3)')/sum(poc_site_geo(i).NEEarea(b3));
            poc_site_geo(i).orgsub_mean= sum(poc_site_geo(i).orgsub.*poc_site_geo(i).NEEarea(b4)')/sum(poc_site_geo(i).NEEarea(b4));
            poc_site_geo(i).orgtop_mean= sum(poc_site_geo(i).orgtop.*poc_site_geo(i).NEEarea(b5)')/sum(poc_site_geo(i).NEEarea(b5));
            poc_site_geo(i).prcp2_mean= sum(poc_site_geo(i).prcp2.*poc_site_geo(i).NEEarea(b6)')/sum(poc_site_geo(i).NEEarea(b6));
            poc_site_geo(i).temperature2_mean= sum(poc_site_geo(i).temperature2.*poc_site_geo(i).NEEarea(b7)')/sum(poc_site_geo(i).NEEarea(b7));
            temp = poc_site_geo(i).clay2_mean+poc_site_geo(i).sand2_mean+poc_site_geo(i).silt2_mean;
            if(temp>100)
               
               poc_site_geo(i).clay2_mean = poc_site_geo(i).clay2_mean- (temp-100)/temp*poc_site_geo(i).clay2_mean;
               poc_site_geo(i).sand2_mean = poc_site_geo(i).sand2_mean- (temp-100)/temp*poc_site_geo(i).sand2_mean;
               poc_site_geo(i).silt2_mean = poc_site_geo(i).silt2_mean- (temp-100)/temp*poc_site_geo(i).silt2_mean;

            elseif(temp<100)
               poc_site_geo(i).clay2_mean = poc_site_geo(i).clay2_mean- (temp-100)/3;
               poc_site_geo(i).sand2_mean = poc_site_geo(i).sand2_mean- (temp-100)/3;
               poc_site_geo(i).silt2_mean = poc_site_geo(i).silt2_mean- (temp-100)/3; 
            
            end
       end
    end  

    
    %biom
    for i=1:length(biom_site_geo)
       
       if(~isempty(biom_site_geo(i).NEEupHUC))
        % loc site in each HUC12
        [a,b]=find(HUC12_seq_clay==biom_site_geo(i).NEEupHUC);
        [a2,b2]=find(HUC12_seq_sand==biom_site_geo(i).NEEupHUC);
        [a3,b3]=find(HUC12_seq_silt==biom_site_geo(i).NEEupHUC);
        [a4,b4]=find(HUC12_seq_orgsub==biom_site_geo(i).NEEupHUC);
        [a5,b5]=find(HUC12_seq_orgtop==biom_site_geo(i).NEEupHUC);
        [a6,b6]=find(HUC12_seq_prcp2==biom_site_geo(i).NEEupHUC);
        [a7,b7]=find(HUC12_seq_temperature2==biom_site_geo(i).NEEupHUC);
        biom_site_geo(i).clay2= clayzonal(a,4);
        biom_site_geo(i).sand2= sandzonal(a2,4);
        biom_site_geo(i).silt2= siltzonal(a3,4);
        biom_site_geo(i).orgsub= orgsub(a4,4);
        biom_site_geo(i).orgtop= orgtop(a5,4);
        biom_site_geo(i).prcp2= prcp(a6,4);
        biom_site_geo(i).temperature2= temperature(a7,4);

       end
       if(~isempty(biom_site_geo(i).forest))  
            if(biom_site_geo(i).NEEarea==0)
                biom_site_geo(i).NEEarea=biom_site_geo(i).DrainageAr;
            end    
            biom_site_geo(i).clay2_mean= sum(biom_site_geo(i).clay2.*biom_site_geo(i).NEEarea(b)')/sum(biom_site_geo(i).NEEarea(b));
            biom_site_geo(i).sand2_mean= sum(biom_site_geo(i).sand2.*biom_site_geo(i).NEEarea(b2)')/sum(biom_site_geo(i).NEEarea(b2));
            biom_site_geo(i).silt2_mean= sum(biom_site_geo(i).silt2.*biom_site_geo(i).NEEarea(b3)')/sum(biom_site_geo(i).NEEarea(b3));
            biom_site_geo(i).orgsub_mean= sum(biom_site_geo(i).orgsub.*biom_site_geo(i).NEEarea(b4)')/sum(biom_site_geo(i).NEEarea(b4));
            biom_site_geo(i).orgtop_mean= sum(biom_site_geo(i).orgtop.*biom_site_geo(i).NEEarea(b5)')/sum(biom_site_geo(i).NEEarea(b5));
            biom_site_geo(i).prcp2_mean= sum(biom_site_geo(i).prcp2.*biom_site_geo(i).NEEarea(b6)')/sum(biom_site_geo(i).NEEarea(b6));
            biom_site_geo(i).temperature2_mean= sum(biom_site_geo(i).temperature2.*biom_site_geo(i).NEEarea(b7)')/sum(biom_site_geo(i).NEEarea(b7));
            temp = biom_site_geo(i).clay2_mean+biom_site_geo(i).sand2_mean+biom_site_geo(i).silt2_mean;
            if(temp>100)
               
               biom_site_geo(i).clay2_mean = biom_site_geo(i).clay2_mean- (temp-100)/temp*biom_site_geo(i).clay2_mean;
               biom_site_geo(i).sand2_mean = biom_site_geo(i).sand2_mean- (temp-100)/temp*biom_site_geo(i).sand2_mean;
               biom_site_geo(i).silt2_mean = biom_site_geo(i).silt2_mean- (temp-100)/temp*biom_site_geo(i).silt2_mean;

            elseif(temp<100)
               biom_site_geo(i).clay2_mean = biom_site_geo(i).clay2_mean- (temp-100)/3;
               biom_site_geo(i).sand2_mean = biom_site_geo(i).sand2_mean- (temp-100)/3;
               biom_site_geo(i).silt2_mean = biom_site_geo(i).silt2_mean- (temp-100)/3; 
            
            end
       end
    end 
    
%%
for i =1:length(toc_site_geo)
   if(isempty(toc_site_geo(i).prcp))
      toc_site_geo(i).prcp = toc_site_geo(i).prcp2_mean;
      toc_site_geo(i).temperature = toc_site_geo(i).temperature2_mean;
      toc_site_geo(i).clay = toc_site_geo(i).clay2_mean;
      toc_site_geo(i).silt = toc_site_geo(i).silt2_mean;
      toc_site_geo(i).sand = toc_site_geo(i).sand2_mean;
   end
end

for i =1:length(doc_site_geo)
   if(isempty(doc_site_geo(i).prcp))
      doc_site_geo(i).prcp = doc_site_geo(i).prcp2_mean;
      doc_site_geo(i).temperature = doc_site_geo(i).temperature2_mean;
      doc_site_geo(i).clay = doc_site_geo(i).clay2_mean;
      doc_site_geo(i).silt = doc_site_geo(i).silt2_mean;
      doc_site_geo(i).sand = doc_site_geo(i).sand2_mean;
   end
end

for i =1:length(poc_site_geo)
   if(isempty(poc_site_geo(i).prcp))
      poc_site_geo(i).prcp = poc_site_geo(i).prcp2_mean;
      poc_site_geo(i).temperature = poc_site_geo(i).temperature2_mean;
      poc_site_geo(i).clay = poc_site_geo(i).clay2_mean;
      poc_site_geo(i).silt = poc_site_geo(i).silt2_mean;
      poc_site_geo(i).sand = poc_site_geo(i).sand2_mean;
   end
end

for i =1:length(biom_site_geo)
   if(isempty(biom_site_geo(i).prcp))
      biom_site_geo(i).prcp = biom_site_geo(i).prcp2_mean;
      biom_site_geo(i).temperature = biom_site_geo(i).temperature2_mean;
      biom_site_geo(i).clay = biom_site_geo(i).clay2_mean;
      biom_site_geo(i).silt = biom_site_geo(i).silt2_mean;
      biom_site_geo(i).sand = biom_site_geo(i).sand2_mean;
   end
end
    
%% for excel use
n=0;
for i=1:length(toc_site_geo)
     if(~isempty(toc_site_geo(i).DrainageAr)&&~isempty(toc_site_geo(i).forest_mean)&& toc_site_geo(i).Mean_Load_>0&&toc_site_geo(i).HUCEightDi<19000000)
         n=n+1;
         toc_site_geo2(n).id  = toc_site_geo(i).Site_ID;
         toc_site_geo2(n).flux  = toc_site_geo(i).Mean_Load_;
         if (toc_site_geo(i).DrainageAr>0)
           toc_site_geo2(n).area  = toc_site_geo(i).DrainageAr*1.60934^2;
           toc_site_geo2(n).areaflag = 1; 
         elseif(toc_site_geo(i).DrainageAr==0&&toc_site_geo(i).accarea>0)
           toc_site_geo2(n).area  = toc_site_geo(i).accarea;    
           toc_site_geo2(n).areaflag = 0;    
         else
           toc_site_geo2(n).area  = -9999;    
           toc_site_geo2(n).areaflag = 0;  
         end
         toc_site_geo2(n).sto  = (toc_site_geo(i).res_stosum+toc_site_geo(i).upHUC2sto)/10^9; %km^3
         toc_site_geo2(n).forest  = toc_site_geo(i).forest_mean;
         toc_site_geo2(n).crop  = toc_site_geo(i).crop_mean;
         toc_site_geo2(n).wetland  = toc_site_geo(i).wetland_mean;
         toc_site_geo2(n).grass  = toc_site_geo(i).grass_mean;
         toc_site_geo2(n).city  = toc_site_geo(i).city_mean;
         toc_site_geo2(n).shrub = toc_site_geo(i).shrub_mean;
         
         toc_site_geo2(n).prcp  = toc_site_geo(i).prcp;
         toc_site_geo2(n).temperature  = toc_site_geo(i).temperature;
         toc_site_geo2(n).clay  = toc_site_geo(i).clay;
         toc_site_geo2(n).silt  = toc_site_geo(i).silt;
         toc_site_geo2(n).sand  = toc_site_geo(i).sand;
         toc_site_geo2(n).orgtop  = toc_site_geo(i).orgtop_mean;
         toc_site_geo2(n).orgsub  = toc_site_geo(i).orgsub_mean;
         toc_site_geo2(n).fluxperarea  = toc_site_geo2(n).flux/toc_site_geo2(n).area;
        % toc_site_geo2(n).damperarea  = toc_site_geo2(n).sto/toc_site_geo2(n).area;
     end
end

n=0;
for i=1:length(doc_site_geo)
     if(~isempty(doc_site_geo(i).DrainageAr)&&~isempty(doc_site_geo(i).forest_mean)&& doc_site_geo(i).Mean_Load_>0&&doc_site_geo(i).HUCEightDi<19000000)
         n=n+1;
         doc_site_geo2(n).id  = doc_site_geo(i).Site_ID;
         doc_site_geo2(n).flux  = doc_site_geo(i).Mean_Load_;
         if (doc_site_geo(i).DrainageAr>0)
           doc_site_geo2(n).area  = doc_site_geo(i).DrainageAr*1.60934^2;
           doc_site_geo2(n).areaflag = 1; 
         elseif(doc_site_geo(i).DrainageAr==0&&doc_site_geo(i).accarea>0)
           doc_site_geo2(n).area  = doc_site_geo(i).accarea;    
           doc_site_geo2(n).areaflag = 0;    
         else
           doc_site_geo2(n).area  = -9999;    
           doc_site_geo2(n).areaflag = 0;  
         end
         doc_site_geo2(n).sto  = (doc_site_geo(i).res_stosum+doc_site_geo(i).upHUC2sto)/10^9; %km^3
         doc_site_geo2(n).forest  = doc_site_geo(i).forest_mean;
         doc_site_geo2(n).crop  = doc_site_geo(i).crop_mean;
         doc_site_geo2(n).wetland  = doc_site_geo(i).wetland_mean;
         doc_site_geo2(n).grass  = doc_site_geo(i).grass_mean;
         doc_site_geo2(n).city  = doc_site_geo(i).city_mean;
         doc_site_geo2(n).shrub = doc_site_geo(i).shrub_mean;
         
         doc_site_geo2(n).prcp  = doc_site_geo(i).prcp;
         doc_site_geo2(n).temperature  = doc_site_geo(i).temperature;
         doc_site_geo2(n).clay  = doc_site_geo(i).clay;
         doc_site_geo2(n).silt  = doc_site_geo(i).silt;
         doc_site_geo2(n).sand  = doc_site_geo(i).sand;
         doc_site_geo2(n).orgtop  = doc_site_geo(i).orgtop_mean;
         doc_site_geo2(n).orgsub  = doc_site_geo(i).orgsub_mean;
         doc_site_geo2(n).fluxperarea  = doc_site_geo2(n).flux/doc_site_geo2(n).area;
        % doc_site_geo2(n).damperarea  = doc_site_geo2(n).sto/doc_site_geo2(n).area;
     end
end

n=0;
for i=1:length(poc_site_geo)
     if(~isempty(poc_site_geo(i).DrainageAr)&&~isempty(poc_site_geo(i).forest_mean)&& poc_site_geo(i).Mean_Load_>0&&poc_site_geo(i).HUCEightDi<19000000)
         n=n+1;
         poc_site_geo2(n).id  = poc_site_geo(i).Site_ID;
         poc_site_geo2(n).flux  = poc_site_geo(i).Mean_Load_;
         if (poc_site_geo(i).DrainageAr>0)
           poc_site_geo2(n).area  = poc_site_geo(i).DrainageAr*1.60934^2;
           poc_site_geo2(n).areaflag = 1; 
         elseif(poc_site_geo(i).DrainageAr==0&&poc_site_geo(i).accarea>0)
           poc_site_geo2(n).area  = poc_site_geo(i).accarea;    
           poc_site_geo2(n).areaflag = 0;    
         else
           poc_site_geo2(n).area  = -9999;    
           poc_site_geo2(n).areaflag = 0;  
         end
         poc_site_geo2(n).sto  = (poc_site_geo(i).res_stosum+poc_site_geo(i).upHUC2sto)/10^9; %km^3
         poc_site_geo2(n).forest  = poc_site_geo(i).forest_mean;
         poc_site_geo2(n).crop  = poc_site_geo(i).crop_mean;
         poc_site_geo2(n).wetland  = poc_site_geo(i).wetland_mean;
         poc_site_geo2(n).grass  = poc_site_geo(i).grass_mean;
         poc_site_geo2(n).city  = poc_site_geo(i).city_mean;
         poc_site_geo2(n).shrub = poc_site_geo(i).shrub_mean;
         
         poc_site_geo2(n).prcp  = poc_site_geo(i).prcp;
         poc_site_geo2(n).temperature  = poc_site_geo(i).temperature;
         poc_site_geo2(n).clay  = poc_site_geo(i).clay;
         poc_site_geo2(n).silt  = poc_site_geo(i).silt;
         poc_site_geo2(n).sand  = poc_site_geo(i).sand;
         poc_site_geo2(n).orgtop  = poc_site_geo(i).orgtop_mean;
         poc_site_geo2(n).orgsub  = poc_site_geo(i).orgsub_mean;
         poc_site_geo2(n).fluxperarea  = poc_site_geo2(n).flux/poc_site_geo2(n).area;
        % poc_site_geo2(n).damperarea  = poc_site_geo2(n).sto/poc_site_geo2(n).area;
     end
end

n=0;
for i=1:length(biom_site_geo)
     if(~isempty(biom_site_geo(i).DrainageAr)&&~isempty(biom_site_geo(i).forest_mean)&& biom_site_geo(i).Mean_Load_>0&&biom_site_geo(i).HUCEightDi<19000000)
         n=n+1;
         biom_site_geo2(n).id  = biom_site_geo(i).Site_ID;
         biom_site_geo2(n).flux  = biom_site_geo(i).Mean_Load_;
         if (biom_site_geo(i).DrainageAr>0)
           biom_site_geo2(n).area  = biom_site_geo(i).DrainageAr*1.60934^2;
           biom_site_geo2(n).areaflag = 1; 
         elseif(biom_site_geo(i).DrainageAr==0&&biom_site_geo(i).accarea>0)
           biom_site_geo2(n).area  = biom_site_geo(i).accarea;    
           biom_site_geo2(n).areaflag = 0;    
         else
           biom_site_geo2(n).area  = -9999;    
           biom_site_geo2(n).areaflag = 0;  
         end
         biom_site_geo2(n).sto  = (biom_site_geo(i).res_stosum+biom_site_geo(i).upHUC2sto)/10^9; %km^3
         biom_site_geo2(n).forest  = biom_site_geo(i).forest_mean;
         biom_site_geo2(n).crop  = biom_site_geo(i).crop_mean;
         biom_site_geo2(n).wetland  = biom_site_geo(i).wetland_mean;
         biom_site_geo2(n).grass  = biom_site_geo(i).grass_mean;
         biom_site_geo2(n).city  = biom_site_geo(i).city_mean;
         biom_site_geo2(n).shrub = biom_site_geo(i).shrub_mean;
         
         biom_site_geo2(n).prcp  = biom_site_geo(i).prcp;
         biom_site_geo2(n).temperature  = biom_site_geo(i).temperature;
         biom_site_geo2(n).clay  = biom_site_geo(i).clay;
         biom_site_geo2(n).silt  = biom_site_geo(i).silt;
         biom_site_geo2(n).sand  = biom_site_geo(i).sand;
         biom_site_geo2(n).orgtop  = biom_site_geo(i).orgtop_mean;
         biom_site_geo2(n).orgsub  = biom_site_geo(i).orgsub_mean;
         biom_site_geo2(n).fluxperarea  = biom_site_geo2(n).flux/biom_site_geo2(n).area;
         %biom_site_geo2(n).damperarea  = biom_site_geo2(n).sto/biom_site_geo2(n).area;
     end
end

