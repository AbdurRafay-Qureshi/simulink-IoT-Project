# Simulink Model Setup Guide

This guide explains how to manually create the Simulink model for the project.

## Model Name

Save the Simulink model as:

```text
RPL_IoT_Network_Simulator.slx
```

## Required Simulink Blocks

The model uses:

* 3 Constant blocks
* 1 MATLAB Function block
* 5 To Workspace blocks

## Step 1: Add Constant Blocks

Add three Constant blocks and set their values:

| Block Name | Value |
| ---------- | ----: |
| `width`    | `100` |
| `height`   | `100` |
| `range`    |  `40` |

These represent:

* Simulation area width
* Simulation area height
* Communication range

## Step 2: Add MATLAB Function Block

Add a MATLAB Function block and rename it:

```text
rpl_sim
```

Open the block and paste the code from:

```text
src/simulink_function_block_code.m
```

The MATLAB Function block should have 3 inputs:

```text
area_width
area_height
comm_range
```

and 5 outputs:

```text
X
Y
node_energy
node_rank
parent_node
```

## Step 3: Connect Constant Blocks

Connect:

```text
width  -> area_width
height -> area_height
range  -> comm_range
```

## Step 4: Add To Workspace Blocks

Add five To Workspace blocks.

Connect outputs like this:

| MATLAB Function Output | To Workspace Variable Name |
| ---------------------- | -------------------------- |
| `X`                    | `X`                        |
| `Y`                    | `Y`                        |
| `node_energy`          | `Energy`                   |
| `node_rank`            | `Rank`                     |
| `parent_node`          | `parent_node`              |

The tested MATLAB Online output object showed:

```text
out.Energy
out.Rank
out.X
out.Y
out.parent_node
```

Each output was stored as an `11xN double` matrix because Simulink logged values over multiple time steps.

The final values are extracted using:

```matlab
X = out.X(:, end);
Y = out.Y(:, end);
node_energy = out.Energy(:, end);
node_rank = out.Rank(:, end);
parent_node = out.parent_node(:, end);
```

## Step 5: Simulation Settings

Set stop time to:

```text
1
```

The model performs one routing calculation. It does not need a long time simulation.

## Step 6: Run the Model

Click **Run**.

Then in MATLAB command window, type:

```matlab
whos
```

You should see:

```text
out    1x1    Simulink.SimulationOutput
```

Then type:

```matlab
out
```

Expected output fields:

```text
Energy       [11xN double]
Rank         [11xN double]
X            [11xN double]
Y            [11xN double]
parent_node  [11xN double]
tout         [Nx1 double]
```

## Step 7: Plot Results

Run:

```matlab
plot_simulink_results
```

This will generate:

* Network graph
* Sink node
* Sensor nodes
* Routing arrows
* Node rank labels
* Energy colorbar
* Command window table
