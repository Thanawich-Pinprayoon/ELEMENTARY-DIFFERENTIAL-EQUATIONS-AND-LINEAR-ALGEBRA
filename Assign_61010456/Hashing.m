function [output] = Hashing(text,Gene,round)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
textraw = double(text)
[genrow,gencol] =  size(Gene);
[~,tcol] = size(textraw);
m = mod(tcol,genrow);
if m ~= 0
    z = zeros(1,genrow-m);
    textraw = [textraw,z];
end
[~,tcol] = size(textraw);
partcol = tcol/gencol;
textmat = reshape(textraw,gencol,partcol);
textmat = textmat.'
for i = 1:round
    textmat = multi_lot_of_loop(textmat,Gene);
end
outarr = arrayfun(@(x)maptoascii(x),textmat);
outtext = outarr(:);
output = char(outtext);
end

