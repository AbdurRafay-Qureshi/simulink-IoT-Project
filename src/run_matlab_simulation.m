clear;
clc;
close all;

% Simulink-Based RPL-Inspired IoT WSN Routing Simulator
% MATLAB script version for direct testing without Simulink.

area_width = 100;
area_height = 100;
num_nodes = 10;
comm_range = 40;

[X, Y, node_energy, node_rank, parent_node, distances] = rpl_routing_core(area_width, area_height, num_nodes, comm_range);

fprintf('\n================== WSN NODE DETAILS ==================\n');
fprintf('Node ID\t\tX Pos\t\tY Pos\t\tEnergy\t\tRank\t\tParent\n');

BIG = 1000000000;
total_nodes = num_nodes + 1;

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

plot_rpl_network(X, Y, node_energy, node_rank, parent_node, area_width, area_height);
