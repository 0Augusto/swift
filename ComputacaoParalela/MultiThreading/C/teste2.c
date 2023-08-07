/*
Neste código, foram utilizadas threads em C para executar as tarefas simultaneamente. Cada thread executa a função performTask, que representa a lógica da tarefa a ser realizada. Para evitar conflitos de acesso a recursos compartilhados, não há necessidade de uma fila serial do GCD (como na versão original em Swift) porque as threads já possuem paralelismo e compartilham a carga de processamento. O número de threads criadas é igual ao número de tarefas desejado.

Note que a simulação de processamento é realizada com um loop simples, como na versão original, para criar um atraso significativo e permitir que outras threads também sejam executadas em paralelo.

Essa abordagem com threads em C é mais eficiente do que a versão original em Swift com uma fila serial, uma vez que aproveita melhor os recursos do sistema operacional e permite uma execução real paralela.
*/
#include <stdio.h>
#include <pthread.h>

// Estrutura para armazenar os argumentos das tarefas
typedef struct {
    int index; // Índice da tarefa
} TaskArgs;

// Função que representa a tarefa a ser executada
void *performTask(void *arg) {
    TaskArgs *args = (TaskArgs *)arg;
    int index = args->index;
    printf("Iniciando tarefa %d\n", index);
    
    // Lógica da tarefa a ser executada
    for (int i = 1; i <= 5; i++) {
        printf("Tarefa %d: Executando passo %d\n", index, i);
        // Simulação de processamento
        for (int j = 0; j < 1000000; j++) {}
    }
    
    printf("Concluindo tarefa %d\n", index);
    return NULL;
}

#define NUMBER_OF_TASKS 1000 // Número de tarefas desejado

int main() {
    pthread_t threads[NUMBER_OF_TASKS]; // Vetor de threads para as tarefas
    TaskArgs taskArgs[NUMBER_OF_TASKS]; // Vetor para os argumentos das tarefas

    // Criação das threads para as tarefas
    for (int i = 0; i < NUMBER_OF_TASKS; i++) {
        taskArgs[i].index = i;
        pthread_create(&threads[i], NULL, performTask, (void *)&taskArgs[i]);
    }

    // Aguarda a conclusão de todas as tarefas
    for (int i = 0; i < NUMBER_OF_TASKS; i++) {
        pthread_join(threads[i], NULL);
    }

    printf("Todas as tarefas foram concluídas\n");
    return 0;
}


