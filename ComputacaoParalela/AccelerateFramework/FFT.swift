//Fast Fourier Transform

import Accelerate

let input: [Float] = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0]
let log2n = vDSP_Length(log2(Float(input.count)))
let fftSetup = vDSP_create_fftsetup(log2n, Int32(kFFTRadix2))

var realPart = [Float](input)
var imaginaryPart = [Float](repeating: 0.0, count: input.count)
var splitComplex = DSPSplitComplex(realp: &realPart, imagp: &imaginaryPart)

vDSP_fft_zrip(fftSetup!, &splitComplex, 1, log2n, FFTDirection(FFT_FORWARD))

vDSP_destroy_fftsetup(fftSetup)

print("Resultado da FFT: real = \(realPart), imaginário = \(imaginaryPart)")

