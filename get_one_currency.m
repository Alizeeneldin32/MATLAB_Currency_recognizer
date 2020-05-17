function img_cell = get_one_currency(org_img)
I=double(org_img);
In=I; 
mask1=[1, 0, -1;1, 0, -1;1, 0, -1]; 
mask2=[1, 1, 1;0, 0, 0;-1, -1, -1]; 
mask3=[0, -1, -1;1, 0, -1;1, 1, 0]; 
mask4=[1, 1, 0;1, 0, -1;0, -1, -1]; 
mask1=flipud(mask1); 
mask1=fliplr(mask1); 
mask2=flipud(mask2); 
mask2=fliplr(mask2); 
mask3=flipud(mask3); 
mask3=fliplr(mask3); 
mask4=flipud(mask4); 
mask4=fliplr(mask4); 
for i=2:size(I, 1)-1
    for j=2:size(I, 2)-1
        neighbour_matrix1=mask1.*In(i-1:i+1, j-1:j+1); 
        avg_value1=sum(neighbour_matrix1(:)); 
        neighbour_matrix2=mask2.*In(i-1:i+1, j-1:j+1); 
        avg_value2=sum(neighbour_matrix2(:)); 
        neighbour_matrix3=mask3.*In(i-1:i+1, j-1:j+1); 
        avg_value3=sum(neighbour_matrix3(:)); 
        neighbour_matrix4=mask4.*In(i-1:i+1, j-1:j+1); 
        avg_value4=sum(neighbour_matrix4(:)); 
        I(i, j)=max([avg_value1, avg_value2, avg_value3, avg_value4]);
    end 
end 
I=uint8(I);
BW=im2bw(I, 0.7);
BW=imcomplement(BW);
BW=imdilate(BW, ones(5, 5));
BW=imerode(BW, ones(5, 5));
BW=imdilate(BW, ones(3, 3));
BW=imerode(BW, ones(3, 3));
[labeledImage, numberOfObject] = bwlabel(BW);
img_cell{numberOfObject}={};
for i=1:numberOfObject
    BWO = ismember(labeledImage, i);
    [labeledImageA, ~] = bwlabel(BWO);
    props = regionprops(labeledImageA, 'BoundingBox', 'Area');
    area = cat(1,props.Area);
    [~,maxAreaIdx] = max(area);
    bb = round(props(maxAreaIdx).BoundingBox);
    croppedImage = org_img(bb(2):bb(2)+bb(4),bb(1):bb(1)+bb(3),:);
    img_cell{i}=croppedImage;
end
end