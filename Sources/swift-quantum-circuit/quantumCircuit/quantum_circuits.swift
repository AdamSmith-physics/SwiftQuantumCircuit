import SwiftTensor

public class QuantumCircuit {

    public var gates: [Gate] = []
    public var N: Int = 0
    public var initialState: QuantumState = QuantumState()
    public var measureQubits: [Int] = []

    public init(_ N: Int) {
        self.N = N
        self.initialState = QuantumState(N)
    }

    public func run() -> QuantumState {
        var finalState = initialState
        for gate in gates {
            finalState = gate.apply(finalState)
        }
        return finalState
    }
    
    public func run(shots: Int) -> [String : Int] {
        // This should be changed so that qubits without gates should be removed from simulation!
        var finalState = initialState
        for gate in gates {
            finalState = gate.apply(finalState)
        }
        return finalState.measure(shots: shots, qubits: measureQubits)
    }

    //
    // Measurement gate
    //
    
    public func measure(_ qubit: Int) {
        if measureQubits.contains(qubit) {
            print("qubit already measured!")
        } else {
            if qubit >= 0 && qubit < N {
                measureQubits = measureQubits + [qubit]
            } else {
                print("qubit out of range!!")
                // Add proper error handling.
            }
        }
    }
    
    public func measure(_ qubits: [Int]) {
        for qubit in qubits {
            self.measure(qubit)
        }
    }
    
    public func isQubitMeasured(_ qubit: Int) -> Bool {
        return measureQubits.contains(qubit)
    }
    
    //
    // Single qubit gates
    //

    public func x(_ qubit: Int) {
        if isQubitMeasured(qubit) { print("Gate applied after measurement. Not currently implemented!") }
        gates.append(Gate.x(qubit))
    }

    public func y(_ qubit: Int) {
        if isQubitMeasured(qubit) { print("Gate applied after measurement. Not currently implemented!") }
        gates.append(Gate.y(qubit))
    }

    public func z(_ qubit: Int) {
        if isQubitMeasured(qubit) { print("Gate applied after measurement. Not currently implemented!") }
        gates.append(Gate.z(qubit))
    }

    public func h(_ qubit: Int) {
        if isQubitMeasured(qubit) { print("Gate applied after measurement. Not currently implemented!") }
        gates.append(Gate.h(qubit))
    }

    public func s(_ qubit: Int) {
        if isQubitMeasured(qubit) { print("Gate applied after measurement. Not currently implemented!") }
        gates.append(Gate.s(qubit))
    }

    public func sdg(_ qubit: Int) {
        if isQubitMeasured(qubit) { print("Gate applied after measurement. Not currently implemented!") }
        gates.append(Gate.sdg(qubit))
    }

    public func t(_ qubit: Int) {
        if isQubitMeasured(qubit) { print("Gate applied after measurement. Not currently implemented!") }
        gates.append(Gate.t(qubit))
    }

    public func tdg(_ qubit: Int) {
        if isQubitMeasured(qubit) { print("Gate applied after measurement. Not currently implemented!") }
        gates.append(Gate.tdg(qubit))
    }

    public func sqrt_x(_ qubit: Int) {
        if isQubitMeasured(qubit) { print("Gate applied after measurement. Not currently implemented!") }
        gates.append(Gate.sqrt_x(qubit))
    }
    
    public func sqrt_x_dg(_ qubit: Int) {
        if isQubitMeasured(qubit) { print("Gate applied after measurement. Not currently implemented!") }
        gates.append(Gate.sqrt_x_dg(qubit))
    }

    public func p(_ theta: Double, _ qubit: Int) {
        if isQubitMeasured(qubit) { print("Gate applied after measurement. Not currently implemented!") }
        gates.append(Gate.p(theta, qubit))
    }

    public func rx(_ theta: Double, _ qubit: Int) {
        if isQubitMeasured(qubit) { print("Gate applied after measurement. Not currently implemented!") }
        gates.append(Gate.rx(theta, qubit))
    }

    public func ry(_ theta: Double, _ qubit: Int) {
        if isQubitMeasured(qubit) { print("Gate applied after measurement. Not currently implemented!") }
        gates.append(Gate.ry(theta, qubit))
    }

    public func rz(_ theta: Double, _ qubit: Int) {
        if isQubitMeasured(qubit) { print("Gate applied after measurement. Not currently implemented!") }
        gates.append(Gate.rz(theta, qubit))
    }

    public func u(_ theta: Double, _ phi: Double, _ lam: Double, _ qubit: Int) {
        if isQubitMeasured(qubit) { print("Gate applied after measurement. Not currently implemented!") }
        gates.append(Gate.u(theta, phi, lam, qubit))
    }

    //
    // Two qubit gates
    //

    public func cnot(_ control: Int, _ target: Int) {
        if isQubitMeasured(control) || isQubitMeasured(target) { print("Gate applied after measurement. Not currently implemented!") }
        gates.append(Gate.cnot(control, target))
    }

    public func cx(_ control: Int, _ target: Int) {
        if isQubitMeasured(control) || isQubitMeasured(target) { print("Gate applied after measurement. Not currently implemented!") }
        gates.append(Gate.cx(control, target))
    }

    public func swap(_ control: Int, _ target: Int) {
        if isQubitMeasured(control) || isQubitMeasured(target) { print("Gate applied after measurement. Not currently implemented!") }
        gates.append(Gate.swap(control, target))
    }

    public func cz(_ control: Int, _ target: Int) {
        if isQubitMeasured(control) || isQubitMeasured(target) { print("Gate applied after measurement. Not currently implemented!") }
        gates.append(Gate.cz(control, target))
    }
    
    public func cu(_ control: Int, _ target: Int, _ theta: Double, _ phi: Double, _ lam: Double) {
        if isQubitMeasured(control) || isQubitMeasured(target) { print("Gate applied after measurement. Not currently implemented!") }
        gates.append(Gate.cu(control, target, theta, phi, lam))
    }

    //
    // Three qubit gates
    //

    public func toffoli(_ control1: Int, _ control2: Int, _ target: Int) {
        if isQubitMeasured(control1) || isQubitMeasured(control2) || isQubitMeasured(target) { print("Gate applied after measurement. Not currently implemented!") }
        gates.append(Gate.toffoli(control1, control2, target))
    }

    public func ccx(_ control1: Int, _ control2: Int, _ target: Int) {
        if isQubitMeasured(control1) || isQubitMeasured(control2) || isQubitMeasured(target) { print("Gate applied after measurement. Not currently implemented!") }
        gates.append(Gate.ccx(control1, control2, target))
    }

}
