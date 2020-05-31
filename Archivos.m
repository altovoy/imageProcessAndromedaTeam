clc
clear all
close all

% Extrayendo y organizando las imagenes desde el folder img 
files = sortByDate(dir ('./img/*png'));

% Valor que se le sustraerá a cada imagen
substract = [150 130 250 250 220 180 220 240 240 200 180 240];
temp = num2cell(substract);
[files.substract] = temp{:};

% Lectura y procesamiento de imagenes
for i=1:length(files)
    % Lectura de imagen 
    files(i).initialImg = imread(strcat('./img/',files(i).name));
    
    % Procesamiento de imagen
%     files(i).substractedImg = MejoraImagen(files(i).initialImg,files(i).substract);
end

