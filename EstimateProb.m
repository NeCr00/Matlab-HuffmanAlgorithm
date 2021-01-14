function [probs] = EstimateProb(type,alphabet)
%ESTIMATEPROB Summary of this function goes here
%   Detailed explanation goes here

%alphabet = ['a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z'];
 fileID = fopen('kwords.txt','r');
 text = fscanf(fileID,'%s');
 text = (erase(text,'-'));
if type == 1
    count = zeros(1,26,'uint32')

    for i=1:length(text)
    index = strfind(alphabet,text(i));
    count(index) = count(index) +1;
    end
    total_chars = length(text);
    probs = zeros(1,26);
    for i=1:26

        probs(i) = double(count(i)) ./ total_chars;
    end
else
    i =1;
    count = zeros(1,676,'uint32');
    
    while i < length(text)
      symbol = strcat(text(i),text(i+1));
      %symbol = "aa-";
      indexx = find_symbol(symbol,alphabet);
      count(indexx) = count(indexx) +1;
     i = i+2;
     
    end
  
     probs = []
    disp(count);
end
end

