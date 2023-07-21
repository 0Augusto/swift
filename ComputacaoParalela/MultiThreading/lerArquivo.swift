import Foundation

class FileReadThread: NSObject {
    @objc func readFile() {
        let filePath = "/Users/hariseldon/Desktop/swift/ComputacaoParalela/MultiThreading/nome.txt" // Substitua pelo caminho correto do arquivo que deseja ler
        
        if let fileContents = try? String(contentsOfFile: filePath) {
            print("Conteúdo do arquivo:")
            print(fileContents)
        } else {
            print("Erro ao ler o arquivo")
        }
    }
}

let fileReadThread = FileReadThread()
let thread = Thread(target: fileReadThread, selector: #selector(FileReadThread.readFile), object: nil)
thread.start()

