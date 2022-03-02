%% 第一张 摩天轮
img = imread('7.bmp');
img=imresize(img,0.5);
imgsize=size(img);
%提取bitplane比特平面
bitPlane=zeros(imgsize(1),imgsize(2),8);
for i =1:8
    for ro=1:imgsize(1)% ro: row图片行号，y
        for co=1:imgsize(2) %co: column图片,x
        bitPlane(ro,co,i)=bitget(img(ro,co), i);
        end        
    end    
end
% 绘制bitplane
figure;
for i =1:8
    subplot(2,4,i)
    imshow(uint8(255*bitPlane(:,:,i)))
    title(['Bitplane' num2str(i)])
end
%%  lena
imgW = imread('9.bmp');
imgW=imresize(imgW,0.5);
imgWsize=size(imgW);
[length,width,~]=size(imgW);
%提取bitplane
bitPlaneW=zeros(imgWsize(1),imgWsize(2),8);
for i =1:8
    for ro=1:imgWsize(1)
        for co=1:imgWsize(2)
        bitPlaneW(ro,co,i)=bitget(imgW(ro,co), i);
        end        
    end    
end
% 绘制bitplane
figure;
for i =1:8
    subplot(2,4,i)
    imshow(uint8(255*bitPlaneW(:,:,i)))
    title(['Bitplane' num2str(i)])
end

%% 构造新的bitPlane
newbitPlane=bitPlane;
newbitPlane(:,:,2) = bitPlaneW(:,:,8);
newbitPlane(:,:,1) = bitPlaneW(:,:,7);
%% 产生新图片（含水印）
newimg=zeros(256,256);
for i =1:8
    newimg=newimg+newbitPlane(:,:,i)*2^(i-1);
end
newimg=uint8(newimg);
figure;
imshow(newimg),title('含水印的新图片');imwrite(newimg,'02ins2.bmp');

%% 水印提取过程
%提取bitplane
bitPlaneRec=zeros(imgsize(1),imgsize(2),8);
for i =1:8
    for ro=1:imgsize(1)
        for co=1:imgsize(2)
        bitPlaneRec(ro,co,i)=bitget(newimg(ro,co), i);
        end        
    end    
end
% 绘制bitplane
figure;
for i =1:8
    subplot(2,4,i)
    imshow(uint8(255*bitPlaneRec(:,:,i)))
    title(['Bitplane' num2str(i)])
end


% 复原水印图
newimgW=zeros(imgsize(1),imgsize(2));
for i =1:2
    newimgW=newimgW+bitPlaneRec(:,:,i)*2^(4+i);
end

figure;
imshow(uint8(newimgW)),title('提取出的图片');imwrite(uint8(newimgW),'02ins2out.bmp');
