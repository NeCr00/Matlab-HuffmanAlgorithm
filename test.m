function [] = test()

 %Probabilities of english alphabet from wikipedia
 alphabet = {'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z'};
 %prob = [.08167 .01492 .02782 .04253 .12702 .02228 .02015 .06094 .06966 .00153 .00772 .04025 .02406 .06749 .07507 .01929 .00095 .05987 .06327 .09056 .02758 .00978 .02361 .00150 .01974 .00074];

 %First we must estimate the probsbilities from kwords file
 prob = EstimateProb(1,alphabet);
 
 dict = Huffmandictionary(alphabet,prob);
 
% Generate random base on probabilities string with 10000 characters from source?, 
 disp("String :");
 string = SourceB(1)

%Encoding string with Huffman encoding.We parse string and the dictionary
%we generated from Huffmandictionary method
encoded = Huffmanencoding(string,dict);
disp("Encoding :")
disp(encoded);

%Decoding the encoded string.We parse encoded string and dictionary.
decoded = Huffmandecoding(encoded,dict);
disp("Decoding :")
disp((decoded));
