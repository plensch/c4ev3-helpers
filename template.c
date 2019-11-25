#include <pthread.h>
#include "ev3.h"

void* stop () 
{
    while (ButtonIsUp(BTNEXIT)) 
    {
	continue;
    }

    FreeEV3();
    exit(0); 

    return NULL;
}

int main(void)
{
	// variables
    
	InitEV3();

   	 // start exit thread
    	pthread_t thread_exit;
    	pthread_create(&thread_exit, NULL, stop, NULL);

	// code
	
	FreeEV3();
	return 0;
}
