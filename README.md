# Round-Robin-Arbiter-in-Verilog
Description:

This design is a Verilog implementation of a 4-input Round Robin Arbiter, designed to grant access to one of four requesters (req[3:0]) in a fair, cyclic manner. The arbiter ensures that every requester gets a chance without starvation, using a rotating priority logic.

The arbiter takes:

Inputs:

clk: System clock

reset: Active-high synchronous reset

req[3:0]: Request lines from 4 devices

Output:

gnt[3:0]: Grant lines indicating which requester is currently allowed access

Internally, the arbiter maintains a pointer register (pointer) that keeps track of the last granted request. On each clock cycle, it rotates priority starting from the next requester in line, ensuring round-robin behavior.

