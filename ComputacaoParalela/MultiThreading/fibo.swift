import Foundation

// Função para calcular a sequência de Fibonacci
func fibonacci(_ n: Int) -> [Int] {
    var sequence = [0, 1]
    for i in 2..<n {
        let nextNumber = sequence[i - 1] + sequence[i - 2]
        sequence.append(nextNumber)
    }
    return sequence
}

func performTask(_ index: Int) {
    print("Iniciando tarefa \(index)")
    
    // Lógica da tarefa a ser executada
    let fibSequence = fibonacci(10) // Calcula os primeiros 10 números da sequência de Fibonacci
    print("Tarefa \(index): Sequência de Fibonacci: \(fibSequence)")
    
    for i in 1...5 {
        print("Tarefa \(index): Executando passo \(i)")
        // Simulação de processamento
        for _ in 1...1_000_000 { }
    }
    
    print("Concluindo tarefa \(index)")
}

let numberOfThreads = 10 // Número de threads desejado (alterado para 10 para melhor visualização)
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

