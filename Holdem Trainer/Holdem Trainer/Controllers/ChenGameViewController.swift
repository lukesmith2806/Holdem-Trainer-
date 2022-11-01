//
//  ViewController.swift
//  PokerBuddy
//
//  Created by Luke Smith  on 4/4/22.
//
import UIKit
import Logging
class ChenGameViewController: UIViewController {
    var highScore = 0
    let chenGame = ChenGuesserGame()
    var gameDict: [ChenGameButton:ChenHand] = [:]
    let gameView = ChenGameView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = gameView
        for btn in gameView.buttonArray {
            btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
            
        
        gameRun()
    }
    func gameRun()  {
        gameDict.removeAll()
        let tempButtonArray = chenGame.runGame(numberOfHands: 3)
        var tempStringArray = [String]()
        for i in 0..<tempButtonArray.count {
            let btn = gameView.buttonArray[i]
            tempStringArray.append(tempButtonArray[i].description)
            gameDict[btn] = tempButtonArray[i]
        }
        gameView.updateSubviews(tempStringArray, score: highScore)
    
    }
    
   
    @objc func buttonTapped(sender: ChenGameButton) {
        guard let buttonText = sender.titleLabel?.text, let hand = gameDict[sender] else {
            print("Button text is nil")
            return
        }
        // updating highScore
        
        print("Button Text: \(buttonText)")
        print("chosen \(hand) \(hand.handValue())")
   
        if (chenGame.checkValue(handArray: Array(gameDict.values), chosenHand: hand) == true) {
            highScore += 1
          
            gameRun()
        } else {
            highScore = 0
            
            gameRun()
        }
            // updates DB
      
            
        
        sender.hapticExtraHeavy()
        sender.shake()
    }
    
    
}
