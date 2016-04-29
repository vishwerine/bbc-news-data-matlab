load('dic');
load('np_cells');

num_of_docs = size(obj_arr,2);

fid = fopen('vocab.txt','w');


V = size(dic.keys);



for i=1:num_of_docs
    num_of_words = size(obj_arr{i},1);
    marked_words = containers.Map;
    
    for j=1:num_of_words
        cmpword = obj_arr{i}(j,:);
        word = strtrim(cmpword);
        if isKey(marked_words,word)
            ;
        else
            marked_words(word) = 1;
            % mark the word
            count = 0
            for k=1:num_of_words
                tempword = obj_arr{i}(k,:);
                
                if tempword == cmpword
                    count = count + 1;
                end
            end
            idx = find(ismember(dic.keys,word));
            fprintf(fid,'%d %d %d\n',i,idx,count);
        end
        
        
    end
end

fclose(fid);
