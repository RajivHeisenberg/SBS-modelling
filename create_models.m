
%%
%sbmlTestModelToMat('/home/rajiv/Documents/Studies/All codes', '/home/rajiv/Documents/Studies/All codes');
%bc_model=load('Bacterocides_sp_1_1_14.mat');
bac_model=readSBML('Bacteroides_sp_1_1_14.xml');
bac_model.lb=bac_model.lb';
bac_model.ub=bac_model.ub';
epi_model=load('sIEC.mat');
epi_model=epi_model.IEC1907;
bac_model.c(1)=0;
bac_model=changeObjective(bac_model,'biomass473');
bac_gr=optimizeCbModel(bac_model,'max');
epi_model=changeObjective(epi_model,'biomass_reactionIEC01b');
epi_gr=optimizeCbModel(epi_model,'max');
%%
%merging both models
%merged=mergeTwoModels(bac_model,epi_model,1);
%merged_bac_gr=optimizeCbModel(merged,'max');