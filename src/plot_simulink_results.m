clc;
close all;

% Plot outputs generated from the Simulink model.
% This script assumes the Simulink model was run with Single Simulation Output
% enabled, so outputs are stored inside the object named "out".

if ~exist('out', 'var')
    error('No Simulink output object named "out" found. Run the Simulink model first.');
end

% Extract final simulation values.
% Simulink stores each output as 11xN because it logs values across time steps.
% We only need the final column.
X = out.X(:, end);
Y = out.Y(:, end);
node_energy = out.Energy(:, end);
node_rank = out.Rank(:, end);
parent_node = out.parent_node(:, end);

area_width = 100;
area_height = 100;
total_nodes = 11;
BIG = 1000000000;

figure('Name', 'Simulink-Based RPL IoT Network Simulator', ...
       'Color', 'w', ...
       'Position', [100 100 900 650]);

hold on;
grid on;
box on;

xlim([0 area_width]);
ylim([0 area_height]);

xlabel('X Coordinates');
ylabel('Y Coordinates');
title('Simulink-Based Rank-Based IoT WSN Routing Simulator');

% Draw arrows from each node to its selected parent
for i = 2:total_nodes

    p = parent_node(i);

    if p ~= 0
        dx = X(p) - X(i);
        dy = Y(p) - Y(i);

        quiver(X(i), Y(i), dx, dy, 0, ...
            'Color', 'b', ...
            'LineWidth', 1.5, ...
            'MaxHeadSize', 0.5);
    end
end

% Plot ordinary sensor nodes
scatter(X(2:total_nodes), Y(2:total_nodes), ...
    100, node_energy(2:total_nodes), ...
    'filled', ...
    'MarkerEdgeColor', 'k');

colormap(autumn);
c = colorbar;
ylabel(c, 'Node Energy');

% Plot sink node
plot(X(1), Y(1), 's', ...
    'MarkerSize', 14, ...
    'MarkerFaceColor', 'cyan', ...
    'MarkerEdgeColor', 'black', ...
    'LineWidth', 1.5);

text(X(1) - 5, Y(1) - 5, 'Sink (50,50)', ...
    'FontWeight', 'bold', ...
    'FontSize', 10);

% Label ordinary nodes
for i = 2:total_nodes

    if node_rank(i) >= BIG
        lbl = sprintf('X_%d NoRoute', i - 1);
    else
        lbl = sprintf('X_%d R=%.1f E=%d', ...
            i - 1, node_rank(i), node_energy(i));
    end

    text(X(i) + 2, Y(i) + 2, lbl, ...
        'FontSize', 8, ...
        'FontWeight', 'bold');
end

hold off;

% Print table
fprintf('\n================== WSN NODE DETAILS ==================\n');
fprintf('Node ID\t\tX Pos\t\tY Pos\t\tEnergy\t\tRank\t\tParent\n');

for i = 2:total_nodes

    if node_rank(i) >= BIG
        fprintf('X_%d\t\t%.1f\t\t%.1f\t\t%d\t\tNoRoute\t\tNone\n', ...
            i - 1, X(i), Y(i), node_energy(i));
    else

        if parent_node(i) == 1
            fprintf('X_%d\t\t%.1f\t\t%.1f\t\t%d\t\t%.2f\t\tSink\n', ...
                i - 1, X(i), Y(i), node_energy(i), node_rank(i));
        else
            fprintf('X_%d\t\t%.1f\t\t%.1f\t\t%d\t\t%.2f\t\tX_%d\n', ...
                i - 1, X(i), Y(i), node_energy(i), node_rank(i), parent_node(i) - 1);
        end

    end
end
