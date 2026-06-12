# 12-Hour Digital Clock using Verilog HDL on Basys 3 FPGA

## Overview

This project implements a 12-hour digital clock using Verilog HDL on the Basys 3 FPGA board. The clock displays hours and minutes on the onboard 4-digit seven-segment display and uses an LED to indicate AM/PM status.

## Features

* 12-hour clock format
* Hours, Minutes, and Seconds counting
* AM/PM indication
* 1 Hz clock generation from 100 MHz FPGA clock
* Seven-segment display multiplexing
* Modular RTL design
* FPGA implementation using Vivado

---

## Project Structure

```text
.
├── top.v
├── clk_divider.v
├── clk_module_12_hr.v
├── seven_seg_decoder.v
├── display_mux_4_seg.v
├── Basys3.xdc
└── tb_clock_12hr.v
```

---

## Module Description

### clk_divider

Generates a 1 Hz clock from the 100 MHz onboard clock.

Input:

* clk
* reset

Output:

* clk_1hz

---

### clk_module_12_hr

Implements the 12-hour clock logic.

Input:

* clk_1hz
* reset

Output:

* hr
* min
* sec
* pm

Time format:

```text
HH:MM:SS
12-hour format
```

---

### seven_seg_decoder

Converts a BCD digit into a seven-segment pattern.

Input:

* digit[3:0]

Output:

* seg[6:0]

---

### display_mux_4_seg

Multiplexes the Basys 3 four-digit display.

Display format:

```text
HHMM
```

Example:

```text
12:34
```

Displayed as:

```text
AN3 AN2 AN1 AN0

 1   2   3   4
```

---

## FPGA Board

Board:

* Digilent Basys 3

FPGA:

* Xilinx Artix-7 XC7A35T

Clock:

* 100 MHz

---

## Simulation

The clock can be verified through simulation by observing:

```text
11:59:58 AM
11:59:59 AM
12:00:00 PM
12:00:01 PM
```

and

```text
11:59:58 PM
11:59:59 PM
12:00:00 AM
12:00:01 AM
```

---

## Build Flow

1. Create RTL Project in Vivado
2. Add all Verilog source files
3. Add Basys3.xdc constraints
4. Run Synthesis
5. Run Implementation
6. Generate Bitstream
7. Program FPGA

---

## Author

Sai Sanjay

RTL Design Project
Verilog HDL
Basys 3 FPGA
