# Project Scope

## Project Title

**Simulink-Based RPL-Inspired IoT Wireless Sensor Network Routing Simulator**

## Scope

This project simulates a simplified RPL-inspired routing mechanism for an IoT Wireless Sensor Network.

The system randomly deploys sensor nodes in a 100 x 100 simulation area and places a sink node at the center coordinate `(50, 50)`. Each sensor node is assigned a random energy value. The simulator calculates the distance between nodes using the Euclidean distance formula and checks whether two nodes are within communication range.

If two nodes are within communication range, a link is created. A distance-based link cost is calculated, and each node computes its rank using the formula:

```text
Node Rank = Parent Rank + Link Cost
```

The sink has rank zero. Each ordinary node selects the parent that gives the lowest rank path toward the sink.

## Main Features

* Random IoT sensor node deployment
* Fixed sink node placement
* Energy assignment for each sensor node
* Euclidean distance calculation
* Communication range checking
* Distance-based link cost calculation
* Rank calculation
* Parent node selection
* Multi-hop routing path formation
* Simulink-based implementation using MATLAB Function block
* MATLAB visualization of routing graph

## What the Project Demonstrates

This project demonstrates the basic idea behind rank-based routing in IoT networks. Nodes do not all need to communicate directly with the sink. Instead, a node can forward data through another node if that path gives a better rank.

Example:

```text
X_6 -> X_2 -> Sink
```

This represents multi-hop routing toward the sink.

## What the Project Does Not Include

This project does not implement the complete RPL protocol.

It does not include:

* Real DIO messages
* DAO messages
* DIS messages
* Trickle timer
* IPv6
* 6LoWPAN
* Packet loss
* Latency
* Throughput
* Node mobility
* Real sensor hardware
* Full Contiki/Cooja behavior
* Security attacks
* Real network stack implementation

## Correct Technical Description

This is a simplified RPL-inspired rank-based IoT Wireless Sensor Network routing simulator.
