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

coloredImage = imfuse(files(1).substractedImg,files(8).substractedImg,'falsecolor','Scaling','joint','ColorChannels',[1 2 0]); 
imshow(coloredImage);
title('Before and after quarantine');



%% PROFILE

xi=[1000,1];%punto de inicio de la linea de datos
yi=[1000,3271];%punto final de la linea de datos
data=improfile(coloredImage,xi,yi);%perfil de linea vector de 3 dimensiones con planos de color
datoR=data(:,:,1);%plano rojo del vector
datoG=data(:,:,2);%plano verde del vector
figure,
plot(datoR,'r');%grafica de valores en el plano rojo
hold on
plot(datoG,'G')%grafica de valores en el plano verde