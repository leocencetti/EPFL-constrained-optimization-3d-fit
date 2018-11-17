%
% Constrained optimization in human walking
% Course: Legged robots at EPFL
% Created by: Leonardo Cencetti and Darko Lukic
%

clc
close all

%% DATA
data = csvread('samples.csv', 1);

v = sort(unique(data(:, 1)))';
f = sort(unique(data(:, 2)))';
X = zeros(length(v), length(f));

for i=1:length(v)
    for j=1:length(f)
        row_select = data(:, 1) == v(i) & data(:, 2) == f(j);
        if sum(row_select) > 0
            X(i, j) = data(row_select, 3);
        end
    end
end

% X = flip(X); % Check this one, I think this was the reason the previous
% solution was giving a wrong results

W = double(X > 0);

%% PREPARE DATA

[X, W] = prepare_data(X, W);

%% FIT

create_fit(f, v, X, W, 0)
