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

// Cria uma fila serial do GCD
let serialQueue = DispatchQueue(label: "com.example.serialQueue")

// Adiciona as tarefas à fila serial para que sejam executadas sequencialmente em um único núcleo
for i in 0..<numberOfTasks {
    serialQueue.async {
        performTask(i)
    }
}

// Aguarda a conclusão de todas as tarefas
serialQueue.sync(flags: .barrier) {}

print("Todas as tarefas foram concluídas")

