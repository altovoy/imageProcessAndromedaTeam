clc
clear all
close all

% km/px
km_px = 0.110;

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
coloredImage = imfuse(avgImageBefore,avgImageAfter,'falsecolor','Scaling','joint','ColorChannels',[1 2 0]); 
imshow(coloredImage), grid on;

kms = size(coloredImage)*km_px;

ylabel(strcat(num2str(kms(1)), ' KM'));
xlabel(strcat(num2str(kms(2)), ' KM'));
text(1.1,0.95,'Before',...
     'horiz','center',...
     'vert','bottom',...
     'units','normalized','backgroundcolor','g')
text(1.1,0.9,' After ',...
     'horiz','center',...
     'vert','bottom',...
     'units','normalized','backgroundcolor','r')
text(1.1,0.85,'Don´t vary',...
     'horiz','center',...
     'vert','bottom',...
     'units','normalized','backgroundcolor','y')
gridImage(coloredImage, 5);
title('Before and after quarantine');
axis image;




%% PROFILE
%crear perfil en longitud
[datoR,datoG,Kmintlon,Kmintlat,Pix]=CrearPerfilMapa(coloredImage,0,200, km_px);
figure,
plot(Kmintlon,datoR,'r');
hold on
plot(Kmintlon,datoG,'G'); title('Pefil de linea en longitud')
xlabel('Kilometros') 
ylabel('Valor del pixel') 
%crear perfil en latitud
[datoR,datoG,Kmintlon,Kmintlat,Pix]=CrearPerfilMapa(coloredImage,1,200, km_px);
figure,
plot(datoR,Kmintlat,'r');
hold on
plot(datoG,Kmintlat,'G'); title('Pefil de linea en latitud')
xlabel('Kilometros') 
ylabel('Valor del pixel') 