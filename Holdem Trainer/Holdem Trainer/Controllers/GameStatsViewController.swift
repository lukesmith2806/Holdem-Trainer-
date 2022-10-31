//
//  GameStatsViewController.swift
//  Holdem Trainer
//
//  Created by Luke Smith  on 10/31/22.
//

import UIKit

class GameStatsViewController: UIViewController {
    
        var gameName = String()
        let gameView = GameStatsView()
    
        override func viewDidLoad() {
        super.viewDidLoad()
        view = gameView

        // Do any additional setup after loading the view.
    }
    
    func setupViews(inputGame: String) {
        gameView.setup(game: inputGame)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
