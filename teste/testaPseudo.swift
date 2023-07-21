/*
Geramos 10 números pseudo-aleatórios e os imprimimos na saída para visualizar os resultados.
Verificamos se os números gerados estão dentro do intervalo correto (0 a 511, ou seja, 9 bits).
Verificamos se os números gerados são diferentes em cada chamada para garantir a aleatoriedade.
A função testRandomNumberGenerator() executa os testes e imprimirá uma mensagem "Testes concluídos com sucesso!" se todos os testes passarem. Caso algum teste falhe, a função assert() lançará um erro indicando o problema encontrado.
*/

func testRandomNumberGenerator() {
    let rng = RandomNumberGenerator()

    // Gerar 10 números pseudo-aleatórios e imprimir na saída
    print("10 números pseudo-aleatórios:")
    for _ in 1...10 {
        let randomNum = rng.generateRandomNumber()
        print(String(format: "%09b", randomNum))
    }

    // Verificar se os números gerados estão dentro do intervalo correto (0 a 511)
    for _ in 1...100 {
        let randomNum = rng.generateRandomNumber()
        assert(randomNum >= 0 && randomNum <= 511, "Número fora do intervalo 0 a 511: \(randomNum)")
    }

    // Verificar se os números gerados são diferentes a cada chamada
    var previousNum: UInt16 = rng.generateRandomNumber()
    for _ in 1...100 {
        let randomNum = rng.generateRandomNumber()
        assert(randomNum != previousNum, "Número repetido: \(randomNum)")
        previousNum = randomNum
    }

    print("Testes concluídos com sucesso!")
}

// Executar os testes
testRandomNumberGenerator()

