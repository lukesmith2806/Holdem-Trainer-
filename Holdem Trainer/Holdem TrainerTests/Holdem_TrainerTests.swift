//
//  Holdem_TrainerTests.swift
//  Holdem TrainerTests
//
//  Created by Luke Smith  on 10/25/22.
//

import XCTest
import PlayingCard
@testable import Holdem_Trainer

class Holdem_TrainerTests: XCTestCase {
    var sut: ChenGuesserGame!
 
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = ChenGuesserGame()
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testWhenGivenIsWrongAndNotTied() {
        
        //given
        let cardOne = PlayingCard(rank: .two, suit: .clubs)
        let cardTwo = PlayingCard(rank: .seven, suit: .spades)
        //initialize test ChenHand: 27o
        let testHand = ChenHand(handArray: [cardOne, cardTwo])
        
        //Initialize handOne to be compared Against: AAo
        let comparisonHandOne = ChenHand(handArray: [PlayingCard(rank: .ace, suit: .spades), PlayingCard(rank: .ace, suit: .diamonds)])
        
        //Initialize handTwo to be compared Against: KKo
        let comparisonHandTwo = ChenHand(handArray: [PlayingCard(rank: .king, suit: .spades), PlayingCard(rank: .king, suit: .clubs)])
        
        
        //when
        let result = sut.checkValue(handArray: [testHand, comparisonHandOne, comparisonHandTwo], chosenHand: testHand)
        
        
        //then
        XCTAssertEqual(result, false)
    }
    
    func testWhenGivenIsRightAndNotTied() {
        
        //given
        let cardOne = PlayingCard(rank: .ace, suit: .clubs)
        let cardTwo = PlayingCard(rank: .king, suit: .clubs)
        //initialize test ChenHand: AKs
        let testHand = ChenHand(handArray: [cardOne, cardTwo])
        
        //Initialize handOne to be compared Against: 27o
        let comparisonHandOne = ChenHand(handArray: [PlayingCard(rank: .two, suit: .spades), PlayingCard(rank: .seven, suit: .diamonds)])
        
        //Initialize handTwo to be compared Against: 56s
        let comparisonHandTwo = ChenHand(handArray: [PlayingCard(rank: .five, suit: .spades), PlayingCard(rank: .six, suit: .spades)])
        
        
        //when
        let result = sut.checkValue(handArray: [testHand, comparisonHandOne, comparisonHandTwo], chosenHand: testHand)
        
        
        //then
        XCTAssertEqual(result, true)
    }
    
    func testWhenResultIsRightAndTied() {
        
        //given
        let cardOne = PlayingCard(rank: .ace, suit: .clubs)
        let cardTwo = PlayingCard(rank: .king, suit: .clubs)
        //initialize test ChenHand: AKs
        let testHand = ChenHand(handArray: [cardOne, cardTwo])
        
        //Initialize handOne to be compared Against: 27o
        let comparisonHandOne = ChenHand(handArray: [PlayingCard(rank: .two, suit: .spades), PlayingCard(rank: .seven, suit: .diamonds)])
        
        //Initialize handTwo to be compared Against: 56s
        let comparisonHandTwo = ChenHand(handArray: [PlayingCard(rank: .ace, suit: .spades), PlayingCard(rank: .king, suit: .spades)])
        
        
        //when
        let result = sut.checkValue(handArray: [testHand, comparisonHandOne, comparisonHandTwo], chosenHand: testHand)
        
        
        //then
        XCTAssertEqual(result, true)
    }
    
    func testWhenHandOneIsGreater() {
        
        //given
        
        //initialize handOne with Ace of Spades and Ace of Diamonds: Value 20
        let handOne = ChenHand(handArray: [PlayingCard(rank: .ace, suit: .spades), PlayingCard(rank: .ace, suit: .diamonds)])
        
        //initialize handTwo with Two of Spades and Ace of Diamonds
        let handTwo = ChenHand(handArray: [PlayingCard(rank: .two, suit: .spades), PlayingCard(rank: .ace, suit: .diamonds)])
        
        
        //when
        let result = handOne > handTwo
        
        //then
        XCTAssertEqual(result, true)
        
    }
    
    func testWhenHandsAreEqual() {
        
        //given
        
        //initialize handOne with Ace of Spades and Ace of Diamonds: Value 20
        let handOne = ChenHand(handArray: [PlayingCard(rank: .ace, suit: .spades), PlayingCard(rank: .ace, suit: .diamonds)])
        
        //initialize handTwo with Ace of Clubs and Ace of Hearts
        let handTwo = ChenHand(handArray: [PlayingCard(rank: .ace, suit: .clubs), PlayingCard(rank: .ace, suit: .hearts)])
        
        
        //when
        let result = handOne == handTwo
        
        //then
        XCTAssertEqual(result, true)
        
    }
 
    func testWhenHandOneIsLess() {
        
        //given
        
        //initialize handOne with Ace of Spades and Ace of Diamonds: Value 20
        let handOne = ChenHand(handArray: [PlayingCard(rank: .two, suit: .spades), PlayingCard(rank: .seven, suit: .diamonds)])
        
        //initialize handTwo with Two of Spades and Ace of Diamonds
        let handTwo = ChenHand(handArray: [PlayingCard(rank: .two, suit: .spades), PlayingCard(rank: .ace, suit: .diamonds)])
        
        
        //when
        let result = handOne < handTwo
        
        //then
        XCTAssertEqual(result, true)
        
    }

}


