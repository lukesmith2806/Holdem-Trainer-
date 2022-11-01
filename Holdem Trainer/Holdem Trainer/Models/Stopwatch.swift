//
//  Stopwatch.swift
//  Holdem Trainer
//
//  Created by Luke Smith  on 10/31/22.
//

import Foundation
class Stopwatch {
    private var startTime: Date?
    func start() -> Void {
        self.startTime = Date()
    }
    func stop() -> Void {
      self.startTime = nil
    }
    func elapsedTime() -> TimeInterval {
        return -(self.startTime?.timeIntervalSinceNow ?? 0)
    }
}

extension Stopwatch {
 
    func elapsedTimeMilliseconds() -> Int {
        return Int(elapsedTime() * 1000)
    }
}
