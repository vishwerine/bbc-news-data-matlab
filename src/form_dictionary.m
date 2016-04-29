
load('np_cells');

num_of_docs = size(obj_arr,2);

dic = containers.Map;

for i=1:num_of_docs
    num_of_words = size(obj_arr{i},1);
    for j=1:num_of_words
        word = obj_arr{i}(j,:);
        word = strtrim(word);
        if isKey(dic,word)
            dic(word) = dic(word) + 1;
        else
            dic(word) = 1
        end
    end
end

save('dic','dic');