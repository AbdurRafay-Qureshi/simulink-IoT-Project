%% WSN Deployment with Distance, Link Cost, and Rank
% Simulates a Wireless Sensor Network (WSN) with randomly deployed nodes,
% computes routing metrics, ranks nodes for data collection priority, and
% visualizes the star-topology network.
%
% Author: AbdurRafay Qureshi
% Course: IoT / Simulink Project

clc;
clear;
close all;

%% Parameters
numNodes = 20;          % Number of sensor nodes
areaSize = 100;         % Deployment area (100x100)

%% Sink Position
sink.x = areaSize/2;
sink.y = areaSize/2;

%% Generate Random Nodes
nodeX = rand(numNodes,1) * areaSize;
nodeY = rand(numNodes,1) * areaSize;

%% Calculate Distance from Sink
distance = sqrt((nodeX - sink.x).^2 + (nodeY - sink.y).^2);

%% Generate Random Link Cost
linkCost = randi([1 10], numNodes, 1);

%% Calculate Rank
rank = distance + linkCost;

%% Create Results Matrix
NodeID = (1:numNodes)';

Results = [NodeID nodeX nodeY distance linkCost rank];

%% Sort by Rank (Lower Rank = Better)
Results = sortrows(Results,6);

%% Display Results
disp(' ');
disp('NodeID      X          Y       Distance    LinkCost     Rank');
disp('-------------------------------------------------------------');
disp(Results);

%% Plot Network
figure;
hold on;
grid on;

% Sensor Nodes
scatter(nodeX,nodeY,80,'b','filled');

% Sink Node
scatter(sink.x,sink.y,200,'r','filled');

% Draw links to sink
for i = 1:numNodes
    plot([nodeX(i) sink.x],[nodeY(i) sink.y],'k--');

    % Display Node Number
    text(nodeX(i)+1,nodeY(i)+1,num2str(i));
end

legend('Sensor Nodes','Sink');
title('WSN Deployment with Distance, Link Cost and Rank');
xlabel('X Coordinate');
ylabel('Y Coordinate');

axis([0 areaSize 0 areaSize]);

hold off;
