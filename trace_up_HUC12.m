function bound=trace_up_HUC12(kkk)
   load('site_output_final15.mat')
%% add HUC12loc
% for i=1:length(toc_site_geo3)
%     for j = 1:length(toc_site_geo)
%         if(strcmp(toc_site_geo3(i).id, toc_site_geo(j).Site_ID))
%          toc_site_geo3(i).Huccode = floor(toc_site_geo(j).HUCEightDi/1000000);
%          toc_site_geo3(i).HUC12loc= toc_site_geo(j).HUC12loc; % sampling point HUC12
%          toc_site_geo3(i).upHUC= toc_site_geo(j).NEEupHUC;
%          toc_huc12(i) =  toc_site_geo(j).HUC12loc;
%          toc_site_geo3(i).HUCEightDi =toc_site_geo(j).HUCEightDi;
%          toc_site_geo3(i).Latitude =toc_site_geo(j).LatitudeMe;
%          toc_site_geo3(i).Longitude =toc_site_geo(j).LongitudeM;
%
%         end
%
%     end
%
% end
% for i=1:length(toc_site_geo3)
%     for j = 1:length(poc_site_geo)
%         if(strcmp(toc_site_geo3(i).id, poc_site_geo(j).Site_ID))
%          toc_site_geo3(i).Huccode = floor(poc_site_geo(j).HUCEightDi/1000000);
%          % sampling point HUC12
%
%          if(~isempty(poc_site_geo(j).HUC12loc))
%             toc_site_geo3(i).HUC12loc= poc_site_geo(j).HUC12loc;
%             toc_huc12(i) =  poc_site_geo(j).HUC12loc;
%          end
%          toc_site_geo3(i).HUCEightDi =poc_site_geo(j).HUCEightDi;
%          toc_site_geo3(i).Latitude =poc_site_geo(j).LatitudeMe;
%          toc_site_geo3(i).Longitude =poc_site_geo(j).LongitudeM;
%
%         end
%     end
%     toc_site_geo3(i).upHUC= [];
%     toc_site_geo3(i).accarea =[];
% end
%
% for i=1:length(doc_site_geo3)
%     for j = 1:length(doc_site_geo)
%         if(strcmp(doc_site_geo3(i).id, doc_site_geo(j).Site_ID))
%          doc_site_geo3(i).Huccode = floor(doc_site_geo(j).HUCEightDi/1000000);
%          doc_site_geo3(i).HUC12loc= doc_site_geo(j).HUC12loc; % sampling point HUC12
%          doc_site_geo3(i).upHUC= doc_site_geo(j).NEEupHUC;
%          doc_huc12(i) =  doc_site_geo(j).HUC12loc;
%          doc_site_geo3(i).HUCEightDi =doc_site_geo(j).HUCEightDi;
%          doc_site_geo3(i).Latitude =doc_site_geo(j).LatitudeMe;
%          doc_site_geo3(i).Longitude =doc_site_geo(j).LongitudeM;
%
%         end
%
%     end
%
% end
% for i=1:length(doc_site_geo3)
%     for j = 1:length(toc_site_geo)
%         if(strcmp(doc_site_geo3(i).id, toc_site_geo(j).Site_ID))
%          doc_site_geo3(i).Huccode = floor(toc_site_geo(j).HUCEightDi/1000000);
%
%
%          if(~isempty(toc_site_geo(j).HUC12loc))
%             doc_site_geo3(i).HUC12loc= toc_site_geo(j).HUC12loc; % sampling point HUC12
%             doc_huc12(i) =  toc_site_geo(j).HUC12loc;
%          end
%          doc_site_geo3(i).HUCEightDi =toc_site_geo(j).HUCEightDi;
%          doc_site_geo3(i).Latitude =toc_site_geo(j).LatitudeMe;
%          doc_site_geo3(i).Longitude =toc_site_geo(j).LongitudeM;
%
%         end
%     end
%     doc_site_geo3(i).upHUC= [];
%     doc_site_geo3(i).accarea =[];
% end
%
% for i=1:length(poc_site_geo3)
%     for j = 1:length(poc_site_geo)
%         if(strcmp(poc_site_geo3(i).id, poc_site_geo(j).Site_ID))
%          poc_site_geo3(i).Huccode = floor(poc_site_geo(j).HUCEightDi/1000000);
%          poc_site_geo3(i).HUC12loc= poc_site_geo(j).HUC12loc; % sampling point HUC12
%          poc_site_geo3(i).upHUC= poc_site_geo(j).NEEupHUC;
%          poc_huc12(i) =  poc_site_geo(j).HUC12loc;
%          poc_site_geo3(i).HUCEightDi =poc_site_geo(j).HUCEightDi;
%          poc_site_geo3(i).Latitude =poc_site_geo(j).LatitudeMe;
%          poc_site_geo3(i).Longitude =poc_site_geo(j).LongitudeM;
%
%         end
%
%     end
%
% end
% for i=1:length(poc_site_geo3)
%     for j = 1:length(toc_site_geo)
%         if(strcmp(poc_site_geo3(i).id, toc_site_geo(j).Site_ID))
%          poc_site_geo3(i).Huccode = floor(toc_site_geo(j).HUCEightDi/1000000);
%          % sampling point HUC12
%
%          if(~isempty(toc_site_geo(j).HUC12loc))
%             poc_site_geo3(i).HUC12loc= toc_site_geo(j).HUC12loc;
%             poc_huc12(i) =  toc_site_geo(j).HUC12loc;
%          end
%          poc_site_geo3(i).HUCEightDi =toc_site_geo(j).HUCEightDi;
%          poc_site_geo3(i).Latitude =toc_site_geo(j).LatitudeMe;
%          poc_site_geo3(i).Longitude =toc_site_geo(j).LongitudeM;
%
%         end
%     end
%     poc_site_geo3(i).upHUC= [];
%     poc_site_geo3(i).accarea =[];
% end


