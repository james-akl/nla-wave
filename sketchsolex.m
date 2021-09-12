%--------------------------------------------------
% H  E  A  D  E  R
%--------------------------------------------------
% AUTHOR    | JAMES AKL
%--------------------------------------------------

%--------------------------------------------------
% B  O  D  Y
%--------------------------------------------------
function sketchsolex(np,t)

%0. Description
    %Plots for a fixed "t", the graphic representation of 
    %the function x ? u_ex (x,t) for all x in [0,1].
    %np is the TOTAL number of points of the uniform subdivision 
    %of the segment [0,1], including both interior and boundary points.

    %User-Input Error-Handling.
    if (np <= 0 || isinf(np) || floor(np) ~= np || ~isreal(np))
       disp('ERROR: n must be a strictly positive integer.');
       return;
    end
    if (~isscalar(t) || ~isreal(t) || t < 0 )
       disp('ERROR: t must be a nonnegative real scalar.');
       return;
    end
    
%1. Initialiaze Variables
    
    n = np-2;        %Number of interior points of [0,1].
    x = 0:1/(n+1):1; %Discretization of [0,1] including 0 and 1.
    y = solex(x,t);  %Compute the exact solution at "t" for every "x".
    
%2. Solution Plot
    X = x;                  %Plot X-values.
    Y = y;                  %Plot Y-values.
    figure
    plot(X,Y);
    title('Exact Solution u_{ex} at time t');
    xlabel('Position x');
    ylabel('Displacement u_{ex}(x,t)');
    
end