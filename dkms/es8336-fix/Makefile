obj-m += snd-soc-sof_es8336.o
snd-soc-sof_es8336-y := sof_es8336.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
