%--------------------------------------------------
% H  E  A  D  E  R
%--------------------------------------------------
% AUTHOR    | JAMES AKL
%--------------------------------------------------

%--------------------------------------------------
% B  O  D  Y
%--------------------------------------------------
function U = solverope_noplot(c,n,initpos,initvel,M,T)

%0. Description
    %Computes the numerical solution vector U at the time T using a 
    %time-step Dt = T/M and a space-step h = 1/(n+1).
    %Does NOT plot the approached solution U at the time T.
    %For plotting, use "solverope.m".
    %n is the number of interior points.
    %initpos and initvel are arbitrary functions defining V and W.

    %User-Input Error-Handling.
    if (n <= 0 || isinf(n) || floor(n) ~= n || ~isreal(n))
       disp('ERROR: n must be a strictly positive integer.');
       return;
    end
    if (~isscalar(T) || T <= 0 || ~isreal(T))
       disp('ERROR: T must be a strictly positive real scalar.');
       return;
    end
    if (~isscalar(M) || M <= 0 || ~isreal(M) || floor(M) ~= M)
       disp('ERROR: M must be a strictly positive integer.');
       return;
    end
    if (~isscalar(c) || c <= 0 || ~isreal(c))
       disp('ERROR: c must be a strictly positive real scalar.');
       return;
    end
    
%1. Initialiaze Variables
    
    Dt = T/M;               %Time-step.
    h = 1/(n+1);            %Space-step.
    lambda = (c*Dt/h)^2;    %Lambda as in the method.
    
    x = h:h:(1-h);          %Discretization of ]0,1[.
    
    V = initpos(x);         %Initial position vector.
    W = initvel(x);         %Initial velocity vector.
    
    U0 = V;                 %U0 is U_(j-1) & U1 is U_(j) at each iteration.
    U1 = V - (lambda/2)*prodmatvec(V,n) + Dt*W;
    
%2. Iterative Method

    if (M == 0)             %Trivial case.
        U = U0;
        return;
    elseif (M == 1)         %Trivial case.
        U = U1;
        return;
    end
    
    for k = 2:M             %Case M >= 2.
        %Perform circular assignments with the following scheme:
        %U = U_(j+1), U1 = U_j, U0 = U_(j-1).
        U = 2*U1 - lambda*prodmatvec(U1,n) - U0;
        U0 = U1;
        U1 = U; 
    end
    
%3. Solution Plot
%    X = x;                  %Plot X-values.
%    Y = U;                  %Plot Y-values.
%    figure
%    plot(X,Y);
%    title('Approached Solution U at time T');
%    xlabel('Position x');
%    ylabel('Displacement U(x,T)');
    
end