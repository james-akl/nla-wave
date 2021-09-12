%--------------------------------------------------
% H  E  A  D  E  R
%--------------------------------------------------
% AUTHOR    | JAMES AKL
%--------------------------------------------------

%--------------------------------------------------
% B  O  D  Y
%--------------------------------------------------
function study(T)

%0. Description
    %Plots in Log-Log the curve ln(n) ? ln(e(n)) where e(n) is the error. 
    %n are consecutive powers of 2, and M is guaranteed sufficiently big
    %by taking M = ceil(1.5*c*T*(n+1)+100) > c*T*(n+1) thereby strictly
    %satisfying the CFL condition and guarateeing convergence.
    %T is restricted to ]0,0.05].

    %User-Input Error-Handling.
    if (~isscalar(T) || T <= 0 || T > 0.05 || ~isreal(T))
       disp('ERROR: T in ]0,0.05] must be a strictly positive real scalar.');
       return;
    end
    
%1. Initialiaze Variables
    c = 10;                 %c = 10 taken as earlier.
    initpos = @exinitpos;   %exinitpos taken as earlier.
    initvel = @exinitvel;   %exinitvel taken as earlier.
    kfin = 15;              %k = 1,...,15 are powers for n = 2^k.
    e = zeros(kfin,1);      %Error vector.
    X = zeros(kfin,1);      %X-axis vector.
    Y = zeros(kfin,1);      %Y-axis vector.
    
    for k = 1:kfin
        n = 2^k;            %n = 2^1,...,2^15.
        M = ceil(1.5*c*T*(n+1)+100);
        h = 1/(n+1);        %Space step using n = 2^k.
        x = h:h:(1-h);      %Interior points using n = 2^k.
        U = solverope_noplot(c,n,initpos,initvel,M,T); %Numerical solution.
        Uex = solex(x,T);   %Exact solution.
        e(k) = norm(U - Uex, Inf); %Error using sup-norm.
        X(k) = log(n);      %Log-Log Plot X-values.
        Y(k) = log(e(k));   %Log-Log Plot Y-values.
    end
    
%2. Log-Log Plot
    figure
    plot(X,Y);
    title('Log-Log Plot of the Error versus Input');
    xlabel('ln(n) = k ln(2)');
    ylabel('ln e(n)');
    
    COEF = polyfit(X,Y,1);  %Coefficients of the least-squares line.
    coef = COEF(1);         %Slope of the least-squares line.
    
    disp(['The slope of the least-squares line is: coef = ',num2str(coef)]);
    disp('The slope approaches -2 as n grows larger.');
end