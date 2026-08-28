PROJECT := ep4ce6_led_blink
QUARTUS_ROOT ?= /home/lincoln/intelFPGA_lite/18.1
QUARTUS_SH := $(QUARTUS_ROOT)/quartus/bin/quartus_sh
QUARTUS_PGM := $(QUARTUS_ROOT)/quartus/bin/quartus_pgm
SOF := $(PROJECT).sof

.PHONY: all compile program clean

all: compile

compile: $(SOF)

$(SOF): $(PROJECT).qpf $(PROJECT).qsf $(PROJECT).vhd $(PROJECT).sdc
	$(QUARTUS_SH) --flow compile $(PROJECT)

program: $(SOF)
	$(QUARTUS_PGM) -m jtag -o "p;$(SOF)"

clean:
	rm -rf db incremental_db
	rm -f *.rpt *.summary *.sof *.pof *.done *.jdi *.pin *.sld *.qws *.chg *.qdf work-obj*.cf
