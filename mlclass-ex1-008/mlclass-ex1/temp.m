data = load('ex1data1.txt');
X = data(:, 1); y = data(:, 2);
m = length(y); % number of training examples

figure;
plot(X, y, 'rx', 'markersize', 2, 'LineWidth', 10);
ylabel('Profit in $10,000s');
xlabel('Population in 10,000s');

X = [ones(m, 1), data(:,1)]; % Add a column of ones to x
theta = zeros(2, 1); % initialize fitting parameters

iterations = 1500;
alpha = 0.01;

computeCost(X, y, theta)

theta = gradientDescent(X, y, theta, alpha, iterations);

fprintf('Theta found by gradient descent: ');
fprintf('%f %f \n', theta(1), theta(2));

hold on;
plot(X(:,2), X*theta, 'k-')
legend('Training data', 'Linear regression')


predict1 = [1, 3.5] *theta;
fprintf('For population = 35,000, we predict a profit of %f\n',...
    predict1*10000);
plot(3.5, predict1, 'k*')
predict2 = [1, 7] * theta;
fprintf('For population = 70,000, we predict a profit of %f\n',...
    predict2*10000);
plot(7, predict2, 'k*')

hold off;

theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace(-1, 4, 100);

% initialize J_vals to a matrix of 0's
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% Fill out J_vals
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];    
	  J_vals(i,j) = computeCost(X, y, t);
    end
end
#J_vals

figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');
