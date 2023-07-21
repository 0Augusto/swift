import Foundation

func performTask(_ start: Int, _ end: Int) {
    var result = 0
    for i in start...end {
    // Carregar e processar uma imagem
    let image = loadImage(at: imageURLs[i])
    let processedImage = applyFilters(image)
    saveImage(processedImage, at: outputURLs[i])
    }

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

