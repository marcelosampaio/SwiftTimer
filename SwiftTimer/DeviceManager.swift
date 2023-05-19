//
//  DeviceManager.swift
//  SwiftTimer
//
//  Created by Marcelo Sampaio on 06/05/23.
//
import Foundation

class DeviceManager {
    static let standard = DeviceManager()
    private var vibrationTimer = Timer()

    private init() { }
    
    public func vibrate() {
        vibrationTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(timeTicker), userInfo: nil, repeats: true)
        vibrationTimer.fire()
    }
    
    public func stopVibration() {
        vibrationTimer.invalidate()
    }
    
    @objc private func timeTicker() {
        print("⏳ Timer ticking!")
        Device.vibrate()
    }
}
