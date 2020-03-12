//
//  RulesViewController.swift
//  MobProgramming
//
//  Created by HaroldDavidson on 2/27/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Codester"
        label.textAlignment = .center
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 3.0
        label.layer.shadowOpacity = 1.0
        label.layer.shadowOffset = CGSize(width: 4, height: 4)
        label.layer.masksToBounds = false
        label.font = UIFont(name: "Mobsters", size: 90)
        label.textColor = .white
        label.backgroundColor = UIColor.rgb(red: 255, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    let instructionLabel: UILabel = {
        let label = UILabel()
        label.text = "Read and acknowledge the rules."
        //label.font = UIFont.systemFont(ofSize: 17)
        label.font = UIFont(name: "Anton", size: 20)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let rulesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Rules", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
        button.setTitleColor(UIColor.rgb(red: 48, green: 48, blue: 48, alpha: 1), for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont(name: "Anton", size: 50)
        button.addTarget(self, action: #selector(rulesTapped), for: .touchUpInside)
        return button
    }()
    
    let membersButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Members", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
        button.setTitleColor(UIColor.rgb(red: 48, green: 48, blue: 48, alpha: 1), for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont(name: "Anton", size: 50)
        button.addTarget(self, action: #selector(membersTapped), for: .touchUpInside)
        return button
    }()
    
    let timersButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Timers", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
        button.setTitleColor(UIColor.rgb(red: 48, green: 48, blue: 48, alpha: 1), for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont(name: "Anton", size: 50)
        button.addTarget(self, action: #selector(timersTapped), for: .touchUpInside)
        return button
    }()
    
    let guidelinesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Guidelines", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
        button.setTitleColor(UIColor.rgb(red: 48, green: 48, blue: 48, alpha: 1), for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont(name: "Anton", size: 50)
        button.addTarget(self, action: #selector(guidelinesTapped), for: .touchUpInside)
        return button
    }()
    
    let beginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Mob!", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
        button.setTitleColor(UIColor.rgb(red: 48, green: 48, blue: 48, alpha: 1), for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont(name: "Anton", size: 50)
        button.isEnabled = false
        //button.addTarget(self, action: #selector(beginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        if(rulesClicked == false) {
            setGreen(button: rulesButton)
        } else if(membersSet == false) {
            setGray(button: rulesButton)
            instructionLabel.text = "Enter group members."
            setGreen(button: membersButton)
        } else if(timersSet == false) {
            setGray(button: membersButton)
            instructionLabel.text = "Set the timers."
            setGreen(button: timersButton)
        }else if(guidelinesSet == false) {
            timersButton.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
            instructionLabel.text = "Enter the project guidelines."
            guidelinesButton.backgroundColor = .green
        } else {
            setGray(button: rulesButton)
            setGray(button: membersButton)
            setGray(button: timersButton)
            setGray(button: guidelinesButton)
            instructionLabel.text = "Press begin and enjoy mobbing."
            setGreen(button: beginButton)
            beginButton.isEnabled = true
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: Setting Up the Views
    func setUpViews() {
        view.backgroundColor = .black
        self.view.backgroundColor = UIColor(patternImage:  backgroundImage)
        let screenHeight = UIScreen.main.bounds.size.height
        let fifthOfScreenHeight = screenHeight / 5
        view.addSubview(titleLabel)

        titleLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: fifthOfScreenHeight)
        
        view.addSubview(instructionLabel)
        instructionLabel.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        
        setupStackView()
    }
    
    // MARK: Setting Button Colors
    func setGreen(button: UIButton) {
        button.backgroundColor = .green
    }
    
    func setGray(button: UIButton) {
        button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
    }

    // MARK: Setting Up the StackView
    func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [rulesButton, membersButton, timersButton, guidelinesButton, beginButton])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        view.addSubview(stackView)
        
        let screenHeight = UIScreen.main.bounds.size.height
        let stackViewHeight = CGFloat(screenHeight / 2)
        stackViewButtonHeight = CGFloat((stackViewHeight - 40) / 5)
        stackView.anchor(top: instructionLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: stackViewHeight)
    }
    
    // MARK: Button Functions
    @objc func rulesTapped() {
        let vc = self.storyboard?.instantiateViewController(identifier: "RulesViewController") as! RulesViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func membersTapped() {
        let vc = self.storyboard?.instantiateViewController(identifier: "MembersViewController") as! MembersViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func timersTapped() {
        let vc = self.storyboard?.instantiateViewController(identifier: "TimersViewController") as! TimersViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func guidelinesTapped() {
        let vc = self.storyboard?.instantiateViewController(identifier: "GuidelinesViewController") as! GuidelinesViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func beginButtonTapped() {
        let vc = self.storyboard?.instantiateViewController(identifier: "RulesViewController") as! RulesViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
