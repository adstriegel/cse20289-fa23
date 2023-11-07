//  Go Irish client
#include <zmq.h>
#include <string.h>
#include <stdio.h>
#include <unistd.h>

#define ZMQ_SERVER_PORT 40000

int main (void)
{
    printf ("Connecting to go irish server...\n");
    void *context = zmq_ctx_new ();
    void *requester = zmq_socket (context, ZMQ_REQ);
    zmq_connect (requester, "tcp://localhost:ZMQ_SERVER_PORT");

    int request_nbr;
    for (request_nbr = 0; request_nbr != 10; request_nbr++) {
        char buffer [10];
        printf ("Sending go %d...\n", request_nbr);
        zmq_send (requester, "go", 2, 0);
        zmq_recv (requester, buffer, 10, 0);
        printf ("Received irish %d\n", request_nbr);
    }
    zmq_close (requester);
    zmq_ctx_destroy (context);
    return 0;
}
