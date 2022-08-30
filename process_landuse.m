
%%load('F:\ForQiuHan_xuesong\scripts\site_output_NEE_reser.mat');
% % 
% % for i=1:length(city)
% %    [mm,nn] =find(FID_num==city(i,1)) ;
% %     HUC12_sequence(i,1) = HUC12_num(mm);
% % end
 load('landuse_inHUC12.mat');
crop1=crop(:,4);
forest1=forest(:,4);
wetland1=wetland(:,4);
grass1=grass(:,4);
shrub1=shrub(:,4);
city1=city(:,4);


 for i=1:length(toc_site_geo)

     toc_site_geo(i).wetland=[];
     toc_site_geo(i).crop=[];
     toc_site_geo(i).forest=[];
     toc_site_geo(i).grass=[];
     toc_site_geo(i).city=[];
     toc_site_geo(i).shrub=[];
 end
%
 for i=1:length(doc_site_geo)
     doc_site_geo(i).wetland=[];
     doc_site_geo(i).crop=[];
     doc_site_geo(i).forest=[];
     doc_site_geo(i).grass=[];
     doc_site_geo(i).city=[];
     doc_site_geo(i).shrub=[];
 end
%  
 for i=1:length(poc_site_geo)
     poc_site_geo(i).wetland=[];
     poc_site_geo(i).crop=[];
     poc_site_geo(i).forest=[];
     poc_site_geo(i).grass=[];
     poc_site_geo(i).city=[];
     poc_site_geo(i).shrub=[];
 end
%
 for i=1:length(inorganic_site_geo)
     inorganic_site_geo(i).wetland=[];
     inorganic_site_geo(i).crop=[];
     inorganic_site_geo(i).forest=[];
     inorganic_site_geo(i).grass=[];
     inorganic_site_geo(i).city=[];
     inorganic_site_geo(i).shrub=[];
 end
%
 for i=1:length(tc_site_geo)
     tc_site_geo(i).wetland=[];
     tc_site_geo(i).crop=[];
     tc_site_geo(i).forest=[];
     tc_site_geo(i).grass=[];
     tc_site_geo(i).city=[];
     tc_site_geo(i).shrub=[];
 end
%
  for i=1:length(biom_site_geo)
     biom_site_geo(i).wetland=[];
     biom_site_geo(i).crop=[];
     biom_site_geo(i).forest=[];
     biom_site_geo(i).grass=[];
     biom_site_geo(i).city=[];
     biom_site_geo(i).shrub=[];
  end




