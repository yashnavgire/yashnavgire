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



h=X*theta;
for i=1:m
  J=J - y(i)*log(sigmoid(h(i))) - (1-y(i))*log(1-sigmoid(h(i)))
endfor

J=J/m;

for i=2:length(theta)
  J=J + theta(i)*theta(i)*lambda/(2*m);
endfor

for i=1:m
  for j=1:length(theta)
    
    if j==1
      grad(j)=grad(j) + (sigmoid(h(i)) - y(i))*X(i,j)/m;
    else
      grad(j)=grad(j) + (sigmoid(h(i)) - y(i))*X(i,j)/m + theta(j)*lambda/m;
    endif
    
  endfor
endfor




% =============================================================

end
