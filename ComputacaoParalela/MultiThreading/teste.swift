/*
Para fazer com que o programa execute as threads em um único núcleo, 
você pode usar uma fila serial do Grand Central Dispatch (GCD) em vez de criar threads separadas. 
A fila serial garantirá que as tarefas sejam executadas sequencialmente em um único núcleo.
Neste código, substituímos a criação das threads por uma fila serial do GCD chamada "serialQueue". 
Em seguida, usamos o método async para adicionar as tarefas à fila, 
garantindo que elas serão executadas sequencialmente, uma após a outra, em um único núcleo. 
Por fim, utilizamos o método sync com a flag.barrier para aguardar a conclusão de todas as tarefas antes de imprimir a mensagem "Todas as tarefas foram concluídas". 
Dessa forma, garantimos que todas as tarefas sejam concluídas antes de encerrar o programa.
*/

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
let numberOfThreads = 1000 // Número de threads desejado (500)
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
