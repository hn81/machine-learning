# Ensure the present working directory is set correctly to the 
# one that contains all the .m files and .txt files

# Read data from the file
data = load('ex1data2.txt');

# Assign the features and y values
x = data(:,1:2);
y = data(:,3);

# Normalize the features
[x mu sigma] = featureNormalize(x);
m = rows(y);

# Add x0 to the feature matrix
x = [ones(m,1), x];

# Initialize theta to zeros
theta = zeros(3,1);

alpha1 = 0.00275;
alpha2 = 0.00278;
alpha3 = 0.00281;
alpha4 = 0.00284;
iter = 500;

# Invoke Gradient Descent for different alpha (learning rate) 
# and constant iteration values
[theta1, J_history1] = gradientDescentMulti(x, y, theta, alpha1, iter);
[theta2, J_history2] = gradientDescentMulti(x, y, theta, alpha2, iter);
[theta3, J_history3] = gradientDescentMulti(x, y, theta, alpha3, iter);
[theta4, J_history4] = gradientDescentMulti(x, y, theta, alpha4, iter);

# Plot the J(theta) for various learning rates on the same graph
# using different colors for each plot
figure;
plot(1:numel(J_history1), J_history1, '-b', 'LineWidth', 2)
xlabel('Number of iterations');
ylabel('Cost J');
hold on; % keep the focus on the same graph
plot(1:numel(J_history2), J_history2, '-r', 'LineWidth', 2)
plot(1:numel(J_history3), J_history3, '-k', 'LineWidth', 2)
plot(1:numel(J_history4), J_history4, '-g', 'LineWidth', 2)
hold off;

# Calculate the cost for 1650 sq.ft and 3 bedroom house using various 
# theta(1/2/3/4) values calculated in previous steps
X = [1650, 3];
[X MU SIG] = featureNormalize(X);
X = [1, X];

# Store the house prices
h1 = X * theta1;
h2 = X * theta2;
h3 = X * theta3;
h4 = X * theta4;

# Print the price of the house
printf('Price of the sample house with size 1650 sq.ft and 3 bedroom\n');
printf('For alpha value %f, Price = %0.2f\n', alpha1, h1);
printf('For alpha value %f, Price = %0.2f\n', alpha2, h2);
printf('For alpha value %f, Price = %0.2f\n', alpha3, h3);
printf('For alpha value %f, Price = %0.2f\n', alpha4, h4); 

