/* main.c : Main file for scanpcap */

#include <stdio.h>
#include <stdlib.h>

/* for strdup due to C99 */
char * strdup(const char *s);

#include <string.h>

#include "pcap-read.h"

int main (int argc, char *argv[])
{ 
    if(argc < 2)
    {
        printf("Usage: redextract FileName\n");
        printf("  FileName        Single file to process (if ending with .pcap)\n");
        return -1;
    }

    /* Note that the code as provided below does only the following 
     *
     * - Reads in a single file twice
     * - Reads in the file one packet at a time
     * - Process the packets for redundancy extraction one packet at a time
     * - Displays the end results
     */

    struct FilePcapInfo     theInfo;

    theInfo.FileName = strdup(argv[1]);
    theInfo.EndianFlip = 0;
    theInfo.BytesRead = 0;
    theInfo.Packets = 0;
    theInfo.MaxPackets = 0;

    readPcapFile(&theInfo);

    /* Output the statistics */

    return 0;
}
