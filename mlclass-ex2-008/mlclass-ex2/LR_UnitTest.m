# Ensure the present working directory is set correctly to the 
# one that contains all the .m files and .txt files

# Read data from the file

data = load('ex2data1.txt');

# Assign the features and y values
X = data(:,1:2);
y = data(:,3);

[m, n] = size(X);

X = [ones(m, 1) X]; %Add the x0 feature set to 1

initial_theta = zeros(n+1, 1);
initial_theta

%Compute the Cost and Gradient
[cost, grad] = costFunction(initial_theta, X, y);


fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf('Gradient at initial theta (zeros): \n');
fprintf(' %f \n', grad);

