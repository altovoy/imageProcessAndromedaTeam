function ImSnCon=MejoraImagen(Ie,valorpixel)

R = Ie(:, :, 1);
ImSn=R-valorpixel;
ImSnCon = imadjust(ImSn);
end