//
//  ChenGame.swift
//  PokerBuddy
//
//  Created by Luke Smith  on 4/7/22.
//

import Foundation
import PlayingCard
import FisherYates
import DeckOfPlayingCards
import Logging

class ChenGuesserGame {
    func runGame(numberOfHands: Int) -> [ChenHand] {
        // returns array of ChenHands with numberOfHands elements
        var handArray: [ChenHand] = []
        // Creates 3 chen hands
        var deck = Deck.standard52CardDeck()
        deck.shuffle()
        
        while handArray.count < numberOfHands {
            
            if let cardOne = deck.deal(), let cardTwo = deck.deal() {
                
                let hand = ChenHand(handArray: [cardOne, cardTwo])
                if !handArray.contains {$0 == hand} {
                    handArray.append(hand)
                }
            }
        }
        
        Logger.info.info("Hands Generated: \(handArray)")
        return handArray
    }
    
    func checkValue(handArray: [ChenHand], chosenHand: ChenHand ) -> Bool {
        // given an array of ChenHands, determines if a given hand has the highest value in the array(tie = true)
        Logger.info.info("Hands Compared: \(handArray)")
        for hand in handArray {
            if (hand.handValue() > chosenHand.handValue()) {
                Logger.info.info("Highest Hand: \(hand)")
                return false
            }
            
        }
        Logger.info.info("Highest Hand: \(chosenHand)")
        return true
    }
}
