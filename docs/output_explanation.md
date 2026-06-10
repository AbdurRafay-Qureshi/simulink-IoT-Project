# Output Explanation

The simulator generates five main outputs:

```text
X
Y
Energy
Rank
parent_node
```

## X

`X` stores the X coordinates of all nodes.

* `X(1)` is the sink node X coordinate.
* `X(2)` to `X(11)` are ordinary sensor node X coordinates.

## Y

`Y` stores the Y coordinates of all nodes.

* `Y(1)` is the sink node Y coordinate.
* `Y(2)` to `Y(11)` are ordinary sensor node Y coordinates.

## Energy

`Energy` stores the energy level of each node.

* Sink node energy is fixed at `100`.
* Ordinary sensor node energy is randomly assigned between `1` and `10`.

## Rank

`Rank` stores the calculated rank value of each node.

* Sink rank is always `0`.
* Lower rank means a better path toward the sink.
* A very large rank value means the node has no available route.

## parent_node

`parent_node` stores the selected parent for each node.

* `parent_node(i) = 1` means node `i` forwards data directly to the sink.
* `parent_node(i) = 0` means no route is available.
* `parent_node(i) = j` means node `i` forwards data to node `j`.

## BIG

The code uses:

```matlab
BIG = 1000000000;
```

This represents an unreachable link or unavailable route.

It is used instead of `inf` to avoid compatibility issues in MATLAB-like environments.

## Graph Explanation

The generated graph shows:

* The sink node as a square marker at `(50, 50)`
* Ordinary sensor nodes as circular markers
* Node energy using color
* Routing arrows from child nodes to parent nodes
* Labels showing node ID, rank, and energy

Example label:

```text
X_4 R=3.3 E=8
```

This means:

* Node ID: `X_4`
* Rank: `3.3`
* Energy: `8`

## Routing Direction

Each arrow points from a sensor node toward its selected parent.

Example:

```text
X_9 -> X_4 -> Sink
```

This means node `X_9` sends its data to `X_4`, and `X_4` forwards data to the sink.
