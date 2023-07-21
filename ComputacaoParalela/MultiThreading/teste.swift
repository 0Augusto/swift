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
let numberOfThreads = 500 // Número de threads desejado
var threads: [Thread] = []

for i in 0..<numberOfThreads {
    let thread = Thread {
        performTask(i)
    }
    threads.append(thread)
    thread.start()
}

// Verifica se todas as threads foram concluídas

var allThreadsCompleted = false
while !allThreadsCompleted {
    allThreadsCompleted = true
    for thread in threads {
        if thread.isExecuting {
            allThreadsCompleted = false
            break
        }
    }
    if !allThreadsCompleted {
        Thread.sleep(forTimeInterval: 0.1) // Aguarda 0.1 segundos
    }
}

print("Todas as tarefas foram concluídas")
