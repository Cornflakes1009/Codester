//
//  CreditsViewController.swift
//  MobProgramming
//
//  Created by HaroldDavidson on 3/12/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import UIKit

class CreditsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        
    }
   
    func setUpViews() {
        self.view.backgroundColor = UIColor(patternImage: (UIImage(named: "dark-honeycomb.png")!))
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        let screenHeight = UIScreen.main.bounds.size.height
        if(screenHeight < 569) {
            
        }
    }


}
