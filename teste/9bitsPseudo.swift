/*
Nesta implementação, atualizamos a semente para 9 bits (UInt16) e as constantes a e c também são representadas como UInt16, de modo a acomodar os 9 bits. Os operadores &* e &+ são usados para garantir que as operações de multiplicação e adição sejam feitas com segurança, evitando possíveis estouros de valores. O método generateRandomNumber() agora retorna um número de 9 bits.

Essa implementação gera números pseudo-aleatórios de 9 bits. Se você precisar de mais bits, basta atualizar os tipos de dados seed, a e c para acomodar a quantidade desejada.
*/

class RandomNumberGenerator {
    private var seed: UInt16 = 0b100100110 // Valor inicial da semente (pode ser qualquer valor de 9 bits)
    private let a: UInt16 = 0b011000011 // Constante multiplicativa
    private let c: UInt16 = 0b000000001 // Constante aditiva

    func generateRandomNumber() -> UInt16 {
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

