function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

z = X * theta;
h = sigmoid(z);

X0 = X(:,1);
Xn = X(:,2:columns(X));
theta_n = theta(2:rows(theta));

J = (1/m) * (-y' * log(h) - (1 - y)' * log(1 - h)) + (lambda/(2*m) * theta_n'*theta_n);

grad(1) = (1/m) * X0' * (h - y);

grad(2:rows(grad)) = ((1/m) * Xn' * (h - y)) + ((lambda/m) * theta_n);

% =============================================================

end
