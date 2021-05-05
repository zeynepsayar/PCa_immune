I = imread('tissueID - Nuclei Labels.tif'); %load segmentation mask
I2 = I>0;
%upload (X,Y) coordinate data

%% get x any y coordinates of cells of interest (ie. in a specific cluster)
x1 = table2array(xandyedited(:,2));
y1 = table2array(xandyedited(:,3));
%x1 is vector of x's
%y1 is vector of y's

%% overlay selected coordinates on selected image 

imshow(I2), colormap jet
hold on
plot([x1(1,1)-10 x1(1,1)+10],[y1(1,1) y1(1,1)],'green')
plot([x1(1,1) x1(1,1)],[y1(1,1)-10 y1(1,1)+10],'green')

for i = 2:length(x1);
    x = x1(i,1);
    y = y1(i,1);
    c1 = x -10; c2 = x +10;
    c3 = y -10; c4 = y+10;
    plot([c1 c2],[y y],'green')
    plot([x x],[c3 c4],'green')
end


    
    
