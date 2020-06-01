function [datoR,datoG,Kmintlon,Kmintlat,Pix]=CrearPerfilMapa(Imagen,Tipo,Km, km_px)
%conversion de Km a Pixeles
Pix=round(Km/km_px);
[R,G,B] = imsplit(Imagen);
[Maxlat,Maxlon,num]=size(Imagen);
Kmintlon=[0:0.11:((Maxlon*0.11)-0.11)];
Kmintlat=[0:0.11:((Maxlat*0.11)-0.11)];
if(Tipo==0)%medidas en longitud
    xi=[0,Maxlon];
    yi=[Pix,Pix];%punto final de la linea de datos
    data=improfile(Imagen,xi,yi,Maxlon);%perfil de linea vector de 3 dimensiones con planos de color
    datoR=data(:,:,1);%plano rojo del vector
    datoG=data(:,:,2);%plano verde del vector

else
    xi=[Pix,Pix];
    yi=[0,Maxlat];%punto final de la linea de datos
    data=improfile(Imagen,xi,yi,Maxlat);%perfil de linea vector de 3 dimensiones con planos de color
    datoR=data(:,:,1);%plano rojo del vector
    datoG=data(:,:,2);%plano verde del vector
end