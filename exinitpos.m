%--------------------------------------------------
% H  E  A  D  E  R
%--------------------------------------------------
% AUTHOR    | JAMES AKL
%--------------------------------------------------

%--------------------------------------------------
% B  O  D  Y
%--------------------------------------------------
function z = exinitpos(y)

%0. Description
    %Generates the initial position vector V such that
    %v_i = v(y_i) where v(y_i) is the initial position of every
    %element y_i of a position vector 'y'.

    %User-input error-handling.
    if (~iscolumn(y)) %Transpose y if it is a row vector.
        y = y';
    end
    
%1. Initialiaze variables
    z = sin(4 * pi * y); %Assuming radians are used.

end