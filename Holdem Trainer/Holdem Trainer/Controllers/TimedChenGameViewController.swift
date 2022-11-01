//
//  TimedChenGameViewController.swift
//  Holdem Trainer
//
//  Created by Luke Smith  on 10/31/22.
//

import UIKit

class TimedChenGameViewController: UIViewController {
    let gameTime = 10
    let chenGame = ChenGuesserGame()
    let gameView  = TimedChenGameView()
    let stopWatch = Stopwatch()
    
    var runTime = 10
    var gameDict: [ChenGameButton:ChenHand] = [:]
    var highScore = 0
    var timer: Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = gameView
        for btn in gameView.buttonArray {
            btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
        gameRun()
        startTimer()
        stopWatch.start()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("gone")
    }
    
    func gameRun() {
        gameDict.removeAll()
        let tempButtonArray = chenGame.runGame(numberOfHands: 3)
        var tempStringArray = [String]()
        for i in 0..<tempButtonArray.count {
            let btn = gameView.buttonArray[i]
            tempStringArray.append(tempButtonArray[i].description)
            gameDict[btn] = tempButtonArray[i]
        }
        gameView.updateSubviews(tempStringArray, score: highScore)
        stopWatch.start()
        
    }
    
    func startGame() {
        runTime = 10
        startTimer()
        
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(decrementCountLabel), userInfo: nil, repeats: true)
    }
    
    func stopGame() {
        
        timer.invalidate()
    }
    
    func submitAttempt(time: Int, isCorrect: Bool) {
        let attempt = GameAttempt(name: "Timed Chen Game", correct: isCorrect, time: time)
        DataManager.shared.add(gameAttempt: attempt)
    
    }
    
    func newAttempt() {
        
    }
    
    func submitAttempt() {
        
    }
    
    @objc func decrementCountLabel() {
        runTime -= 1
        gameView.updateTimeLabel(input: String(runTime))
        if (runTime <= 0) {
            timer.invalidate()
        }
    }
    
    @objc func buttonTapped(sender: ChenGameButton) {
        guard let buttonText = sender.titleLabel?.text, let hand = gameDict[sender] else {
            print("Button text is nil")
            return
        }
        let attemptTime = stopWatch.elapsedTimeMilliseconds()
        stopWatch.stop()
       
        if (chenGame.checkValue(handArray: Array(gameDict.values), chosenHand: hand) == true) {
            highScore += 1
            submitAttempt(time: attemptTime, isCorrect: true)
            gameRun()
            
        } else {
            highScore = 0
            submitAttempt(time: attemptTime, isCorrect: false)
            gameRun()
        }
       
        
        sender.hapticExtraHeavy()
        sender.shake()
        
    }
}
