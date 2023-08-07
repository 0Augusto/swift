import Foundation

func performTask(_ index: Int) {
    print("Iniciando tarefa \(index)")
    
    // Lógica da tarefa a ser executada
    for i in 1...5 {
        print("Tarefa \(index): Executando passo \(i)")
        // Simulação de processamento
        for _ in 1...1_000_000 { }
    }
    
    print("Concluindo tarefa \(index)")
}

let numberOfTasks = 1000 // Número de tarefas desejado
let numberOfCores = 6 // Número de núcleos desejado

// Criando uma fila serial para garantir que cada tarefa seja executada sequencialmente em um núcleo específico
let serialQueue = DispatchQueue(label: "com.example.serialQueue")

// Criando uma fila global para distribuir as tarefas entre os núcleos
let globalQueue = DispatchQueue.global(qos: .userInitiated)

// Criando um grupo de dispatch para saber quando todas as tarefas foram concluídas
let taskGroup = DispatchGroup()

// Calculando quantas tarefas serão executadas por núcleo
let tasksPerCore = numberOfTasks / numberOfCores

for coreIndex in 0..<numberOfCores {
    // Adicionando as tarefas à fila global
    for taskIndex in (coreIndex * tasksPerCore)..<(coreIndex + 1) * tasksPerCore {
        // Verificando se ainda existem tarefas a serem adicionadas para evitar um índice fora dos limites
        guard taskIndex < numberOfTasks else { break }
        
        // Entrando no grupo de dispatch para cada tarefa adicionada
        taskGroup.enter()
        
        globalQueue.async {
            // Usando a fila serial para garantir que a tarefa seja executada em um único núcleo
            serialQueue.async {
                performTask(taskIndex)
                // Saindo do grupo de dispatch após a conclusão da tarefa
                taskGroup.leave()
            }
        }
    }
}

// Aguardando a conclusão de todas as tarefas
taskGroup.wait()

print("Todas as tarefas foram concluídas")

