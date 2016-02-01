function featureVector = gfExtract(img)

img = rgb2gray(img);
gaborArray = gaborFilterBank(5,8, 39, 39);      % gaborFilterBank(u,v,m,n)
featureVector = gaborFeatures(img,gaborArray,1,1);
% opts = statset('Display','final');
% [idx,ctrs] = kmeans(featureVector,2,...
%                     'Distance','city',...
%                     'Replicates',5,...
%                     'Options',opts);
% plot(idx);

% u - broj skala
% v - broj orjentacija