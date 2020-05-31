function [filesOut] = sortByDate(filesIn)
for i=1:length(filesIn)
    filesIn(i).date = datetime(strrep(filesIn(i).name, '.png', ''),'InputFormat', 'dd-MM-yyyy');
end
[x,idx]=sort([filesIn.date]);
filesIn=filesIn(idx);
filesOut = filesIn;
end