function [probs] = EstimateProb(type,alphabet)
%ESTIMATEPROB Summary of this function goes here
%   Detailed explanation goes here

%
alphabet = ['a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z'];
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
    %make an array of the couples alphabet   
    a =1;
    index = zeros(26,26);
    for i=1:26
        for j=1:26
            new_alphabet{a} = strcat(alphabet(i), alphabet(j));
           a = a +1;
           index(i,j) = j;
        end
    end
    alphabet = new_alphabet;
    i =1;
    index = 0;
    count = zeros(1,676,'uint32');
    text = strtrim(text);
    while i < length(text)
       
      symbol = strcat(text(i),text(i+1));
      index = find(contains(alphabet,symbol));
      count(index) = count(index) +1;
      i = i+2;
     
    end
    j=0;
    probs = zeros(1,676);
    zero = nnz(~count);
    total_chars = length(text)./2-24
    for i=1:length(alphabet)
        probs(i) = double(count(i)) ./ double(total_chars);
        j = j + probs(i);
     end
%     
    disp(j) 

  dict = Huffmandictionary(alphabet,probs);
     disp(dict.codewords)
end
end