% %%locate upstream land use portion

   %toc
    for i=1:length(toc_site_geo)
       
       if(~isempty(toc_site_geo(i).NEEupHUC))
        % loc site in each HUC12
        [a,b]=find(HUC12_sequence==toc_site_geo(i).NEEupHUC);
        toc_site_geo(i).forest= forest1(a);
        toc_site_geo(i).crop= crop1(a);
        toc_site_geo(i).wetland= wetland1(a);
        toc_site_geo(i).grass= grass1(a);
        toc_site_geo(i).city= city1(a);
        toc_site_geo(i).shrub= shrub1(a);
       else
           if(~isempty(toc_site_geo(i).HUC12loc))
            [a,b]=find(HUC12_sequence==toc_site_geo(i).HUC12loc);
            toc_site_geo(i).forest= forest1(a);
            toc_site_geo(i).crop= crop1(a);
            toc_site_geo(i).wetland= wetland1(a);
            toc_site_geo(i).grass= grass1(a);
            toc_site_geo(i).city= city1(a);
            toc_site_geo(i).shrub= shrub1(a);
           end
       end
       if(~isempty(toc_site_geo(i).forest))  
            if(toc_site_geo(i).NEEarea==0)
                toc_site_geo(i).NEEarea=toc_site_geo(i).DrainageAr;
            end    
            toc_site_geo(i).forest_mean= sum(toc_site_geo(i).forest.*toc_site_geo(i).NEEarea(b)')/sum(toc_site_geo(i).NEEarea(b));
            toc_site_geo(i).crop_mean= sum(toc_site_geo(i).crop.*toc_site_geo(i).NEEarea(b)')/sum(toc_site_geo(i).NEEarea(b));
            toc_site_geo(i).wetland_mean= sum(toc_site_geo(i).wetland.*toc_site_geo(i).NEEarea(b)')/sum(toc_site_geo(i).NEEarea(b));
            toc_site_geo(i).grass_mean= sum(toc_site_geo(i).grass.*toc_site_geo(i).NEEarea(b)')/sum(toc_site_geo(i).NEEarea(b));
            toc_site_geo(i).city_mean= sum(toc_site_geo(i).city.*toc_site_geo(i).NEEarea(b)')/sum(toc_site_geo(i).NEEarea(b));
            toc_site_geo(i).shrub_mean= sum(toc_site_geo(i).shrub.*toc_site_geo(i).NEEarea(b)')/sum(toc_site_geo(i).NEEarea(b));
       end
    end  
    
  %%doc
    
  for i=1:length(doc_site_geo)
       
       if(~isempty(doc_site_geo(i).NEEupHUC))
        % loc site in each HUC12
        [a,b]=find(HUC12_sequence==doc_site_geo(i).NEEupHUC);
        doc_site_geo(i).forest= forest1(a);
        doc_site_geo(i).crop= crop1(a);
        doc_site_geo(i).wetland= wetland1(a);
        doc_site_geo(i).grass= grass1(a);
        doc_site_geo(i).city= city1(a);
        doc_site_geo(i).shrub= shrub1(a);
       else
           if(~isempty(doc_site_geo(i).HUC12loc))
            [a,b]=find(HUC12_sequence==doc_site_geo(i).HUC12loc);
            doc_site_geo(i).forest= forest1(a);
            doc_site_geo(i).crop= crop1(a);
            doc_site_geo(i).wetland= wetland1(a);
            doc_site_geo(i).grass= grass1(a);
            doc_site_geo(i).city= city1(a);
            doc_site_geo(i).shrub= shrub1(a);
           end
       end
       if(~isempty(doc_site_geo(i).forest))  
            if(doc_site_geo(i).NEEarea==0)
                doc_site_geo(i).NEEarea=doc_site_geo(i).DrainageAr;
            end 
           doc_site_geo(i).forest_mean= sum(doc_site_geo(i).forest.*doc_site_geo(i).NEEarea(b)')/sum(doc_site_geo(i).NEEarea(b));
            doc_site_geo(i).crop_mean= sum(doc_site_geo(i).crop.*doc_site_geo(i).NEEarea(b)')/sum(doc_site_geo(i).NEEarea(b));
            doc_site_geo(i).wetland_mean= sum(doc_site_geo(i).wetland.*doc_site_geo(i).NEEarea(b)')/sum(doc_site_geo(i).NEEarea(b));
            doc_site_geo(i).grass_mean= sum(doc_site_geo(i).grass.*doc_site_geo(i).NEEarea(b)')/sum(doc_site_geo(i).NEEarea(b));
            doc_site_geo(i).city_mean= sum(doc_site_geo(i).city.*doc_site_geo(i).NEEarea(b)')/sum(doc_site_geo(i).NEEarea(b));
            doc_site_geo(i).shrub_mean= sum(doc_site_geo(i).shrub.*doc_site_geo(i).NEEarea(b)')/sum(doc_site_geo(i).NEEarea(b));
   
       end
  end
    
   %poc
    for i=1:length(poc_site_geo)
       
       if(~isempty(poc_site_geo(i).NEEupHUC))
        % loc site in each HUC12
        [a,b]=find(HUC12_sequence==poc_site_geo(i).NEEupHUC);
        poc_site_geo(i).forest= forest1(a);
        poc_site_geo(i).crop= crop1(a);
        poc_site_geo(i).wetland= wetland1(a);
        poc_site_geo(i).grass= grass1(a);
        poc_site_geo(i).city= city1(a);
        poc_site_geo(i).shrub= shrub1(a);
       else
           if(~isempty(poc_site_geo(i).HUC12loc))
            [a,b]=find(HUC12_sequence==poc_site_geo(i).HUC12loc);
            poc_site_geo(i).forest= forest1(a);
            poc_site_geo(i).crop= crop1(a);
            poc_site_geo(i).wetland= wetland1(a);
            poc_site_geo(i).grass= grass1(a);
            poc_site_geo(i).city= city1(a);
            poc_site_geo(i).shrub= shrub1(a);
           end
       end
       if(~isempty(poc_site_geo(i).forest))  
             if(poc_site_geo(i).NEEarea==0)
                poc_site_geo(i).NEEarea=poc_site_geo(i).DrainageAr;
            end 
            poc_site_geo(i).forest_mean= sum(poc_site_geo(i).forest.*poc_site_geo(i).NEEarea(b)')/sum(poc_site_geo(i).NEEarea(b));
            poc_site_geo(i).crop_mean= sum(poc_site_geo(i).crop.*poc_site_geo(i).NEEarea(b)')/sum(poc_site_geo(i).NEEarea(b));
            poc_site_geo(i).wetland_mean= sum(poc_site_geo(i).wetland.*poc_site_geo(i).NEEarea(b)')/sum(poc_site_geo(i).NEEarea(b));
            poc_site_geo(i).grass_mean= sum(poc_site_geo(i).grass.*poc_site_geo(i).NEEarea(b)')/sum(poc_site_geo(i).NEEarea(b));
            poc_site_geo(i).city_mean= sum(poc_site_geo(i).city.*poc_site_geo(i).NEEarea(b)')/sum(poc_site_geo(i).NEEarea(b));
            poc_site_geo(i).shrub_mean= sum(poc_site_geo(i).shrub.*poc_site_geo(i).NEEarea(b)')/sum(poc_site_geo(i).NEEarea(b));
       end
   end   
    
    %biomass
    for i=1:length(biom_site_geo)
       
       if(~isempty(biom_site_geo(i).NEEupHUC))
        % loc site in each HUC12
        [a,b]=find(HUC12_sequence==biom_site_geo(i).NEEupHUC);
        biom_site_geo(i).forest= forest1(a);
        biom_site_geo(i).crop= crop1(a);
        biom_site_geo(i).wetland= wetland1(a);
        biom_site_geo(i).grass= grass1(a);
        biom_site_geo(i).city= city1(a);
        biom_site_geo(i).shrub= shrub1(a);
       else
           if(~isempty(biom_site_geo(i).HUC12loc))
            [a,b]=find(HUC12_sequence==biom_site_geo(i).HUC12loc);
            biom_site_geo(i).forest= forest1(a);
            biom_site_geo(i).crop= crop1(a);
            biom_site_geo(i).wetland= wetland1(a);
            biom_site_geo(i).grass= grass1(a);
            biom_site_geo(i).city= city1(a);
            biom_site_geo(i).shrub= shrub1(a);
           end
       end
       if(~isempty(biom_site_geo(i).forest))
             if(biom_site_geo(i).NEEarea==0)
                biom_site_geo(i).NEEarea=biom_site_geo(i).DrainageAr;
            end 
            biom_site_geo(i).forest_mean= sum(biom_site_geo(i).forest.*biom_site_geo(i).NEEarea(b)')/sum(biom_site_geo(i).NEEarea(b));
            biom_site_geo(i).crop_mean= sum(biom_site_geo(i).crop.*biom_site_geo(i).NEEarea(b)')/sum(biom_site_geo(i).NEEarea(b));
            biom_site_geo(i).wetland_mean= sum(biom_site_geo(i).wetland.*biom_site_geo(i).NEEarea(b)')/sum(biom_site_geo(i).NEEarea(b));
            biom_site_geo(i).grass_mean= sum(biom_site_geo(i).grass.*biom_site_geo(i).NEEarea(b)')/sum(biom_site_geo(i).NEEarea(b));
            biom_site_geo(i).city_mean= sum(biom_site_geo(i).city.*biom_site_geo(i).NEEarea(b)')/sum(biom_site_geo(i).NEEarea(b));
            biom_site_geo(i).shrub_mean= sum(biom_site_geo(i).shrub.*biom_site_geo(i).NEEarea(b)')/sum(biom_site_geo(i).NEEarea(b));
       end
    end
    
    %tc
    for i=1:length(tc_site_geo)
       
       if(~isempty(tc_site_geo(i).NEEupHUC))
        % loc site in each HUC12
        [a,b]=find(HUC12_sequence==tc_site_geo(i).NEEupHUC);
        tc_site_geo(i).forest= forest1(a);
        tc_site_geo(i).crop= crop1(a);
        tc_site_geo(i).wetland= wetland1(a);
        tc_site_geo(i).grass= grass1(a);
        tc_site_geo(i).city= city1(a);
        tc_site_geo(i).shrub= shrub1(a);
       else
           if(~isempty(tc_site_geo(i).HUC12loc))
            [a,b]=find(HUC12_sequence==tc_site_geo(i).HUC12loc);
            tc_site_geo(i).forest= forest1(a);
            tc_site_geo(i).crop= crop1(a);
            tc_site_geo(i).wetland= wetland1(a);
            tc_site_geo(i).grass= grass1(a);
            tc_site_geo(i).city= city1(a);
            tc_site_geo(i).shrub= shrub1(a);
           end
       end
       if(~isempty(tc_site_geo(i).forest))
             if(tc_site_geo(i).NEEarea==0)
                tc_site_geo(i).NEEarea=tc_site_geo(i).DrainageAr;
            end 
            tc_site_geo(i).forest_mean= sum(tc_site_geo(i).forest.*tc_site_geo(i).NEEarea(b)')/sum(tc_site_geo(i).NEEarea(b));
            tc_site_geo(i).crop_mean= sum(tc_site_geo(i).crop.*tc_site_geo(i).NEEarea(b)')/sum(tc_site_geo(i).NEEarea(b));
            tc_site_geo(i).wetland_mean= sum(tc_site_geo(i).wetland.*tc_site_geo(i).NEEarea(b)')/sum(tc_site_geo(i).NEEarea(b));
            tc_site_geo(i).grass_mean= sum(tc_site_geo(i).grass.*tc_site_geo(i).NEEarea(b)')/sum(tc_site_geo(i).NEEarea(b));
            tc_site_geo(i).city_mean= sum(tc_site_geo(i).city.*tc_site_geo(i).NEEarea(b)')/sum(tc_site_geo(i).NEEarea(b));
            tc_site_geo(i).shrub_mean= sum(tc_site_geo(i).shrub.*tc_site_geo(i).NEEarea(b)')/sum(tc_site_geo(i).NEEarea(b));
   
       end
    end
    %inorganic
    for i=1:length(inorganic_site_geo)
       
       if(~isempty(inorganic_site_geo(i).NEEupHUC))
        % loc site in each HUC12
        [a,b]=find(HUC12_sequence==inorganic_site_geo(i).NEEupHUC);
        inorganic_site_geo(i).forest= forest1(a);
        inorganic_site_geo(i).crop= crop1(a);
        inorganic_site_geo(i).wetland= wetland1(a);
        inorganic_site_geo(i).grass= grass1(a);
        inorganic_site_geo(i).city= city1(a);
        inorganic_site_geo(i).shrub= shrub1(a);
       else
           if(~isempty(inorganic_site_geo(i).HUC12loc))
            [a,b]=find(HUC12_sequence==inorganic_site_geo(i).HUC12loc);
            inorganic_site_geo(i).forest= forest1(a);
            inorganic_site_geo(i).crop= crop1(a);
            inorganic_site_geo(i).wetland= wetland1(a);
            inorganic_site_geo(i).grass= grass1(a);
            inorganic_site_geo(i).city= city1(a);
            inorganic_site_geo(i).shrub= shrub1(a);
           end
       end
       if(~isempty(inorganic_site_geo(i).forest))  
            inorganic_site_geo(i).forest_mean= sum(inorganic_site_geo(i).forest.*inorganic_site_geo(i).NEEarea(b)')/sum(inorganic_site_geo(i).NEEarea(b));
            inorganic_site_geo(i).crop_mean= sum(inorganic_site_geo(i).crop.*inorganic_site_geo(i).NEEarea(b)')/sum(inorganic_site_geo(i).NEEarea(b));
            inorganic_site_geo(i).wetland_mean= sum(inorganic_site_geo(i).wetland.*inorganic_site_geo(i).NEEarea(b)')/sum(inorganic_site_geo(i).NEEarea(b));
            inorganic_site_geo(i).grass_mean= sum(inorganic_site_geo(i).grass.*inorganic_site_geo(i).NEEarea(b)')/sum(inorganic_site_geo(i).NEEarea(b));
            inorganic_site_geo(i).city_mean= sum(inorganic_site_geo(i).city.*inorganic_site_geo(i).NEEarea(b)')/sum(inorganic_site_geo(i).NEEarea(b));
            inorganic_site_geo(i).shrub_mean= sum(inorganic_site_geo(i).shrub.*inorganic_site_geo(i).NEEarea(b)')/sum(inorganic_site_geo(i).NEEarea(b));
       end
    end

 