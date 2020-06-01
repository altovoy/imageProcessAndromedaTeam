function ImSnCon=MejoraImagen(Ie,valorpixel)
[R,G,B] = imsplit(Ie);
ImSn=R-valorpixel;
ImSnCon = imadjust(ImSn);
end