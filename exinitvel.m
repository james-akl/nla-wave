%--------------------------------------------------
% H  E  A  D  E  R
%--------------------------------------------------
% AUTHOR    | JAMES AKL
%--------------------------------------------------

%--------------------------------------------------
% B  O  D  Y
%--------------------------------------------------
function z = exinitvel(y)

%0. Description
    %Generates the initial velocity vector W such that
    %w_i = w(y_i) where w(y_i) is the initial velocity of every
    %element y_i of a position vector 'y'.

    %User-Input Error-Handling.
    if (~iscolumn(y)) %Transpose y if it is a row vector.
        y = y';
    end
    
%1. Initialiaze Variables
    z = -40 * pi * sin(4 * pi * y); %Assuming radians are used.

end