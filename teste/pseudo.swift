/*
Neste exemplo, criamos uma classe RandomNumberGenerator com um método generateRandomNumber() para gerar os números pseudo-aleatórios. A cada chamada do método generateRandomNumber(), o próximo valor da semente é calculado usando o algoritmo de congruência linear, e o valor atualizado da semente é retornado como o número pseudo-aleatório.
*/

class RandomNumberGenerator {
    private var seed: UInt8 = 0b10010011 // Valor inicial da semente (pode ser qualquer valor de 8 bits)
    private let a: UInt8 = 0b01100001 // Constante multiplicativa
    private let c: UInt8 = 0b00000001 // Constante aditiva

    func generateRandomNumber() -> UInt8 {
        // Algoritmo de congruência linear: Xn+1 = (a * Xn + c) mod m
        let nextSeed = (a &* seed &+ c) // &* é uma multiplicação segura, &+ é uma adição segura
        seed = nextSeed
        return seed
    }
}

// Exemplo de uso:
let rng = RandomNumberGenerator()
for _ in 1...10 {
    let randomNum = rng.generateRandomNumber()
    print(randomNum)
}

