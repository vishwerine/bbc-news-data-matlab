imgSet = imageSet('data/');

sizemat = [];
data = [];

for i = 1:imgSet.Count
    try
    ir = rgb2gray(imgSet.read(i));
    points = detectSURFFeatures(ir);
    [features,validPoints] = extractFeatures(ir,points);
    data = [data;features];
    sizemat = [sizemat;size(features,1)];
    catch
        ;
    end
end

