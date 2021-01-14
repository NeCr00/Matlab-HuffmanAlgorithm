function index = find_symbol (symbol,alphabet)
disp(symbol)
index = " ";
for i=1:length(alphabet)
    if (strcmp(alphabet(i),symbol))
       index = i;
       break;
    end
end
end