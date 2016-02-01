

img = imread('Defect_3.jpg');

featureVector = gfExtract(img);

A=[];

for i=1:40
    if i==1
        A(:,:,1)=reshape(featureVector(1:size(img,2)*size(img,1)),size(img,1),size(img,2));
    
    else
        A(:,:,i)=reshape(featureVector((i-1)*size(img,2)*size(img,1)+1:i*size(img,2)*size(img,1)),size(img,1),size(img,2));
    end
end

% for i=1:8
%     figure (i)
%     imshow(A(:,:,i));
% end

D=zeros(size(A));
Du = zeros(size(A(:,:,i),1),size(A(:,:,i),2));
for i = 1:40
    I = std2(A(:,:,i));
    u = mean(mean(A(:,:,i),2));
    for j = 1:size(A(:,:,i),1)
           for k = 1:size(A(:,:,i),2)
               Dx = A(j,k,i) - u;
               if(Dx > 3*I)
                   D(j,k,i) = Dx;
               else
                   D(j,k,i) = 0;
               end
           end
    end
    Du = Du + D(:,:,i);
end
image = Du./40;
imshow(Du);