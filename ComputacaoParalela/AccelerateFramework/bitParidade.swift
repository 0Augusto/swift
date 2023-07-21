func calculateParityBit(_ number: UInt8) -> UInt8 {
    let bits: UInt8 = number
    var parity: UInt8 = 0
    
    // Conta o número de bits 1 no número
    var count = 0
    var temp = bits
    while temp != 0 {
        count += Int(temp & 1)
        temp >>= 1
    }
    
    // Verifica se o número de bits 1 é par ou ímpar
    parity = UInt8(count % 2)
    
    return parity
}

let input: UInt8 = 0b11001011
let parityBit = calculateParityBit(input)

print("Bit de Paridade: \(parityBit)")
