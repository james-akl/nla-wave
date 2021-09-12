%--------------------------------------------------
% H  E  A  D  E  R
%--------------------------------------------------
% AUTHOR    | JAMES AKL
%--------------------------------------------------

%--------------------------------------------------
% B  O  D  Y
%--------------------------------------------------
function z = prodmatvec(x,n)

%0. Description
    %Generates the n-dimensional vector A*x from the discretized
    %problem using the Finite Diffences Method. Exploits the sparsity 
    %of A to calculate A*x without constructing A.
    %n is the number of interior points.

    %User-Input Error-Handling.
    if (n <= 0 || isinf(n) || floor(n) ~= n || ~isreal(n))
       disp('ERROR: n must be a strictly positive integer.');
       return;
    end   
    if (~iscolumn(x)) %Transpose x if it is a row vector.
        x = x';
    end
    if (size(x,1) ~= n)
        disp('ERROR: x must be a column vector of size n.');
        return;
    end

%1. Initialiaze Variables
    z = 2*x - circshift(x,[1,0]) - circshift(x,[n-1,0]);
    z(1) = z(1) + x(n);
    z(n) = z(n) + x(1);
    
    %---EXPLANATION---
    %Due to the sparsity of A then computing A*x yields the following:
    %A*x = [2x(1)-x(2),..., -x(j-1)+2x(j)-x(j+1),..., -x(n-1)+2x(n)]
    %
    %Decompose this into the following vectors:
    %A*x = 2[x(1),...,x(n)] - [x(2),...,x(n),0] - [0,x(1),...,x(n-1]
    %
    %Realize that x = [x(1),...,x(n)] and that:
    %[x(2),...,x(n),0] = [x(2),...,x(n),x(1)] - [0,...,0,x(1)]
    %[0,x(1),...,x(n-1)] = [x(n),x(1),...,x(n-1)] - [x(n),0,...,0]
    %
    %The vectors [x(2),...,x(n),x(1)] and [x(n),x(1),...,x(n-1)] are
    %merely circular permutations obtained by doing circshift(x,[1,0])
    %and circshift(x,[n-1,0]).
    %
    %Finally apply the first and last term corrections using:
    %z(1) = z(1) + x(n);
    %z(n) = z(n) + x(1);

end

