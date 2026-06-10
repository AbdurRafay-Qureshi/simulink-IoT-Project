# Simulation Workflow

## Step 1: Define Network Parameters

The simulation starts with:

```text
area_width = 100
area_height = 100
num_nodes = 10
comm_range = 40
```

## Step 2: Place Sink Node

The sink node is fixed at:

```text
(50, 50)
```

The sink is the root node of the routing topology.

## Step 3: Deploy Sensor Nodes

Ten ordinary sensor nodes are randomly placed inside the 100 x 100 area.

Each node receives:

* X coordinate
* Y coordinate
* Random energy value

## Step 4: Calculate Distances

The simulator calculates Euclidean distance between every pair of nodes:

```text
d = sqrt((x2 - x1)^2 + (y2 - y1)^2)
```

## Step 5: Check Communication Range

If distance is less than or equal to communication range, the nodes are considered neighbors.

```text
if d <= comm_range
    link exists
else
    no direct link
```

## Step 6: Calculate Link Cost

For every valid link:

```text
link_cost = distance * 0.1
```

## Step 7: Calculate Rank

The sink rank is zero.

For every ordinary node:

```text
potential_rank = parent_rank + link_cost
```

The node chooses the parent that produces the lowest rank.

## Step 8: Select Parent Node

Each node stores its selected parent.

This creates a routing topology where data moves toward the sink.

## Step 9: Visualize Network

The plot shows:

* Sensor node positions
* Sink node
* Routing arrows
* Node energy
* Node rank
* Parent-child relationship
