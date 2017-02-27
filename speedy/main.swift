//
//  main.swift
//  speedy
//  0.6875
//

import Foundation

func getArgumentAcceleration() -> Double? {
    let arguments = CommandLine.arguments
    if (arguments.count == 2) {
        let argument = Double(arguments[1])
        if (argument != nil) {
            return argument!
        }
    }
    return nil
}

func getSystemAcceleration() -> Double {
    var acceleration: Double = 0
    IOHIDGetAccelerationWithKey(NXOpenEventStatus(), kIOHIDTrackpadAccelerationType as CFString!, &acceleration)
    return acceleration
}

func setSystemAcceleration(_ acceleration: Double) {
    IOHIDSetAccelerationWithKey(NXOpenEventStatus(), kIOHIDTrackpadAccelerationType as CFString!, acceleration)
}

let argumentAcceleration: Double? = getArgumentAcceleration()
if (argumentAcceleration != nil) {
    setSystemAcceleration(argumentAcceleration!)
} else {
    let systemAcceleration = getSystemAcceleration()
    print(systemAcceleration)
}
