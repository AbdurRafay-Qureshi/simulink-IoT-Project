function [X, Y, node_energy, node_rank, parent_node, distances] = rpl_routing_core(area_width, area_height, num_nodes, comm_range)
%RPL_ROUTING_CORE Core logic for RPL-inspired IoT WSN routing simulation.
%
% This function deploys sensor nodes randomly, places a sink node at the
% center, calculates communication links using Euclidean distance, computes
% rank values using distance-based link cost, and selects parent nodes for
% forwarding data toward the sink.
%
% This is a simplified RPL-inspired simulation, not a full RPL protocol
% implementation.

BIG = 1000000000;

sink_x = 50;
sink_y = 50;

total_nodes = num_nodes + 1;

X = zeros(total_nodes, 1);
Y = zeros(total_nodes, 1);
node_energy = zeros(total_nodes, 1);
node_rank = zeros(total_nodes, 1);
parent_node = zeros(total_nodes, 1);
distances = zeros(total_nodes, total_nodes);

% Sink node is always index 1
X(1) = sink_x;
Y(1) = sink_y;
node_energy(1) = 100;

% Random deployment of ordinary sensor nodes
for i = 2:total_nodes
    X(i) = rand() * area_width;
    Y(i) = rand() * area_height;
    node_energy(i) = floor(rand() * 10) + 1;
end

% Initialize all links as unreachable
for i = 1:total_nodes
    for j = 1:total_nodes
        distances(i, j) = BIG;
    end
end

% Calculate communication links
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

% RPL-inspired rank calculation and parent selection
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
