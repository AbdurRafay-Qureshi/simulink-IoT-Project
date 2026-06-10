# Simulink Block Diagram Description

The Simulink model represents a simplified IoT Wireless Sensor Network routing simulator.

## Block-Level Flow

```text
Constant: width = 100
Constant: height = 100
Constant: range = 40
        |
        v
MATLAB Function Block: rpl_sim
        |
        v
To Workspace Blocks:
- X
- Y
- Energy
- Rank
- parent_node
        |
        v
MATLAB Script:
plot_simulink_results.m
```

## Constant Blocks

The constant blocks provide fixed simulation parameters.

### width

Defines the width of the simulation area.

```text
width = 100
```

### height

Defines the height of the simulation area.

```text
height = 100
```

### range

Defines the maximum communication range between two nodes.

```text
range = 40
```

## MATLAB Function Block

The MATLAB Function block contains the main routing algorithm.

It performs:

1. Sink node placement
2. Random sensor node deployment
3. Random energy assignment
4. Distance calculation
5. Neighbor detection
6. Link cost calculation
7. Rank calculation
8. Parent node selection

## To Workspace Blocks

The To Workspace blocks export simulation results from Simulink to MATLAB.

The exported variables are:

| Variable      | Meaning                      |
| ------------- | ---------------------------- |
| `X`           | X coordinates of all nodes   |
| `Y`           | Y coordinates of all nodes   |
| `Energy`      | Energy level of each node    |
| `Rank`        | Calculated rank of each node |
| `parent_node` | Selected parent of each node |

## Plot Script

The plot script reads values from the Simulink output object `out`, extracts the final simulation column, and generates the network graph.
