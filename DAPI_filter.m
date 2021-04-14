close all ; clc; clear all;
%% mask
I = imread('Registered-R9_H3K27ac.CD44.CD90.FOXP3_33548-6-Scene-001_c1_ORG.tif'); %read last round dapi
T = 600; %Last round DAPI thresh
mask = I>T; %Last Round DAPI mask
figure; imshow(mask, []);
%roi = drawfreehand;
%roi = drawellipse;
%draw(roi);

%% mask2
mask2 = createMask(roi);
%mask2_uint = uint16(mask2);
mask2_int = int32(mask2);
%ROI masked dapi filtered image
%TopROI_mask = masked_img.*mask2_int;
%% save mask
imwrite(mask, '33548-6_last round dapi mask.tiff');
%imwrite(mask2, '30411-ROI-mask.tiff');
%%
mask_int = int32(mask); %for Labels.tif
%mask_uint = uint16(mask); %for Labels.png
%% apply mask on Segmentation basins (Nuclei Labels b/c we're using DAPI/nuc stain for mask)
I_Nuc = imread('33548-same - Nuclei Labels.tif');
masked_img = I_Nuc.*mask_int; %.tif
%masked_img = I_Nuc.*mask_uint;  %.png
%ROI_mask = masked_img.*mask2_int;
%imwrite(masked_img, '18538-6-CP-crop_Nuclei Labels_DapiFilter.png');
%% IDs of cells in the masked region
Nuc_IDs = unique(masked_img); %compare if I_M_Nuc and I_M_Cell are the same - should be, if yes just use one
dlmwrite('33548-6_R9_DapiFilter_IDs-try3.csv', Nuc_IDs,'delimiter', ',', 'precision', 9)
%ROI_IDs = unique(ROI_mask);
%csvwrite('30411-6_ROI-mask_IDs.csv',ROI_IDs)
%% extra
