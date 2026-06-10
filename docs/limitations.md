# Limitations

This project is a simplified educational simulator.

## Not a Full RPL Stack

The project is inspired by RPL routing concepts but does not implement the full RPL protocol.

Missing RPL components include:

- DIO messages
- DAO messages
- DIS messages
- Trickle timer
- DODAG versioning
- Objective Function Zero
- MRHOF
- IPv6
- 6LoWPAN
- Packet-level simulation

## No Real Packet Transmission

The simulator calculates routing paths, but it does not simulate actual packet forwarding.

It does not measure:

- Packet delivery ratio
- End-to-end delay
- Throughput
- Packet loss
- Retransmissions

## No Energy Consumption Over Time

Energy is assigned randomly at the start but does not decrease during simulation.

Future improvements could include:

- Transmission energy cost
- Receiving energy cost
- Idle energy drain
- Node death when energy reaches zero

## No Mobility

Nodes are randomly deployed once and remain fixed.

Future improvements could include mobile nodes or changing network topology.

## No Security Model

The simulator does not include attacks such as:

- Sinkhole attack
- Blackhole attack
- Rank attack
- Sybil attack

## Fixed Node Count in Simulink

The Simulink MATLAB Function block uses fixed-size arrays with 10 sensor nodes and 1 sink node for compatibility.

To support dynamic node count, the model would need variable-size signal handling.
