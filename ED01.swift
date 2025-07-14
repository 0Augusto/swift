import Foundation

func readint(_ text: String) -> Int {
    print(text, terminator: "")
    if let input = readLine(), let value = Int(input) {
        return value
    } else {
        return 0
    }
}

func readdouble(_ text: String) -> Double {
    print(text, terminator: "")
    if let input = readLine(), let value = Double(input) {
        return value
    } else {
        return 0.0
    }
}

func Metodo00() {
    print("Aperte zero(0) para encerrar a execucao do programa!")
    print("Aperte enter para continuar!")
    _ = readLine()
}

func Metodo01() {
    print("Executa o programa 0111 - Programa = v0.1")
    
    print("Insira o valor do lado do quadrado: ", terminator: "")
    let lado = Int(readLine() ?? "") ?? 0
    let area = Int(pow(Double(lado), 2)) / 2
    
    print("A metade da area do quadrado eh: \(area)")
    _ = readLine()
}

func Metodo02() {
    print("Executa o programa 0112 - Programa = v0.1")
    
    print("Insira o lado do quadrado: ")
    let l = Int(readLine() ?? "") ?? 0
    let area = 2 * l * 2 * l
    let peri = (2 * l) * 4
    
    print("A area do quadrado com o dobro do lado eh: \(area)")
    print("O perimetro do quadrado com o dobro do lado eh: \(peri)")
    _ = readLine()
}

func Metodo03() {
    print("Executa o programa 0113 - Programa = v0.1")
    
    print("Insira a largura do retangulo: ")
    let l = Int(readLine() ?? "") ?? 0
    print("Insira a altura do retangulo: ")
    let a = Int(readLine() ?? "") ?? 0
    let area = (l * a) / 3
    
    print("O terço da area do retangulo eh: \(area)")
    _ = readLine()
}

func Metodo04() {
    print("Executa o programa 0114 - Programa = v0.1")
    
    print("Insira a largura do retangulo: ")
    let l = Int(readLine() ?? "") ?? 0
    print("Insira o comprimento do retangulo: ")
    let c = Int(readLine() ?? "") ?? 0
    let P = (2 * l + 2 * c) * 2
    
    print("O perimetro com o dobro dos lados eh: \(P)")
    _ = readLine()
}

func Metodo05() {
    print("Executa o programa 0115 - Programa = v0.1")
    
    print("Insira a altura do triangulo: ")
    let h = Double(readLine() ?? "") ?? 0.0
    print("Insira a base do triangulo: ")
    let b = Double(readLine() ?? "") ?? 0.0
    let area = (h / 2.0) * b
    
    print("A area do triangulo eh: \(area)")
    _ = readLine()
}

func Metodo06() {
    print("Executa o programa 0116 - Programa = v0.1")
    
    print("Insira um valor real do lado do triangulo: ")
    let L = Double(readLine() ?? "") ?? 0.0
    let altura = sqrt((L / 2) * L)
    let area = (pow(L, 2) * sqrt(3)) / 4
    let perimetro = 3 * L
    
    print("A altura eh: \(altura)")
    print("A area eh: \(area)")
    print("O perimetro eh: \(perimetro)")
    print("\nApertar ENTER para continuar.")
    _ = readLine()
}

func Metodo07() {
    print("Executa o programa 0117 - Programa = v0.1")
    
    print("Insira o valor do lado do cubo: ")
    let l = Double(readLine() ?? "") ?? 0.0
    let v = (1.0 / 4.0) * (3.0 * l)
    
    print("O volume do cubo com 1.0/4.0 do lado eh: \(v)")
    _ = readLine()
}

