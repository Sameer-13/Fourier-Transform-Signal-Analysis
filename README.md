# Fourier-Transform-Signal-Analysis

## Overview

This repository contains a MATLAB program that analyzes different **pulse signals** in both the **time domain** and the **frequency domain** using the **Fourier Transform**.

The program generates three different pulse shapes, computes their theoretical **Fourier Transform**, evaluates the **Energy Spectral Density (ESD)**, calculates the **total signal energy**, and estimates the **practical bandwidth** from the first spectral zeros.

This project demonstrates the relationship between a signal's **time-domain shape** and its **frequency-domain spectrum**, which is a fundamental concept in **signal processing and communication systems**.

---

# Pulse Signals and Their Fourier Transforms

## 1. Rectangular Pulse

### Time Domain

The rectangular pulse is defined as

p(t) = A ,  |t| ≤ Taw/2
p(t) = 0 ,  otherwise

### Fourier Transform

P(f) = A Taw * ( sin(π Taw f) / (π Taw f) )

This produces a **sinc-shaped spectrum**.

### Energy

E = ∫ |p(t)|² dt

For the rectangular pulse:

E = A² Taw

### First Spectral Zeros (Bandwidth)

f = ± 1 / Taw

---

# 2. Triangular Pulse

The triangular pulse is symmetric with total width **2Taw**.

### Time Domain

p(t) = A (1 − |t| / Taw) , |t| ≤ Taw
p(t) = 0 , otherwise

### Fourier Transform

P(f) = A Taw ( sin(π Taw f) / (π Taw f) )²

The spectrum is **sinc²**, which decays faster than the rectangular pulse.

### Energy

E = ∫ |p(t)|² dt

For the triangular pulse:

E = (2 A² Taw) / 3

### First Spectral Zeros

f = ± 1 / Taw

---

# 3. Cosine Pulse

The cosine pulse exists only within the interval:

-Taw/2 ≤ t ≤ Taw/2

### Time Domain

p(t) = A cos( (π t) / Taw )

### Fourier Transform

P(f) = (2 A Taw / π) * ( cos(π f Taw) / (1 − (2 f Taw)²) )

### Energy

E = ∫ |p(t)|² dt

For the cosine pulse:

E = (A² Taw) / 2

### First Spectral Zeros

f = ± 3 / (2 Taw)

---

# Energy Spectral Density (ESD)

The **Energy Spectral Density** describes how the signal energy is distributed over frequency.

ESD(f) = |P(f)|²

The program computes this using

ESD(f) = P(f) × P*(f)

where P*(f) is the complex conjugate of the Fourier Transform.

---

# Program Inputs

When running the script, the user provides the following parameters:

| Parameter       | Description                                 |
| --------------- | ------------------------------------------- |
| Pulse Type      | 1 = Rectangular, 2 = Triangular, 3 = Cosine |
| A               | Pulse amplitude (Volts)                     |
| Taw             | Pulse width parameter (seconds)             |
| Samples per Taw | Time-domain resolution                      |
| Samples per Hz  | Frequency resolution                        |

---

# Program Outputs

The MATLAB script generates:

### 1. Time-Domain Plot

Displays the pulse signal:

p(t)

### 2. Frequency-Domain Plot

Displays the **Energy Spectral Density**

|P(f)|²

### 3. Console Output

The program prints:

* Practical bandwidth range
* Total signal energy

Example:

Practical BW from: -1/Taw Hz to 1/Taw Hz
Total energy: A² Taw Joules

---

# Example Visualization

The program produces two figures:

### Figure 1 — Time Domain

Displays the generated pulse signal.

### Figure 2 — Frequency Domain

Displays the Energy Spectral Density showing how energy is distributed across frequencies.

---

# How to Run

1. Open MATLAB.
2. Clone the repository
3. Open the MATLAB script.
4. Run the script.
5. Enter the requested parameters in the MATLAB console.

---

# Repository Structure

pulse-fourier-transform-matlab

│
├── main.m
└── README.md

---

## Examples


---

## License

This project is released under the **MIT License**.
