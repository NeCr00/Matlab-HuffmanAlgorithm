 function dict = Huffmandictionary(alphabet,prob)

%alphabet = {'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z'};
%prob = [.08167 .01492 .02782 .04253 .12702 .02228 .02015 .06094 .06966 .00153 .00772 .04025 .02406 .06749 .07507 .01929 .00095 .05987 .06327 .09056 .02758 .00978 .02361 .00150 .01974 .00074];
  
    % Initialize working space.
    for i = 1:length( prob )    % For each probability.
        codewords{i} = '';      % Create an empty codeword.
        symbol{i} = i;          % Index the codeword.
        word(i) = alphabet(i);  % Append it's symbol.
    
    end
% 
%   --- /Error checking ------------------------
%
%   --- Main Function   ------------------------

    % Coding state.     
    while ( prob ~= 1 ) % Loop, until we reach the root.
        % Sort the probabilities at every loop.
        [~, arr] = sort(prob);  % Get arrangement of the sorted probabilities.
        % Get the index of the two sets to be merged.
        last = arr(1);
        next = arr(2);
        % Get their main index or indexes.
        right_set = symbol{last};
        left_set  = symbol{next};
        % Get their probabilities.
        right_probability = prob(last); 
        left_probability  = prob(next); 
        % Append them in a new set.
        merged_set = [right_set, left_set]; 
        new_prob   = right_probability + left_probability;
        % Debug logging.
      
            merged_word = strcat(word{last},word{next});
            
            word(arr(1:2)) = '';
            word = [word merged_word];
             
       
        % Update probability and symbol sets
        symbol(arr(1:2)) = '';
        prob(arr(1:2))   = '';
        symbol = [symbol merged_set];
        prob   = [prob new_prob];     
        
        % Get the updated codeword.
        codewords = append_(codewords,right_set,'1');
        codewords = append_(codewords,left_set,'0');
        
        
    end
    
    dict.symbol = alphabet;
    dict.codewords = codewords;
    fid = fopen('dictionary.txt','wt');
    
    for i = 1:length(alphabet)
    fprintf(fid,'%s\t',alphabet{i},codewords{i});
    fprintf(fid,'\n');
    end
fclose(fid)

end

% 
% % EOF -- huffmadict_