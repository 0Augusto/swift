/*
Neste código, utilizamos a biblioteca pthread.h para criar as threads. A função performTask representa a tarefa que será executada por cada thread. A função main cria as threads e aguarda sua conclusão utilizando a função pthread_join. Assim, garantimos que todas as tarefas serão concluídas antes de imprimir a mensagem "Todas as tarefas foram concluídas".
*/
#include <stdio.h>
#include <pthread.h>

#define NUMBER_OF_THREADS 1000

void *performTask(void *arg) {
    int index = *((int *)arg);
    printf("Iniciando tarefa %d\n", index);
    
    // Lógica da tarefa a ser executada
    for (int i = 1; i <= 5; i++) {
        printf("Tarefa %d: Executando passo %d\n", index, i);
        // Simulação de processamento
        for (int j = 0; j < 1000000; j++) { }
    }
    
    printf("Concluindo tarefa %d\n", index);
    return NULL;
}

int main() {
    pthread_t threads[NUMBER_OF_THREADS];
    int threadArgs[NUMBER_OF_THREADS];

    for (int i = 0; i < NUMBER_OF_THREADS; i++) {
        threadArgs[i] = i;
        int result = pthread_create(&threads[i], NULL, performTask, (void *)&threadArgs[i]);
        if (result != 0) {
            printf("Falha ao criar a thread %d\n", i);
            return 1;
        }
    }

    // Aguarda a conclusão de todas as threads
    for (int i = 0; i < NUMBER_OF_THREADS; i++) {
        pthread_join(threads[i], NULL);
    }

    printf("Todas as tarefas foram concluídas\n");
    return 0;
}

