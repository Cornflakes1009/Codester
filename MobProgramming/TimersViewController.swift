//
//  TimersViewController.swift
//  MobProgramming
//
//  Created by HaroldDavidson on 3/5/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import UIKit

class TimersViewController: UIViewController {
    let times = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
    
    // Minutes per round
    let minutesPerRoundLabel: UILabel = {
        let label = UILabel()
        label.text = "Minutes per round."
        //label.font = UIFont.systemFont(ofSize: 17)
        label.font = UIFont(name: "Anton", size: 25)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let minsutesPerRoundTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Select round length"
        tf.backgroundColor = UIColor.rgb(red: 232, green: 232, blue: 232, alpha: 1)
        tf.layer.cornerRadius = 5
        tf.textAlignment = .center
        tf.font = UIFont(name: "Anton", size: 20)
        return tf
    }()
    
    // Time per break
    let timePerBreakLabel: UILabel = {
        let label = UILabel()
        label.text = "Minutes per break."
        //label.font = UIFont.systemFont(ofSize: 17)
        label.font = UIFont(name: "Anton", size: 25)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let minutesPerBreakTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Select break length"
        tf.backgroundColor = UIColor.rgb(red: 232, green: 232, blue: 232, alpha: 1)
        tf.layer.cornerRadius = 5
        tf.textAlignment = .center
        tf.font = UIFont(name: "Anton", size: 20)
        return tf
    }()
    
    // Break frequency
    let roundsPerBreakLabel: UILabel = {
        let label = UILabel()
        label.text = "Turns before break."
        label.font = UIFont(name: "Anton", size: 25)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let breakFrequencyTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Select break frequency"
        tf.backgroundColor = UIColor.rgb(red: 232, green: 232, blue: 232, alpha: 1)
        tf.layer.cornerRadius = 5
        tf.textAlignment = .center
        tf.font = UIFont(name: "Anton", size: 20)
        return tf
    }()
    
    let submitTimersButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Submit", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(UIColor.rgb(red: 48, green: 48, blue: 48, alpha: 1), for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont(name: "Anton", size: 50)
        button.addTarget(self, action: #selector(submitTimers), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: (UIImage(named: "dark-honeycomb.png")!))
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        setupStackView()
        
        if(timersSet) {
            submitTimersButton.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
        }
        view.addSubview(submitTimersButton)
        submitTimersButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: -20, paddingRight: 20, width: 0, height: stackViewButtonHeight)
    }

        func setupStackView() {
            let stackView = UIStackView(arrangedSubviews: [minsutesPerRoundTextField, minutesPerBreakTextField, breakFrequencyTextField])
            stackView.distribution = .fillEqually
            stackView.axis = .vertical
            stackView.spacing = 10
            
            view.addSubview(stackView)
            
            
            //let screenHeight = UIScreen.main.bounds.size.height
            // Calculating screen height based on the initial height of the first buttons times the number of buttons and adding 20 (10 for each space)
            let stackViewHeight = (stackViewButtonHeight * 3) + 20
            print(stackViewHeight)
    //        if(screenHeight < 569) {
    //            stackViewHeight = 296
    //        }

            stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: stackViewHeight)
        }
    
    @objc func submitTimers() {
        timersSet = true
        submitTimersButton.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
        // TODO: get min per round, break length, and break frequency
        
        
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
}
