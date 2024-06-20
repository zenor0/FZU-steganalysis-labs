% result 为色彩加强的 RGB 矩阵
function [imageRGB, imageR, imageG, imageB, result] = rgbanalysis(image, permission, level);
    % 读取图像信息并转换为 double 型
    imageRGB = imread (image, permission);
    imageRGB = double (imageRGB) / 255;
    result = imageRGB;
    % 对图像进行分层提取
    imageR = imageRGB(:, :, 1);
    imageG = imageRGB(:, :, 2);
    imageB = imageRGB(:, :, 3);
    % 显7K结果
    subplot(321), imshow(imageRGB) ('原始图像');
    subplot(322), imshow(imageR), title('R 层灰度图像');
    subplot(323), imshow(imageG), title('G 层灰度图像');
    subplot(324), imshow(imageB), title('B 层灰度图像');
    % 对相应的层进行颜色加强
    if level == 1
        imageR = imageR +0. 2;
    end

    if level == 2
        imageG = imageG + 0. 2;
    end

    if level == 3
        imageB = imageB + 0. 2;
    end

    result(:, :, 1) = imageR;
    result(:, :, 2) = imageG;
    result(:, :, 3) = imageB;
    % 通过图像写回保存将超出范围的像素值自动调整为最大
    imwrite(result, 'temp, jpg，, 'jpg，);
    result = imread (，temp, jpg', 'jpg');
    % 显示结果
    subplot(325), imshow (result), title('色彩增强的结果，);
