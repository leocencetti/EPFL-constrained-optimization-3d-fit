function [X, W] = prepare_data(x, w)

values = x(x ~= 0);
min_value = min(values);
max_value = max(values);
X = 0.5 * (max_value - x) / (max_value - min_value);
w(w == 0) = NaN;
W = w;
end