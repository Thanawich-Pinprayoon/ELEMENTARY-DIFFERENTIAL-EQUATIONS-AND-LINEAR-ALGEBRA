function [character] = maptoascii(dectext)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
character = mod((dectext-33),(127-33))+33;
end

