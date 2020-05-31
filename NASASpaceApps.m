clc
close all
clear all


%introducir imagenes
Ie1=imread('25-01-2020.png');



%Filtrado de la imagen por resta de grises
I1=MejoraImagen(Ie1,150);
I2=MejoraImagen(Ie2,130);
I3=MejoraImagen(Ie3,250);
I4=MejoraImagen(Ie4,250);
I5=MejoraImagen(Ie5,220);
I6=MejoraImagen(Ie6,180);
I7=MejoraImagen(Ie7,220);
I8=MejoraImagen(Ie8,240);
I9=MejoraImagen(Ie9,240);
I10=MejoraImagen(Ie10,200);
I11=MejoraImagen(Ie11,180);
I12=MejoraImagen(Ie12,240);

PromSP = (double(I1) + double(I2)+ double(I3)+ double(I4)+ double(I5)+ double(I6)) / 6;
imshow(PromSP); title('imagen promedio sin confinamiento');
PromP = (double(I7) + double(I8)+ double(I9)+ double(I10)+ double(I11)+ double(I12)) / 6;
figure,
imshow(PromP); title('imagen promedio en confinamiento');

Z=imabsdiff(PromSP,PromP);
figure,
imshow(Z)


