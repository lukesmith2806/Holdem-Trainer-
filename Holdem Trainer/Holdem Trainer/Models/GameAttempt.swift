//
//  GameAttempt.swift
//  Holdem Trainer
//
//  Created by Luke Smith  on 10/31/22.
//

import Foundation
import GRDB

struct GameAttempt: Storable {
    internal var id: Int64?
    
    var name: String
    var correct: Bool
    var time: Int
}

// GameAttempt must confrom to Codable, FetchableRecord, MutablePersistableRecord protocols for functionality with GRDB
extension GameAttempt: Codable, FetchableRecord, MutablePersistableRecord {
    
    private enum Columns {
        static let id = Column(CodingKeys.id)
        static let name = Column(CodingKeys.name)
        static let correct = Column(CodingKeys.correct)
        static let time = Column(CodingKeys.time)
        
    }
    
    mutating func didInsert(with rowID: Int64, for column: String?) {
        id = rowID
    }
}
