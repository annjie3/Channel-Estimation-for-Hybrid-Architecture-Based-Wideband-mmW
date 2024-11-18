function [As] = steering_dict(grid,array_size,dict_size)
%This funtion generates the Nt x Gt matrix Atx and Nr x Gr matrix Arx
As=zeros(array_size,dict_size);

for count=1:length(grid)
    a=steering_vec(grid(count),array_size);
    As(:,count)=a;
end
end