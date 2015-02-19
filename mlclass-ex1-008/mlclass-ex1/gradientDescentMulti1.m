function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %

    h = X * theta;
    err = (h - y);
    num_feat = columns(X);
    
    t_theta = zeros(num_feat,1);
    
    for n = 1:num_feat
    
        xj = X(:, n);
        t_theta(n) = theta(n) - (alpha * (1/m) * sum(err .* xj));

    end

    theta = t_theta;
    
    cost = computeCostMulti(X, y, theta);
    #fprintf('Computed Cost for theta = %s is J(theta) = %0.3f\n', theta, cost);

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