%% correction
% toc_site_geo3(1717,final site version8) HUC12loc located wrong location, the according doc,
% poc  as well: USGS-06889000, should be in 102701020903 not 102701020902

% USGS-04069530 toc_site_geo3(1079,final site version11) HUC12loc located
% in 040301050606 not 041900000200


    for i=1:length(toc_site_geo3)
        if(str2num(toc_site_geo3(i).id(6:end))==06889000)   % 1719
            toc_site_geo3(i).HUC12loc= 102701020903;
        end
        if(str2num(toc_site_geo3(i).id(6:end))==04069530)   
            toc_site_geo3(i).HUC12loc= 040301050606;
        end
    end

    for i=1:length(doc_site_geo3)
        if(str2num(doc_site_geo3(i).id(6:end))==06889000)   % 574
            doc_site_geo3(i).HUC12loc= 102701020903;
        end
        if(str2num(doc_site_geo3(i).id(6:end))==04069530)   
            doc_site_geo3(i).HUC12loc= 040301050606;
        end
    end

    for i=1:length(poc_site_geo3)
        if(str2num(poc_site_geo3(i).id(6:end))==06889000)   % 407
            poc_site_geo3(i).HUC12loc= 102701020903;
        end
        if(str2num(poc_site_geo3(i).id(6:end))==04069530)   
            poc_site_geo3(i).HUC12loc= 040301050606;
        end
    end

    %% trace up HUC12
    boundname = {'bound_shp1_12','bound_shp2_12','bound_shp3_12','bound_shp4_12','bound_shp5_12'...
        'bound_shp6_12','bound_shp7_12','bound_shp8_12','bound_shp9_12','bound_shp10_12'...
        'bound_shp11_12','bound_shp12_12','bound_shp13_12','bound_shp14_12','bound_shp15_12'...
        'bound_shp16_12','bound_shp17_12','bound_shp18_12'};


    for iii = kkk
         
        if(iii==2||iii==9||iii==12||iii==13||iii>=16)
            load([boundname{iii},'.mat']);
            bound_num=eval(boundname{iii});
            clear(boundname{iii});
        elseif(iii==1)
            load([boundname{iii},'.mat']);
            bound_num=eval(boundname{iii});
            
             for bbb=1:length(bound_num)
                tmp=str2num(bound_num(bbb).ToHUC);
                if(~isempty(tmp))
                    if(tmp==010300030603)
                    bound_num(bbb).ToHUC= '010300010603';
                    end
                end
             end
            
            clear(boundname{iii});
       elseif(iii==3)
            load([boundname{iii},'.mat']);
            bound_num=eval(boundname{iii});
   
            for bbb=1:length(bound_num)
                tmp=str2num(bound_num(bbb).ToHUC);
                tmp1=str2num(bound_num(bbb).HUC12);
                if(~isempty(tmp))
                    if(tmp==031300140201)
                        bound_num(bbb).ToHUC= '031300140200';
                    end
                end
            end
        elseif(iii==4)
            load([boundname{iii},'.mat']);
            bound_num=eval(boundname{iii});
            %lake Ontario is not connected to Saint Lawrence river
            %Lake Michigan is not connected to surrounding HUC12
            % as well as Lake superior
            bound_num(7).ToHUC='042900010407';
            bound_num(3815).ToHUC='042400020200';
            for bbb=1:length(bound_num)
                tmp=str2num(bound_num(bbb).ToHUC);
                tmp1=str2num(bound_num(bbb).HUC12);
                if(~isempty(tmp))
                    if(tmp==041900000002||tmp ==041900000000||tmp==040602000000)
                        bound_num(bbb).ToHUC= '041900000200';
                    end
                end

                if(~isempty(tmp))
                    if(tmp==042800000200||tmp==041502000200||tmp==042400000300)
                        bound_num(bbb).ToHUC= '042800020200';
                    end
                end
                if(~isempty(tmp))
                    if(tmp==042000020607)
                        bound_num(bbb).ToHUC= '042000020606';
                    end
                end


                if(~isempty(tmp))
                    if(tmp==042400000200||tmp==040803000300||tmp==041202000300||tmp==042400000000)
                        bound_num(bbb).ToHUC= '042400020200';
                    end
                end

                if(~isempty(tmp))
                    if(tmp==041800000300||tmp==040203000300)
                        bound_num(bbb).ToHUC= '041800000102';
                    end
                end
                if(~isempty(tmp))
                    if(tmp==042600000300)
                        bound_num(bbb).ToHUC= '042600000200';
                    end
                end


                if(~isempty(tmp1))
                    if(tmp1==041800000200)
                        bound_num(bbb).ToHUC= '042000020203';
                    end
                end

            end
        elseif(iii==15) % colorado
            load([boundname{14},'.mat']);
            load([boundname{15},'.mat']);
            bound_num=[bound_shp14_12;bound_shp15_12];
            clear bound_shp14_12 bound_shp15_12
            for bbb=1:length(bound_num)
                tmp=str2num(bound_num(bbb).ToHUC);
                tmp1=str2num(bound_num(bbb).HUC12);
                if(~isempty(tmp))
                    if(tmp==150503030310)
                        bound_num(bbb).ToHUC= '150503030605';
                    end
                end
            end

        elseif(iii== 8)    %% Mississippi
