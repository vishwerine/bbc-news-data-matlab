function [idx3,C3] = get_visual_terms()
    load('data');
    load('sizemat');
    
    [idx3,C3] = kmeans(data,200,'Display','iter');
    
    save('idx3','idx3');
    save('C3','C3');
end