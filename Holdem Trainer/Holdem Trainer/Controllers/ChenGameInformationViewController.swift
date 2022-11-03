//
//  ChenGameInformationViewController.swift
//  Holdem Trainer
//
//  Created by Luke Smith  on 11/3/22.
//

import UIKit

class ChenGameInformationViewController: UIViewController {
    let infoView = ChenGameInformationView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view = infoView
        edgesForExtendedLayout = []
        
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
