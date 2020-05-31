clc
clear all
close all

% Los datos estan organizados en arrays de structs 
% cada elemento del contiene un struct con los atributos  -> 

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
     files(i).substractedImg = MejoraImagen(files(i).initialImg,files(i).substract);
end

figure;
suptitle('AVERAGE BRIGHTNESS');
subplot(1,3,1);

avgImageBefore = avgImages( {files(1:6).substractedImg} );
imshow(avgImageBefore); title('Before');

subplot(1,3,2);
avgImageAfter = avgImages( {files(7:12).substractedImg} );
imshow(avgImageAfter); title('After');

subplot(1,3,3);
diff = imabsdiff(avgImageBefore,avgImageAfter);
imshow(diff); title('Difference');



figure;

C = imfuse(files(1).substractedImg,files(8).substractedImg,'falsecolor','Scaling','joint','ColorChannels',[1 2 0]); 
imshow(C);
title('Before and after quarantine');

