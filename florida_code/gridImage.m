function [] = gridImage(I, n)

hold on;
M = size(I,1);
N = size(I,2);
a=M/n; 
b=N/n;
for k = 1:a:M
    x = [1 N]; 
    y = [k k];
    plot(x,y,'Color','w','LineStyle','-');
    set(findobj('Tag','MyGrid'),'Visible','on')
end

for k = 1:b:N 
    x = [k k]; 
    y = [1 M];
    plot(x,y,'Color','w','LineStyle','-');
    set(findobj('Tag','MyGrid'),'Visible','on')
end
hold off;
end