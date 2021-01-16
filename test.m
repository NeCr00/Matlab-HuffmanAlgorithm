function [] = test()

 %Probabilities of english alphabet from wikipedia
 %alphabet = {'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z'};
 %prob = [.08167 .01492 .02782 .04253 .12702 .02228 .02015 .06094 .06966 .00153 .00772 .04025 .02406 .06749 .07507 .01929 .00095 .05987 .06327 .09056 .02758 .00978 .02361 .00150 .01974 .00074];

% dict = Huffmandictionary(alphabet,prob);
% 
%  char = SourceA();
%  
%  enco = Huffmanencoding(char,dict)
%  deco = Huffmandecoding(enco,dict)
%  
%  prob = EstimateProb()
% 

 [chars,probs,alphabet] = SourceA (2,100)
% 
 dict = Huffmandictionary(alphabet,probs);
% disp(dict.codewords)

 enco = Huffmanencoding("aabb",dict,2);
 disp(enco)
 
%chars = SourceB(2);
%probs = EstimateProb(2,chars);

%'1011000' 