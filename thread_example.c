#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

void* print_message(void* thread_id) {
    long tid;
    tid = (long)thread_id;
    printf("Hello from thread %ld!\n", tid);
    pthread_exit(NULL);
}

int main() {
    pthread_t threads[5];
    int rc;
    long t;
    
    for (t = 0; t < 5; t++) {
        printf("In main: creating thread %ld\n", t);
        rc = pthread_create(&threads[t], NULL, print_message, (void*)t);
        if (rc) {
            printf("ERROR; return code from pthread_create() is %d\n", rc);
            exit(-1);
        }
    }

    /* Last thing that main() should do */
    pthread_exit(NULL);
}
