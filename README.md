# EP4CE6 LED Button Controller

VHDL design for the EP4CE6E22C8N Cyclone IV E FPGA board.

## Functions

- `BUTTONS(0..3)` control `LEDS(0..3)` respectively.
- `LEDS(4)` is a 1 Hz heartbeat LED.
- `nRST` is an active-low asynchronous reset.

The design assumes active-low buttons and LEDs by default.

## Pin Assignments

| Signal | Pin |
| --- | --- |
| `LEDS[0]` | `PIN_1` |
| `LEDS[1]` | `PIN_2` |
| `LEDS[2]` | `PIN_3` |
| `LEDS[3]` | `PIN_7` |
| `LEDS[4]` | `PIN_11` |
| `BUTTONS[3]` | `PIN_73` |
| `BUTTONS[2]` | `PIN_80` |
| `BUTTONS[1]` | `PIN_89` |
| `BUTTONS[0]` | `PIN_114` |
| `nRST` | `PIN_88` |
| `clk` | `PIN_24` |

## Build and Program

Quartus Prime Lite 18.1 is expected at `/home/lincoln/intelFPGA_lite/18.1` by default.

```bash
make
make program
make clean
```

Override the installation path when needed:

```bash
make QUARTUS_ROOT=/path/to/intelFPGA_lite/18.1
```
