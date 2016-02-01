function featureVector = gaborFeatures(img,gaborArray,d1,d2)
%% Filtering

% Filter input image by each Gabor filter
[u,v] = size(gaborArray);
gaborResult = cell(u,v);
for i = 1:u
    for j = 1:v
        gaborResult{i,j} = conv2(img,gaborArray{i,j},'same');
        % J{u,v} = filter2(G{u,v},I);
    end
end

%% Feature Extraction
% Extract feature vector from input image
[n,m] = size(img);
s = (n*m)/(d1*d2);
l = floor(s*u*v);
featureVector = zeros(l,1);
c = 0;
for i = 1:u
    for j = 1:v
        
        c = c+1;
        gaborAbs = abs(gaborResult{i,j}); %Mjenjamo sta filter koristi kao poredjenje
        gaborAbs = downsample(gaborAbs,d1);
        gaborAbs = downsample(gaborAbs.',d2);
        gaborAbs = reshape(gaborAbs.',[],1);
        % Normalized to zero mean and unit variance. 
        %gaborAbs = (gaborAbs-mean(gaborAbs))/std(gaborAbs,1);    
        featureVector(((c-1)*s+1):(c*s)) = gaborAbs;
    end
end

%% Show filtered images
% Show real parts of Gabor-filtered images
% figure('NumberTitle','Off','Name','Real parts of Gabor filters');
% for i = 1:u
%     for j = 1:v        
%         subplot(u,v,(i-1)*v+j)    
%         imshow(real(gaborResult{i,j}),[]);
%     end
% end
% 
% % Show magnitudes of Gabor-filtered images
% figure('NumberTitle','Off','Name','Magnitudes of Gabor filters');
% for i = 1:u
%     for j = 1:v        
%         subplot(u,v,(i-1)*v+j)    
%         imshow(abs(gaborResult{i,j}),[]);
%     end
% end
