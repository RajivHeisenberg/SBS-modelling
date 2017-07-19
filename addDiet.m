function newmodel=addDiet(model,dietfile)
newmodel=model;
[reactions,fluxValues]=readDiet(dietfile);
%convert flux values into appropriate units : Warning: not yet done!!!!!
%newmodel.lb=zeros(size(newmodel.lb));
s=size(reactions);
for i=1:s(1)
    idx=find(strcmp(newmodel.rxns,reactions(i)));
    if idx
       newmodel =changeRxnBounds(newmodel,reactions(i),-1*fluxValues(i),'l');
    end
end
end
