function [imgProm] = avgImages(images)
l = length(images);
sum = 0;
for i=1:l
    sum = sum + uint16(images{i});
end
imgProm = uint8(sum)/l;

end