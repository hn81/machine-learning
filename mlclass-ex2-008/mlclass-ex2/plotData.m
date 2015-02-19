function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

  posRows = find(y==1);
  negRows = find(y==0);

  plot (X(posRows, 1), X(posRows, 2), 'k+', 'linewidth', 5, 'markersize', 3);
  plot (X(negRows, 1), X(negRows, 2), 'ko', 'markerfacecolor', 'y', 'markersize', 3);
  
% =========================================================================


hold off;

end
