function [chars,prob,alphabet] = SourceA(type,num)

alphabet = ['a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z'];
prob = [.08167 .01492 .02782 .04253 .12702 .02228 .02015 .06094 .06966 .00153 .00772 .04025 .02406 .06749 .07507 .01929 .00095 .05987 .06327 .09056 .02758 .00978 .02361 .00150 .01974 .00074];
index =[1:26];
chars = [];




if type ==1
    
    out=randsrc(num, 1, [index; prob] );
    
    for i=1:length(out)
        index_ = out(i);
        chars = [chars,alphabet(index_)];
    end


 % Find probabilities of couples
 else
     
    new_prob = zeros(26);
    
    for i=1:26
        for j=1:26
            new_prob(i,j) = prob(i) * prob(j);
            
        end
    end
     prob = reshape(new_prob, [1, 26*26]);
    
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
   
    index = [1:676];
    out = randsrc(num,1,[index; prob]);
    
    for i=1:length(out)
        index_ = out(i);
        chars = [chars,new_alphabet(index_)];
    end
    alphabet = new_alphabet
end


