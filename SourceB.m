function [chars] = SourceB(type)

alphabet = ['a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z'];
fileID = fopen('kwords.txt','r');

chars = fscanf(fileID,'%s');

if type == 2
    new_alphabet = []
    a =1;
     for i=1:26
        for j=1:26
            new_alphabet{a} = strcat(alphabet(i), alphabet(j));
           a = a +1;
           
        end
    end
    
    chars = new_alphabet;
    
end

end

