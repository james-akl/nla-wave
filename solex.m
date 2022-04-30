%--------------------------------------------------
% H  E  A  D  E  R
%--------------------------------------------------
% AUTHOR    | JAMES AKL
%--------------------------------------------------

%--------------------------------------------------
% B  O  D  Y
%--------------------------------------------------
function z = solex(y,t)

%0. Description
    %Computes the values of the exact solution u_ex (y_i) in a matrix z.
    %Specifically, z_ij: (y_i,t_j) ? u_ex (y_i,t_j).
    %Meaning, focus on one column to fix 't' and vary 'y'
    %or on one row to fix 'y' and vary 't'.

    %User-Input Error-Handling.
    if (~iscolumn(y)) %Transpose y if it is a row vector.
        y = y';
    end
    if (~isrow(t)) %Transpose t if it is a column vector.
        t = t';
    end
    
%1. Initialiaze Variables
    z = zeros(size(y,1),size(t,2));
    %z has same number of rows as 'y', and same number of columns as 't'.

    for j = 1:size(t,2)
        z(:,j) = sqrt(2) .* sin(4*pi*y); %Assuming radians are used.
    end
    %Fill each row with the position vectors.
    
    for i = 1:size(y,1)
        z(i,:) = z(i,:) .* cos(40*pi*t + pi/4); %Assuming radians are used.
    end
    %Multiply each row by its corresponding time vector.
    %This is possible size z(y,t) = f(y)*g(t).
    
end