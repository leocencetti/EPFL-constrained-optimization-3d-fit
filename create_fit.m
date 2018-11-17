function [fitresult, gof] = create_fit(f, v, X, W, dp)
%% INFO
% f       frequecy
% v       velocity
% X       data points
% dp      logical, display datapoints on graphs

% % 
[xData, yData, zData, weights] = prepareSurfaceData( f, v, X, W );

% Options
ft = 'linearinterp';
opts = fitoptions( 'Method', 'SmoothingSpline' );
opts.Normalize = 'on';
opts.Weights = weights;

% Fit model
[fitresult, gof] = fit( [xData, yData], zData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Economy of transport' );
if dp 
    plot( fitresult, [xData, yData], zData );
else
    plot( fitresult );
end

% Label axes
xlabel('Frequency')
ylabel('Velocity')
zlabel('Economy')
grid on
view( -16.3, 6.8 );

% Make contour plot.
figure( 'Name', 'Isolines' );
if dp 
    plot( fitresult, [xData, yData], zData, 'Style', 'Contour' );
else
    plot( fitresult, 'Style', 'Contour' );
end

% Label axes
xlabel('Frequency')
ylabel('Velocity')
grid on
end


