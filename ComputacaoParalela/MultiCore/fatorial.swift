import Foundation

func performTask(_ start: Int, _ end: Int) {
    var result = 0
for i in start...end {
    result *= i
}
print("Tarefa concluída: Resultado parcial = \(result)")
}

let numberOfCores = ProcessInfo.processInfo.activeProcessorCount
let totalTaskCount = 1000
let tasksPerCore = totalTaskCount / numberOfCores

let group = DispatchGroup()

for core in 0..<numberOfCores {
    let start = core * tasksPerCore + 1
    let end = (core + 1) * tasksPerCore
    
    DispatchQueue.global(qos: .userInitiated).async(group: group) {
        performTask(start, end)
    }
}

// Aguarda a conclusão de todas as tarefas
group.wait()

print("Todas as tarefas foram concluídas")
