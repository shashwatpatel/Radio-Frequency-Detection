function [array] = clamper(array)

shift = min(array);

array = array - shift;
end

