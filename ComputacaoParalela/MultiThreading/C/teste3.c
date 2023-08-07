/*
Nesse código em C, criamos threads para simular a execução de tarefas em paralelo. No entanto, o código ainda não garante que cada tarefa seja executada em um núcleo específico. Para fazer isso, é necessário utilizar funções e bibliotecas específicas do sistema operacional para definir a afinidade da thread a um núcleo específico, o que pode variar dependendo do sistema operacional utilizado.
*/

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

// Estrutura para armazenar os argumentos da tarefa
typedef struct {
    int index;
} TaskArgs;

// Função que simula a execução de uma tarefa
void* performTask(void* args) {
    TaskArgs* taskArgs = (TaskArgs*)args;
    int index = taskArgs->index;
    printf("Iniciando tarefa %d\n", index);
    
    // Lógica da tarefa a ser executada
    for (int i = 1; i <= 5; i++) {
        printf("Tarefa %d: Executando passo %d\n", index, i);
        // Simulação de processamento
        for (int j = 0; j < 1000000; j++) { }
    }
    
    printf("Concluindo tarefa %d\n", index);
    free(args);
    return NULL;
}

int main() {
    int numberOfTasks = 1000; // Número de tarefas desejado
    int numberOfCores = 6;    // Número de núcleos desejado

    // Calculando quantas tarefas serão executadas por núcleo
    int tasksPerCore = numberOfTasks / numberOfCores;

    pthread_t threads[numberOfTasks];
    
    for (int coreIndex = 0; coreIndex < numberOfCores; coreIndex++) {
        for (int taskIndex = coreIndex * tasksPerCore; taskIndex < (coreIndex + 1) * tasksPerCore; taskIndex++) {
            // Verificando se ainda existem tarefas a serem adicionadas para evitar um índice fora dos limites
            if (taskIndex >= numberOfTasks) {
                break;
            }
            
            // Criando argumentos para a tarefa
            TaskArgs* taskArgs = (TaskArgs*)malloc(sizeof(TaskArgs));
            taskArgs->index = taskIndex;
            
            // Criando a thread para executar a tarefa
            if (pthread_create(&threads[taskIndex], NULL, performTask, (void*)taskArgs) != 0) {
                fprintf(stderr, "Erro ao criar a thread para a tarefa %d\n", taskIndex);
                exit(1);
            }
        }
    }

    // Aguardando a conclusão de todas as threads
    for (int i = 0; i < numberOfTasks; i++) {
        pthread_join(threads[i], NULL);
    }

    printf("Todas as tarefas foram concluídas\n");

    return 0;
}

