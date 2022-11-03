//
//  ChenGameInfoText.swift
//  Holdem Trainer
//
//  Created by Luke Smith  on 11/3/22.
//

import Foundation

struct ChenGameInfoText {
    let intro = """
    To play the Holdem Trainer Chen Game, you will need to familiarize \
    yourself with Chen's Formula \
    Chen's formula is a formula for evaluating the strength of \
    Texas Hold 'em starting hands. To determine the strength of \
    a hand using Chen's formula, read the information below.
"""
    let headerOne  = "Values"
    
    let valuesParagraph = """
    The face cards have the following values: Ace:10, King:8, \
    Queen:7, Jack: 6

    Numbered cards have a value equal to half of their value.

    Example: 9 has a value of 4.5 and 6 has a value of 3
    
"""
    let headerTwo = "Pairs"
    let pairsParagraph = """
    The value of a pair is the simplest and is only found using one \
    step.\
    The value of a pair is either double the value of the paired card \
    or 5, whichever is higher. Do not follow any further steps.

    Example: KK has a value of 16 and 22 has a value of 5.

"""
    
    let headerThree = "Step One"
    let stepOneParagraph = """
    As a starting point, note the value of the higher card.
    
    Example: For A♠︎K♣︎, note 10
    Example: For 2♠︎7♠︎, note 3.5
    """
    
    let headerFour = "Step Two"
    let stepTwoParagraph = """
    Subtract points for the gap between the cards as shown below:
    0 Card Gap: 0 points
    1 Card Gap: -1 point
    2 Card Gap: -2 points
    3 Card Gap: - 4 points
    4+ Card Gap: -5 points

    Example: For A♠︎K♣︎, the value of the hand is still 10
    Example: For 2♠︎7♠︎, the value of the hand is now -1.5
    
"""
    let headerFive = "Step Three"
    let stepThreeParagraph = """
    Add 2 points for suited hands

    Example: For A♠︎K♣︎, the value of the hand is still 10
    Example: For 2♠︎7♠︎, the value of the hand is now .5
"""
    
    let headerSix  = "Step Four"
    let stepFourParagraph = """
    Add a point if the cards in the hand have a one card gap \
    and neither is a Queen or higher.
    Example: For A♠︎K♣︎, the value of the hand is still 10
    Example: For 2♠︎7♠︎, the value of the hand is still .5, which \
    will round to 1

    Round half values up. This is your final value.
"""
    let headerSeven = "Playing a Holdem Trainer Chen Game"
    let finalParagraph = """
    When playing a Holdem Trainer Chen Game, you will be presented \
    with 3 buttons each representing a hand. The buttons contain a \
    character representing the rank of the card, as well as \
    an "s" or an "o" to represented suited and non-suited hands. \
    Choose the hand with the highest value according the steps \
    described above. Timed versions of Chen Game include a 10 \
    second time limit.
    """
    
//case .spades: return "♠︎"
//case .hearts: return "♡"
//case .diamonds: return "♢"
//case .clubs: return "♣︎"
    
}

