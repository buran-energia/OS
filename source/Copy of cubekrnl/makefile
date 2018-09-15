CFLAGS  += -Iinc -Iinc\printf

include ..\makerules

TARGET   = cubekrnl

all : $(TARGET).exe

ALL_LIBS = $(HAL_LIB) $(UTILS_LIB) $(KE_LIB) $(MM_LIB)
ALL_OBJS = $(HAL_OBJS) $(UTILS_OBJS) $(KE_OBJS) $(MM_OBJS)

HAL_LIB     = hal\hal.lib
UTILS_LIB   = utils\utils.lib
KE_LIB      = ke\ke.lib
MM_LIB      = mm\mm.lib

HAL_OBJS = \
	hal\hal.o \
	hal\i386\i386.o \
	hal\i386\isr.o


UTILS_OBJS = \
	utils\utils.o \
	utils\i386\printf\printf.o \
	utils\i386\printf\stdio.o \
	utils\i386\printf\stdlib.o \
	utils\i386\printf\string.o

KE_OBJS = \
	ke\ke.o \
	ke\process.o \
	ke\thread.o

MM_OBJS = \
	mm\mm.o \
	mm\i386\mmi386.o

$(HAL_LIB): $(HAL_OBJS)
	$(LD) \
              $(HAL_OBJS) \
              -r -o $@

$(UTILS_LIB): $(UTILS_OBJS)
	$(LD) \
              $(UTILS_OBJS) \
              -r -o $@

$(KE_LIB): $(KE_OBJS)
	$(LD) \
              $(KE_OBJS) \
              -r -o $@

$(MM_LIB): $(MM_OBJS)
	$(LD) \
              $(MM_OBJS) \
              -r -o $@

$(TARGET).exe : $(ALL_LIBS)
	$(LD) \
              -nostartfiles \
              -nostdlib \
              $(ALL_LIBS) \
              -T $(TARGET).ld \
              -o $(TARGET).exe \
              --entry _HALSetup \
              --subsystem native \
              --image-base 0xC0100000 \
              --section-alignment 0x1000 \
              --file-alignment 4
              
	objdump -ld $(TARGET).exe > cubekrnl.asm

	$(CP) $(TARGET).exe $(CUBEPATH)\bin\

	-$(MTOOLS) -c mdel $@
	$(MTOOLS) -c mcopy $@ a:\$@

clean:
	$(RM) \
          $(ALL_LIBS) \
          $(ALL_OBJS) \
          $(TARGET).exe \
          $(TARGET).exp \
          $(TARGET).lib

.PHONY : clean
