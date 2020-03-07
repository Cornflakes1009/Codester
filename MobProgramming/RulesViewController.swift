//
//  RulesViewController.swift
//  MobProgramming
//
//  Created by HaroldDavidson on 2/27/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import UIKit

class RulesViewController: UIViewController {
    
    let rulesTextView: UITextView = {
        let tv = UITextView()
        tv.text = """
        The goal of mob programming:
        Mob programming is meant to facilitate the collaboration of programmers of all levels to work together and build a common app on a single computer.
        
        How mob programming works:
        First, whomever is closest to the phone/tablet that you’re using for this app, enter the names of the group starting with their own and going clockwise. Discuss how long each round should be and how long and frequent breaks should be. Enter those times. Start the timer. This person is now the navigator and the driver is the person to their left. The navigator now reads the rules out loud.
        
        Rules:
        1. Be respectful to each other and their property. No greasy pizza fingers!
        2. The navigator is the only person allowed to direct the driver.
        3. The navigator should discuss with the other group members on the next steps, but only the navigator is allowed to direct the driver.
        4. The navigator has the final say in all matters related to the project during the navigator’s turn.
        5. Once the timer runs out, pass the role of navigator and driver to the next group members specified.
        6. The navigator discusses with the entire group to determine what they’ll build and what the requirements of “done” are. The navigator will instruct the driver to write this down.
        7. Follow the app to determine turns and breaks.
        8. Mob programming is over when the app is complete or the session time runs out. Ex. 6pm-8pm.
        """
        tv.textColor = .white
        tv.backgroundColor = .clear
        tv.isEditable = false
        tv.isSelectable = false
        tv.isScrollEnabled = false
        return tv
    }()

    let rulesConfirmationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("I Read the Rules", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(UIColor.rgb(red: 48, green: 48, blue: 48, alpha: 1), for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont(name: "Anton", size: 50)
        button.addTarget(self, action: #selector(completeRules), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: (UIImage(named: "dark-honeycomb.png")!))
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        let screenHeight = UIScreen.main.bounds.size.height
        if(screenHeight < 569) {
            rulesConfirmationButton.titleLabel?.font = UIFont(name: "Anton", size: 40)
        }
        let textViewHeight = CGFloat(screenHeight * 0.75)
        view.addSubview(rulesTextView)
        rulesTextView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: textViewHeight)
        if(rulesClicked) {
            rulesConfirmationButton.isEnabled = false
            rulesConfirmationButton.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
        }
        view.addSubview(rulesConfirmationButton)
        rulesConfirmationButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: -20, paddingRight: 20, width: 0, height: stackViewButtonHeight)
    }
    
    @objc func completeRules() {
        rulesClicked = true
        rulesConfirmationButton.isEnabled = false
        rulesConfirmationButton.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
        // Dismissing the ViewController once the user confirms the rules
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
}
