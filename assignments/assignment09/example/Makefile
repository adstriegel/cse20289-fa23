all: scanpcap

clean: 
	rm scanpcap
	rm *.o

scanpcap: packet.c packet.h pcap-read.c pcap-read.h main.c
	gcc packet.c pcap-read.c main.c -Wall --std=c99 -lpthread -lm -o scanpcap