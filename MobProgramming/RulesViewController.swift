//
//  RulesViewController.swift
//  MobProgramming
//
//  Created by HaroldDavidson on 2/27/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import UIKit

class RulesViewController: UIViewController {

    let rulesConfirmationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("I Read the Rules", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
        button.setTitleColor(UIColor.rgb(red: 48, green: 48, blue: 48, alpha: 1), for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont(name: "Anton", size: 50)
        button.addTarget(self, action: #selector(completeRules), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(rulesClicked) {
            rulesConfirmationButton.isEnabled = false
        }
        view.addSubview(rulesConfirmationButton)
        rulesConfirmationButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 20, paddingRight: 20, width: 0, height: 0)
    }
    
    @objc func completeRules() {
        rulesClicked = true
        rulesConfirmationButton.isEnabled = false
        print("clicked")
    }
}
