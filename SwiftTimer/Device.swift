//
//  Device.swift
//  SwiftTimer
//
//  Created by Marcelo Sampaio on 06/05/23.
//

import Foundation
import CoreHaptics

var engine: CHHapticEngine?

public class Device {
    public class func vibrate() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        let device = Device()
        device.prepareHaptics(&engine)
        
        let events = device.eventsBuilder()
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            vibrate()
        }
    }
}

extension Device {
    private func prepareHaptics(_ engine: inout CHHapticEngine?) {
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            prepareHaptics(&engine)
        }
    }
    
    private func eventsBuilder() -> [CHHapticEvent] {
        var events = [CHHapticEvent]()
        
        for i in stride(from: 0, to: 2, by: 0.01) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
            events.append(event)
        }
        
        return events
    }
}

