import Foundation

// 1. Definir funções de pertinência (triangulares/trapezoidais)
func pertinenciaTriangular(x: Double, a: Double, b: Double, c: Double) -> Double {
    return max(min((x - a) / (b - a), (c - x) / (c - b)), 0)
}

// 2. Variáveis nebulosas
enum TemperaturaTermo { case frio, ameno, quente }
enum UmidadeTermo { case baixa, media, alta }
enum PotenciaTermo { case baixa, media, alta }

// 3. Fuzzificação: Converter valores reais → graus de pertinência
func fuzzificarTemperatura(_ temp: Double) -> [TemperaturaTermo: Double] {
    return [
        .frio: pertinenciaTriangular(x: temp, a: 10, b: 10, c: 25),
        .ameno: pertinenciaTriangular(x: temp, a: 15, b: 25, c: 35),
        .quente: pertinenciaTriangular(x: temp, a: 25, b: 40, c: 40)
    ]
}

func fuzzificarUmidade(_ umid: Double) -> [UmidadeTermo: Double] {
    return [
        .baixa: pertinenciaTriangular(x: umid, a: 0, b: 0, c: 50),
        .media: pertinenciaTriangular(x: umid, a: 30, b: 50, c: 70),
        .alta: pertinenciaTriangular(x: umid, a: 50, b: 100, c: 100)
    ]
}

// 4. Regras Nebulosas
struct Regra {
    let temp: TemperaturaTermo
    let umid: UmidadeTermo
    let potencia: PotenciaTermo
}

let regras: [Regra] = [
    Regra(temp: .quente, umid: .baixa, potencia: .alta),
    Regra(temp: .quente, umid: .media, potencia: .alta),
    Regra(temp: .ameno, umid: .media, potencia: .media),
    Regra(temp: .frio, umid: .alta, potencia: .baixa)
]

// 5. Inferência: Aplicar regras (método de Mamdani)
func inferirPotencia(temp: Double, umid: Double) -> [PotenciaTermo: Double] {
    let pertTemp = fuzzificarTemperatura(temp)
    let pertUmid = fuzzificarUmidade(umid)
    var potenciaResultado: [PotenciaTermo: Double] = [.baixa: 0, .media: 0, .alta: 0]
    
    for regra in regras {
        let forca = min(
            pertTemp[regra.temp] ?? 0,
            pertUmid[regra.umid] ?? 0
        )
        // Combina múltiplas regras usando máximo (OR nebuloso)
        potenciaResultado[regra.potencia] = max(potenciaResultado[regra.potencia] ?? 0, forca)
    }
    return potenciaResultado
}

// 6. Defuzzificação: Método do Centróide
func defuzzificar(_ potencia: [PotenciaTermo: Double]) -> Double {
    let pontos: [Double] = [0, 50, 100] // Baixa=0, Média=50, Alta=100
    var numerador: Double = 0
    var denominador: Double = 0
    
    for ponto in pontos {
        let grau: Double = {
            switch ponto {
            case 0: return potencia[.baixa] ?? 0
            case 50: return potencia[.media] ?? 0
            case 100: return potencia[.alta] ?? 0
            default: return 0
            }
        }()
        numerador += ponto * grau
        denominador += grau
    }
    return (denominador != 0) ? numerador / denominador : 50 // Default 50%
}

// 7. Exemplo de Uso
let temperaturaAtual = 32.0 // °C
let umidadeAtual = 35.0    // %

let potenciaNebulosa = inferirPotencia(
    temp: temperaturaAtual,
    umid: umidadeAtual
)

let potenciaFinal = defuzzificar(potenciaNebulosa)
print("Potência do ar condicionado: \(potenciaFinal)%")
