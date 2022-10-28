//
//  ChenHand.swift
//  PokerBuddy
//
//  Created by Luke Smith  on 4/7/22.
//

import Foundation
import PlayingCard
import FisherYates
import DeckOfPlayingCards

/**
 A ChenHand is a struct that contains an array of objects of the  `PlayingCard` type,
 from which a `chenValue`  can be determined using implementation of Chen's formula in the
 `chenEvaluator`  method
 */
struct ChenHand {
    /// handArray contains 2 PlayingCard objects that represent the PlayingCard objecst that
    /// make up the ChenHand
    let handArray: [PlayingCard]
    
    
    init(handArray: [PlayingCard]) {
        self.handArray = handArray
    }
    
    /// - Returns : the ChenValue of the handArray of the hand
    func handValue() -> Int {
        return(chenEvaluator(handArray))
    }
    
    /// - Returns : A String representation of the two cards in the handArray, with
    /// each cards rank being represented as a character. In addition, if the two cards are of
    /// the same suit an "s" is present at the end of the string, and if they are of different suits an "o" is
    /// present at the end of the string
    func handString() -> String {
        
        var ret = ""
        ret = ret + handArray[0].rank.description + handArray[1].rank.description
        if (handArray[0].suit == handArray[1].suit) {
            ret = ret + "s"
        } else if (handArray[0].rank == handArray[1].rank){
            return ret
        } else {
            ret = ret + "o"
        }
        return ret
        
    }
    /// - Parameter hand: An array of playing cards
    /// - Returns : An int that represents the chenValue of the inputted hand, which is determined by Chen's Formula.
    private func chenEvaluator(_ hand: [PlayingCard]) -> Int {
        let cardOne: PlayingCard = hand[0]
        let cardTwo: PlayingCard = hand[1]
        
        let highest = rawValue(cardOne) >= rawValue(cardTwo) ? cardOne : cardTwo
        var points = chenValue(highest)
        if (cardOne.rank == cardTwo.rank) {
            points = chenValue(highest) * 2 > 5 ? points * 2 : 5
            if (cardOne.rank == .five) {
                points += 1
            }
        }
        if (cardOne.suit == cardTwo.suit) {
            points += 2
        }
        let gap = gap(cardOne: cardOne, cardTwo: cardTwo)
        if (gap == 1) {
            points += -1
        }
        if (gap == 2) {
            points += -2
        }
        if (gap == 3) {
            points += -4
        }
        if (gap > 3) {
            points += -5
        }
        if (gap < 2 && rawValue(highest) <= 12 && cardOne.rank != cardTwo.rank) {
            points += 1
        }
        
        return Int(round(points))
        
    }
    private func chenValueConverter(_ card: PlayingCard) -> Float {
        return 0
        
    }
    private func gap(cardOne: PlayingCard, cardTwo: PlayingCard) -> Float {
        return abs(rawValue(cardOne) - rawValue(cardTwo) - 1)
    }
    private func chenValue(_ x: PlayingCard) -> Float {
        switch x.rank {
        case .two:
            return 1
        case .three:
            return 1.5
        case .four:
            return 2
        case .five:
            return 2.5
        case .six:
            return 3
        case .seven:
            return 3.5
        case .eight:
            return 4
        case .nine:
            return 4.5
        case .ten:
            return 5
        case .jack:
            return 6
        case .queen:
            return 7
        case .king:
            return 8
        case .ace:
            return 10
        }
        
    }
    
    private func rawValue(_ x: PlayingCard) -> Float {
        switch x.rank {
        case .two:
            return 2
        case .three:
            return 3
        case .four:
            return 4
        case .five:
            return 5
        case .six:
            return 6
        case .seven:
            return 7
        case .eight:
            return 8
        case .nine:
            return 9
        case .ten:
            return 10
        case .jack:
            return 11
        case .queen:
            return 12
        case .king:
            return 13
        case .ace:
            return 14
        }
        
    }
}

// MARK: - CustomStringConvertible

extension ChenHand: CustomStringConvertible {
    public var description: String {
        var ret = ""
        let sortedHand = handArray.sorted()
        ret = ret + sortedHand[0].rank.description + sortedHand[1].rank.description
        if (sortedHand[0].suit == sortedHand[1].suit) {
            ret = ret + "s"
        } else if (sortedHand[0].rank == sortedHand[1].rank){
            return ret
        } else {
            ret = ret + "o"
        }
        return ret
        
    }
}

// MARK: - Equatable
extension ChenHand: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.handValue() == rhs.handValue()
    }
    
    
}
// MARK: - Comparable

extension ChenHand: Comparable {
    static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.handValue() < rhs.handValue()
    }
}

// 
