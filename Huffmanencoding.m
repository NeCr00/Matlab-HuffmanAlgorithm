function enco = Huffmanencoding(sig,dict)

   enco = ''; % Empty encoded signal (char).
    while( ~isempty(sig) ) % Loop for each signal value.
        tempcode = ''; % Empty signal value (char).
        for j = 1 : length(dict.symbol) 
            % Search sequentially through the dictionary to
            % find the proper code for the given signal.
             if( strcmp(sig(1),dict.symbol{j}) ) % If there is a match.
                 tempcode = dict.codewords{j};
                 break;
             end
        end
%         if isempty(tempcode) % Error checking.
%             error('The Huffman dictionary provided does not have the codes for all the input signals.');
%         end        
        enco = strcat( enco,tempcode ); % Append the code to the encryption message.
        sig = sig(2:end); % Update the signal vector.
      
    end  
    
  

end