%             load([boundname{5},'.mat']);
%             load([boundname{6},'.mat']);
%             load([boundname{7},'.mat']);
%             load([boundname{8},'.mat']);
%             load([boundname{10},'.mat']);
%             load([boundname{11},'.mat']);
          load('bound_shp8_12x.mat')
         %bound_num=[bound_shp5_12;bound_shp6_12;bound_shp7_12;bound_shp8_12;bound_shp10_12;bound_shp11_12];
         bound_num =bound_shp8_12x;
         %clear bound_shp5_12 bound_shp6_12 bound_shp7_12 bound_shp8_12 bound_shp10_12 bound_shp11_12
          for bbb=1:length(bound_num)
                tmp=str2num(bound_num(bbb).ToHUC);
                tmp1=str2num(bound_num(bbb).HUC12);
                if(~isempty(tmp))
                    if(tmp1==080801010408)
                        bound_num(bbb).ToHUC= '080801010502';
                    end
                end
          end
        else
            bound_num=[];
        end
        if(~isempty(bound_num))
            % then rerun to update upHUC
            downHUC12= [];
            HUC12 =[];
            for k=1:length(bound_num)
                downHUC12 = [downHUC12,str2double(bound_num(k).ToHUC)]; % list all downstream HUC12 for searching upstream
                HUC12 = [HUC12,str2double(bound_num(k).HUC12)];
            end
            %toc
            n=1; %count number
            for i=1:length(toc_site_geo3)
                if(~isempty(toc_site_geo3(i).HUC12loc))
                    [aa,bb] = find(HUC12== toc_site_geo3(i).HUC12loc);
                    if(~isempty(aa))
                        toc_site_geo3(i).upHUC=[];
                        toc_site_geo3(i).NEEarea=[];
                        % toc_site_geo(i).NEE(n)=bound_num(bb).NEE;
                        toc_site_geo3(i).NEEarea(n)=bound_num(bb).AreaSqKm; % notice unit: not sq miles
                        toc_site_geo3(i).upHUC(n)= str2double(bound_num(bb).HUC12);
                        [isupexist,loc] = find(downHUC12== toc_site_geo3(i).HUC12loc);
                        for mm=1:length(loc)
                            % toc_site_geo3(i).NEE =  [toc_site_geo(i).NEE, bound_num(loc(mm)).NEE];
                            toc_site_geo3(i).NEEarea = [toc_site_geo3(i).NEEarea,bound_num(loc(mm)).AreaSqKm];
                            toc_site_geo3(i).upHUC=[toc_site_geo3(i).upHUC,str2double(bound_num(loc(mm)).HUC12)];
                        end

                        while(~isempty(loc))
                            loc1=[];
                            for nn = 1:length(loc)
                                [isupexist,loc2] = find(downHUC12== str2double(bound_num(loc(nn)).HUC12));
                                loc1=[loc1,loc2];
                            end
                            for kk=1:length(loc1)
                                %toc_site_geo(i).NEE=  [toc_site_geo(i).NEE, bound_num(loc1(kk)).NEE];
                                toc_site_geo3(i).NEEarea = [toc_site_geo3(i).NEEarea,bound_num(loc1(kk)).AreaSqKm];
                                toc_site_geo3(i).upHUC = [toc_site_geo3(i).upHUC,str2double(bound_num(loc1(kk)).HUC12)];
                            end

                            loc=loc1;

                        end

                    end
                end
            end
            % doc
            for i=1:length(doc_site_geo3)
                if(~isempty(doc_site_geo3(i).HUC12loc))
                    [aa,bb] = find(HUC12== doc_site_geo3(i).HUC12loc);
                    if(~isempty(aa))
                        doc_site_geo3(i).upHUC=[];
                        doc_site_geo3(i).NEEarea=[];
                        % doc_site_geo(i).NEE(n)=bound_num(bb).NEE;
                        doc_site_geo3(i).NEEarea(n)=bound_num(bb).AreaSqKm; % notice unit: not sq miles
                        doc_site_geo3(i).upHUC(n)= str2double(bound_num(bb).HUC12);
                        [isupexist,loc] = find(downHUC12== doc_site_geo3(i).HUC12loc);
                        for mm=1:length(loc)
                            % doc_site_geo3(i).NEE =  [doc_site_geo(i).NEE, bound_num(loc(mm)).NEE];
                            doc_site_geo3(i).NEEarea = [doc_site_geo3(i).NEEarea,bound_num(loc(mm)).AreaSqKm];
                            doc_site_geo3(i).upHUC=[doc_site_geo3(i).upHUC,str2double(bound_num(loc(mm)).HUC12)];
                        end

                        while(~isempty(loc))
                            loc1=[];
                            for nn = 1:length(loc)
                                [isupexist,loc2] = find(downHUC12== str2double(bound_num(loc(nn)).HUC12));
                                loc1=[loc1,loc2];
                            end
                            for kk=1:length(loc1)
                                %doc_site_geo(i).NEE=  [doc_site_geo(i).NEE, bound_num(loc1(kk)).NEE];
                                doc_site_geo3(i).NEEarea = [doc_site_geo3(i).NEEarea,bound_num(loc1(kk)).AreaSqKm];
                                doc_site_geo3(i).upHUC = [doc_site_geo3(i).upHUC,str2double(bound_num(loc1(kk)).HUC12)];
                            end
                            loc=loc1;
                        end
                    end
                end
            end

            % poc

            for i=1:length(poc_site_geo3)
                if(~isempty(poc_site_geo3(i).HUC12loc))
                    [aa,bb] = find(HUC12== poc_site_geo3(i).HUC12loc);
                    if(~isempty(aa))
                        poc_site_geo3(i).upHUC=[];
                        poc_site_geo3(i).NEEarea=[];
                        % poc_site_geo(i).NEE(n)=bound_num(bb).NEE;
                        poc_site_geo3(i).NEEarea(n)=bound_num(bb).AreaSqKm; % notice unit: not sq miles
                        poc_site_geo3(i).upHUC(n)= str2double(bound_num(bb).HUC12);
                        [isupexist,loc] = find(downHUC12== poc_site_geo3(i).HUC12loc);
                        for mm=1:length(loc)
                            % poc_site_geo3(i).NEE =  [poc_site_geo(i).NEE, bound_num(loc(mm)).NEE];
                            poc_site_geo3(i).NEEarea = [poc_site_geo3(i).NEEarea,bound_num(loc(mm)).AreaSqKm];
                            poc_site_geo3(i).upHUC=[poc_site_geo3(i).upHUC,str2double(bound_num(loc(mm)).HUC12)];
                        end

                        while(~isempty(loc))
                            loc1=[];
                            for nn = 1:length(loc)
                                [isupexist,loc2] = find(downHUC12== str2double(bound_num(loc(nn)).HUC12));
                                loc1=[loc1,loc2];
                            end
                            for kk=1:length(loc1)
                                %poc_site_geo(i).NEE=  [poc_site_geo(i).NEE, bound_num(loc1(kk)).NEE];
                                poc_site_geo3(i).NEEarea = [poc_site_geo3(i).NEEarea,bound_num(loc1(kk)).AreaSqKm];
                                poc_site_geo3(i).upHUC = [poc_site_geo3(i).upHUC,str2double(bound_num(loc1(kk)).HUC12)];
                            end
                            loc=loc1;
                        end
                    end
                end
            end
        end

    end
bound = bound_num;
end

% for tt=1:length(toc_site_geo3)
%    toc_site_geo3(tt).accarea =sum(toc_site_geo3(tt).NEEarea); 
%    if(isempty(toc_site_geo3(tt).NEEarea))
%        warning('no area toc?')
%        tt
%    end    
% end
% 
% for tt=1:length(poc_site_geo3)
%    poc_site_geo3(tt).accarea =sum(poc_site_geo3(tt).NEEarea); 
%     if(isempty(poc_site_geo3(tt).NEEarea))
%        warning('no area poc?')
%    end   
% end
% 
% for tt=1:length(doc_site_geo3)
%    doc_site_geo3(tt).accarea =sum(doc_site_geo3(tt).NEEarea); 
%     if(isempty(doc_site_geo3(tt).NEEarea))
%        warning('no area doc?')
%    end   
% end
