import Accelerate

let array1: [Float] = [1.0, 2.0, 3.0, 4.0]
let array2: [Float] = [5.0, 6.0, 7.0, 8.0]

let count = vDSP_Length(array1.count)
let stride = vDSP_Stride(1)

// Soma dos elementos dos arrays
var result = [Float](repeating: 0.0, count: array1.count)
vDSP_vadd(array1, stride, array2, stride, &result, stride, count)

print("Soma dos arrays: \(result)") // Saída: [6.0, 8.0, 10.0, 12.0]
