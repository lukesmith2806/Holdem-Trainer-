//
//  GameScore.swift
//  Holdem Trainer
//
//  Created by Luke Smith  on 5/22/22.
//



import Foundation
import GRDB
// objects must have identifier for use with GRDB
struct GameScore: Storable {
 
    internal var id: Int64?
    

    var name: String
    var attempts: Int
    var correct: Int
}

// GameScore must confrom to Codable, FetchableRecord, MutablePersistableRecord protocols for functionality with GRDB
extension GameScore: Codable, FetchableRecord, MutablePersistableRecord {
    // Define database columns from CodingKeys
    private enum Columns {
        static let id = Column(CodingKeys.id)
        static let name = Column(CodingKeys.name)
        static let attempts = Column(CodingKeys.attempts)
        static let correct =  Column(CodingKeys.correct)
    }
    
    // Update an id after it has been inserted in the database.
    mutating func didInsert(with rowID: Int64, for column: String?) {
        id = rowID
    }
}

extension GameScore: CustomStringConvertible {
    var description: String {
           "\(name)\t Correct: \(correct)\t Attempts: \(attempts)"
       }
}
