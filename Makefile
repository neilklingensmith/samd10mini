################################################################################
# Automatically-generated file. Do not edit!
################################################################################

RM := rm -rf

BINFILE:=outputfile.elf

OPENOCDDIR := /usr/share/openocd/
OCDCONFIG=microchip_same54_xplained_pro.cfg
ODIR=obj
SDIR=src
CFLAGS=-Isrc/
CFLAGS += -DDEBUG=2
CFLAGS+=-O0 -fno-stack-protector -ffunction-sections -fdata-sections -march=armv6-m -fvar-tracking -g3


CC=arm-none-eabi-gcc
LD=arm-none-eabi-ld
SIZE=arm-none-eabi-size


OBJS +=  \
	start.o \


OBJ = $(patsubst %,$(ODIR)/%,$(OBJS))

$(ODIR)/%.o: $(SDIR)/%.c
	$(CC) $(CFLAGS) -c -g -o $@ $^

$(ODIR)/%.o: $(SDIR)/%.s
	$(CC) $(CFLAGS) -c -o $@ $^


all: bin

bin: obj $(OBJ)
	$(CC)  $(CFLAGS) obj/*  --specs=nano.specs -Tsamd10.ld -Wl,"-u _printf_float" -Wl,--gc-sections -static -e Reset_Handler -o $(BINFILE)
	ctags -R src/*
	$(SIZE) $(BINFILE)

obj:
	mkdir -p obj

debug:
	ps aux | grep openocd | grep -v grep && { killall openocd; sleep 2; } || { echo "debugging..."; }
	screen -S openocd -d -m openocd -f $(OPENOCDDIR)/scripts/board/atmel_samd10_xplained_mini.cfg
	sleep 2
	gdb-multiarch $(BINFILE) -x gdb_init.txt



# Other Targets
clean:
	rm -rf $(BINFILE) obj/*

disassemble:
	arm-none-eabi-objdump --source $(BINFILE)