func Metodo08() {
    print("Executa o programa 0118 - Programa = v0.1")
    
    print("Insira o comprimento C: ")
    let C = Double(readLine() ?? "") ?? 0.0
    print("Insira a largura L: ")
    let L = Double(readLine() ?? "") ?? 0.0
    print("Insira a altura A: ")
    let A = Double(readLine() ?? "") ?? 0.0
    let v = (1.0 / 2.0) * C * (1.0 / 2.0) * L * (1.0 / 2.0) * A
    
    print("O volume do paralelepipedo eh: \(v)")
    print("\nApertar ENTER para continuar.")
    _ = readLine()
}

func Metodo09() {
    print("Executa o programa 0119 - Programa = v0.1")
    
    let pi = 3.14159265
    print("Insira um valor real para o raio: ")
    let r = Double(readLine() ?? "") ?? 0.0
    let area = pi * (2 * pow(r, 2))
    
    print("O valor da area eh: \(area)")
    print("\nApertar ENTER para continuar.")
    _ = readLine()
}

func Metodo10() {
    print("Executa o programa 0120 - Programa = v0.1")
    
    let pi = 3.14159265359
    print("Insira o valor do raio da esfera: ")
    let r = Double(readLine() ?? "") ?? 0.0
    let area = (4.0 / 3.0 * pi) * (1.0 / 8.0 * pow(r, 3))
    
    print("O valor da area com 1/8 do raio eh: \(area)")
    _ = readLine()
}

func Metodo11() {
    print("Executa o programa Exemplo01E1 - Programa = v0.1")
    
    print("Insira o valor da area de um quadrado: ")
    let a = Double(readLine() ?? "") ?? 0.0
    let L = sqrt(a)
    
    print("O lado do quadrado eh: \(L)")
    print("\nApertar ENTER para continuar.")
    _ = readLine()
}

func Metodo12() {
    print("Executa o programa Exemplo01E2 - Programa = v0.1")
    
    let pi = 3.14159265
    print("Insira o volume da esfera:")
    let v = Double(readLine() ?? "") ?? 0.0
    let r = cbrt((v / pi) * (3.0 / 4.0))
    let a = 4 * pi * pow(r, 2)
    
    print("O raio da esfera eh: \(r)")
    print("A area da superficie eh: \(a)")
    print("\nApertar ENTER para continuar.")
    _ = readLine()
}

// Programa principal
print("Henrique Augusto Rodrigues - versao 1.0 - 2020")
print(" - ED01\n")

var opcao: Int
repeat {
    print("\nOpcoes: ")
    print("0 - Terminar")
    print("0111 - Calcular a area e o perimetro do quadrado com o dobro do tamanho do lado.")
    print("0112 - Calcular a area de um retangulo com um terço da area.")
    print("0113 - Calcular a area e o perimetro do retangulo com o dobro do tamanho dos lados.")
    print("0114 - Calcular a area e o perimetro do triangulo com o dobro do tamanho dos lados.")
    print("0115 - Calcular a area e o perimetro do triangulo com o dobro do tamanho dos lados.")
    print("0116 - Calcular a area o perimetro e a altura do triangulo equilatero.")
    print("0117 - Calcular o volume de um cubo.")
    print("0118 - Calcular o volume de um paralelepipedo com a metade de suas medidas.")
    print("0119 - Calcular a area de um circulo com o drobro do raio.")
    print("0120 - Calcular o volume de uma esfera com 1/8 de seu raio.")
    print("01E1 - Calcular o lado de um quadrado a partir de sua area.")
    print("01E2 - Calcular e mostrar o raio da esfera e a area de sua superficie.")
    
    opcao = readint("Escolher a opcao: ")
    
    switch opcao {
    case 0: Metodo00()
    case 1: Metodo01()
    case 2: Metodo02()
    case 3: Metodo03()
    case 4: Metodo04()
    case 5: Metodo05()
    case 6: Metodo06()
    case 7: Metodo07()
    case 8: Metodo08()
    case 9: Metodo09()
    case 10: Metodo10()
    case 11: Metodo11()
    case 12: Metodo12()
    default: print("\nERRO 404 option not found!")
    }
} while opcao != 0

print("\nApertar ENTER para terminar.")
_ = readLine()
