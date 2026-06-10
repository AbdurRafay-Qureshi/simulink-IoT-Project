function plot_rpl_network(X, Y, node_energy, node_rank, parent_node, area_width, area_height)
%PLOT_RPL_NETWORK Plots the generated IoT WSN routing topology.

total_nodes = length(X);
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

% Draw routing arrows from child node to parent node
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

end
