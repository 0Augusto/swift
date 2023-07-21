import CryptoKit
import Foundation

func calculateFileHash(filePath: String) -> String? {
    guard let fileData = FileManager.default.contents(atPath: filePath) else {
        print("Falha ao ler o arquivo")
        return nil
    }
    
    let fileHash = Insecure.MD5.hash(data: fileData)
    let hashString = fileHash.map { String(format: "%02hhx", $0) }.joined()
    
    return hashString
}

// Exemplo de uso
let filePath = "/Users/hariseldon/Desktop/swift/teste/texto.txt" // Substitua pelo caminho do arquivo de texto que deseja calcular o hash
if let fileHash = calculateFileHash(filePath: filePath) {
    print("Hash do arquivo: \(fileHash)")
}

