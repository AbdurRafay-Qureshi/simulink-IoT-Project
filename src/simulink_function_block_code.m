function [X, Y, node_energy, node_rank, parent_node] = rpl_sim(area_width, area_height, comm_range)
%RPL_SIM MATLAB Function Block code for Simulink.
%
% Paste this function inside a Simulink MATLAB Function block.
%
% Inputs:
% area_width  = width of simulation area
% area_height = height of simulation area
% comm_range  = communication range threshold
%
% Outputs:
% X           = X coordinates of sink and sensor nodes
% Y           = Y coordinates of sink and sensor nodes
% node_energy = energy values of sink and sensor nodes
% node_rank   = calculated rank values
% parent_node = selected parent node index
%
% This is a fixed-size version for Simulink compatibility.

num_nodes = 10;
total_nodes = 11;
BIG = 1000000000;

sink_x = 50;
sink_y = 50;

X = zeros(total_nodes, 1);
Y = zeros(total_nodes, 1);
node_energy = zeros(total_nodes, 1);
node_rank = zeros(total_nodes, 1);
parent_node = zeros(total_nodes, 1);
distances = zeros(total_nodes, total_nodes);

% Sink node at index 1
X(1) = sink_x;
Y(1) = sink_y;
node_energy(1) = 100;

% Random deployment of ordinary sensor nodes
for i = 2:total_nodes
    X(i) = rand() * area_width;
    Y(i) = rand() * area_height;
    node_energy(i) = floor(rand() * 10) + 1;
end

% Initialize all distances as unreachable
for i = 1:total_nodes
    for j = 1:total_nodes
        distances(i, j) = BIG;
    end
end

% Calculate Euclidean distance between nodes
for i = 1:total_nodes
    for j = 1:total_nodes
        if i ~= j
            d = sqrt((X(i) - X(j))^2 + (Y(i) - Y(j))^2);

            if d <= comm_range
                distances(i, j) = d;
            end
        end
    end
end

% Initialize ranks and parent nodes
for i = 1:total_nodes
    node_rank(i) = BIG;
    parent_node(i) = 0;
end

% Sink rank is zero
node_rank(1) = 0;

% RPL-inspired rank calculation
for iteration = 1:total_nodes
    for i = 2:total_nodes
        for j = 1:total_nodes

            if distances(i, j) ~= BIG && node_rank(j) ~= BIG

                link_cost = distances(i, j) * 0.1;
                potential_rank = node_rank(j) + link_cost;

                if potential_rank < node_rank(i)
                    node_rank(i) = potential_rank;
                    parent_node(i) = j;
                end
            end
        end
    end
end

end
