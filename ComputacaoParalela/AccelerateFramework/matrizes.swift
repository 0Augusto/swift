import Accelerate

let matrix1: [Float] = [1.0, 2.0, 3.0, 4.0,
                         5.0, 6.0, 7.0, 8.0]

let matrix2: [Float] = [9.0, 10.0,
                         11.0, 12.0,
                         13.0, 14.0,
                         15.0, 16.0]

let rows = 2
let columns = 4
let resultCount = rows * columns
var result = [Float](repeating: 0.0, count: resultCount)

// Multiplicação de matrizes
vDSP_mmul(matrix1, 1, matrix2, 1, &result, 1, vDSP_Length(rows), vDSP_Length(columns), vDSP_Length(columns))

print("Resultado da multiplicação das matrizes: \(result)")

