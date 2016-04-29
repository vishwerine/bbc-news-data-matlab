function [data,sizemat] = load_data(str)

imgSet = imageSet(str);

sizemat = [];
data = [];

fileNames = [];
for i = 1:imgSet.Count
    try
    ir = rgb2gray(imgSet.read(i));
    points = detectSURFFeatures(ir);
    [features,validPoints] = extractFeatures(ir,points);
    data = [data;features];
    sizemat = [sizemat;size(features,1)];
    
    fileNames = [fileNames ; imgSet.select(i).ImageLocation];
    catch
        
    end
end

save('data','data');
save('sizemat','sizemat');
save('fileNames','fileNames');

end