close all ; clc; clear all;
%% mask
I = imread('last round dapi image'); %.tif or .png
T = 600; %Last round DAPI thresh
mask = I>T; %Last Round DAPI mask
figure; imshow(mask, []);
%roi = drawfreehand; %roi = drawellipse;
%draw(roi);
mask2 = createMask(roi);
%mask2_uint = uint16(mask2);
mask2_int = int32(mask2);
%ROI masked dapi filtered image

%% save masks
imwrite(mask, 'tissueID_last round dapi mask.tiff');
%imwrite(mask2, 'tissueID-ROI-mask.tiff');
%%
mask_int = int32(mask); %for .tif
%mask_uint = uint16(mask); %for .png

%% apply mask on Nuclei segmentation Labels b/c we're using DAPI/nuc stain for mask
I_Nuc = imread('tissueID- Nuclei Labels.tif');
masked_img = I_Nuc.*mask_int; %.tif
%masked_img = I_Nuc.*mask_uint;  %.png
%ROI_mask = masked_img.*mask2_int; %tif
imwrite(masked_img, 'tissueID_Nuclei Labels_DapiFilter.png');

%% IDs of cells in the masked region
Nuc_IDs = unique(masked_img); %compare if I_M_Nuc and I_M_Cell are the same - should be, if yes just use one
dlmwrite('tissueID_DapiFilter_IDs.csv', Nuc_IDs,'delimiter', ',', 'precision', 9) 
ROI_IDs = unique(ROI_mask);
csvwrite('tissueID_ROI-mask_IDs.csv',ROI_IDs)

