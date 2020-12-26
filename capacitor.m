function [array] = capacitor(x,cap_slope,array)


derivative_array = diff(array);
%plot(x(1:length(x)-1),derivative_array)

zero_slope = [];
wait = 1;
% Find Slope Changes
for i = 1: length(x) - 1
    
    if (derivative_array(i) < 0 && wait)
    zero_slope(length(zero_slope) + 1) = i;     
    wait = 0; % Stop All Further Values will be Negative wait until slope positive again
    end
    
    if (derivative_array(i) > 0)
    wait = 1; % Go
    end
    
end

% if (zero_slope(1) = 0)
% Get Slopes in Between Hill
for i = 1: length(zero_slope)- 1
  % rise = (pos_array(zero_slope(i+1) - 36) - pos_array(zero_slope(i)));
    run(i) = (zero_slope(i+1)-zero_slope(i));
        
end

% Replace Tails of Peaks with new slope
for i = 1: length(zero_slope) - 1
  for j = 1: run(i) + 1
    if (array(zero_slope(i) + j) < j * cap_slope + array(zero_slope(i)))
    array(zero_slope(i) + j) = j * cap_slope + array(zero_slope(i));
    end
  end
end

% For the Last Peak
for i = 1: length(array) - zero_slope(length(zero_slope))
    if ( array( zero_slope(length(zero_slope)) + i) < i * cap_slope + array( zero_slope(length(zero_slope)) ) )
    array( zero_slope(length(zero_slope) ) + i) = i * cap_slope + array( zero_slope(length(zero_slope) ));
    end
end

end

