I = imread('54774-4-new - Nuclei Labels.tif');
I2 = I>0;

%% plot 

x1 = 12972.22;
y1 = 4350.945;
c1 = 12965; c2 = 12980;
c3 = 4341; c4 = 4359;

imshow(I2),colormap jet
hold on
plot([c1 c2],[y1 y1],'green')
plot([x1 x1],[c3 c4],'green')

%% define coordinates
x1 = table2array(xandyedited(:,2));
y1 = table2array(xandyedited(:,3));
% is vector of xs
%y1 is vector of ys

%% loop

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


    
    