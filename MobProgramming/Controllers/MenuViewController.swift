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
        label.font = titleLabelFont
        label.textColor = .white
        label.backgroundColor = UIColor.rgb(red: 255, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    let instructionLabel: UILabel = {
        let label = UILabel()
        label.text = "Read and acknowledge the rules."
        label.font = instructionLabelFont
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let rulesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Rules", for: .normal)
        button.backgroundColor = grayColor
        button.setTitleColor(buttonTitleColor, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = buttonFont
        button.addTarget(self, action: #selector(rulesTapped), for: .touchUpInside)
        return button
    }()
    
    let membersButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Members", for: .normal)
        button.backgroundColor = grayColor
        button.setTitleColor(buttonTitleColor, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = buttonFont
        button.addTarget(self, action: #selector(membersTapped), for: .touchUpInside)
        return button
    }()
    
    let timersButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Timers", for: .normal)
        button.backgroundColor = grayColor
        button.setTitleColor(buttonTitleColor, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = buttonFont
        button.addTarget(self, action: #selector(timersTapped), for: .touchUpInside)
        return button
    }()
    
    let guidelinesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Guidelines", for: .normal)
        button.backgroundColor = grayColor
        button.setTitleColor(buttonTitleColor, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = buttonFont
        button.addTarget(self, action: #selector(guidelinesTapped), for: .touchUpInside)
        return button
    }()
    
    let beginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Mob!", for: .normal)
        button.backgroundColor = grayColor
        button.setTitleColor(buttonTitleColor, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = buttonFont
        button.isEnabled = false
        button.addTarget(self, action: #selector(beginButtonTapped), for: .touchUpInside)
        return button
    }()

    let explanationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("WHAT IS CODESTER?", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: "Anton", size: 25)
        button.addTarget(self, action: #selector(explanationButtonTapped), for: .touchUpInside)
        return button
    }()

    let creditsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Credits", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: "Anton", size: 25)
        button.addTarget(self, action: #selector(creditsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK:- Explanation Popup
    let popUpView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 5
        view.alpha = 0
        return view
    }()
    
    let popupViewTopLabel: UILabel = {
        let label = UILabel()
        label.text = "WHAT IS CODESTER?"
        label.font = buttonFont
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    let explanationLabel: UILabel = {
        let label = UILabel()
        label.text = "Codester is a tool to facilitate team work amongst developers. A group of developers work together to complete a single project and each person takes turns being the leader, collaborator, and the follower."
        label.font = rulesFont
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    let dismissPopupViewButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("DISMISS", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(buttonTitleColor, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = buttonFont
        button.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)

        // Setting buttons to be green/gray depending on what the user needs to do
        if !rulesClicked {
            setGreen(button: rulesButton)
        } else {
            setGray(button: rulesButton)
        }
        
        if rulesClicked && !membersSet {
            instructionLabel.text = "Enter group members."
            setGreen(button: membersButton)
        }
        
        if rulesClicked && membersSet && !timersSet {
            setGray(button: membersButton)
            instructionLabel.text = "Set the timers."
            setGreen(button: timersButton)
        }
        
        if rulesClicked && membersSet && timersSet && !guidelinesSet {
            setGray(button: timersButton)
            instructionLabel.text = "Enter the project guidelines."
            guidelinesButton.backgroundColor = .green
        }
        
        if rulesClicked && membersSet && timersSet && guidelinesSet {
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
    
    // Detecting if screen rotates and redrawing stack view
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            stackView.removeAllConstraints()
            setupStackView()
        } else {
            stackView.removeAllConstraints()
            setupStackView()
        }
    }
    
    // MARK:- Setting Up the Views
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
        
        view.addSubview(creditsButton)
        creditsButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: -10, paddingRight: 0, width: 0, height: 0)
        creditsButton.center = self.view.center
        
        view.addSubview(explanationButton)
        explanationButton.anchor(top: stackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        
        let buttons = [rulesButton, membersButton, timersButton, guidelinesButton, beginButton]
        configureVariableViews(on: screenHeight, titleLabel: titleLabel, instructionLabel: instructionLabel, buttons: buttons, creditsButton: creditsButton)
    }
    
    var stackView = UIStackView()
    // MARK: Setting Up the StackView
    func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [rulesButton, membersButton, timersButton, guidelinesButton, beginButton])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        let screenHeight = UIScreen.main.bounds.size.height
        let stackViewHeight = CGFloat(screenHeight / 2)
        stackViewButtonHeight = CGFloat((stackViewHeight - 40) / 5)
        
        view.addSubview(stackView)
        stackView.anchor(top: instructionLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: stackViewHeight)
    }
    
    func triggerExplanationPopup() {
        view.addSubview(popUpView)
        popUpView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, width: 0, height: 0)
        
        popUpView.addSubview(popupViewTopLabel)
        popupViewTopLabel.anchor(top: popUpView.topAnchor, left: popUpView.leftAnchor, bottom: nil, right: popUpView.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        
        popUpView.addSubview(explanationLabel)
        explanationLabel.anchor(top: popupViewTopLabel.bottomAnchor, left: popUpView.leftAnchor, bottom: nil, right: popUpView.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        
        popUpView.addSubview(dismissPopupViewButton)
        dismissPopupViewButton.anchor(top: nil, left: popUpView.leftAnchor, bottom: popUpView.bottomAnchor, right: popUpView.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: -20, paddingRight: 20, width: 0, height: 0)
        
        UIView.animate(withDuration: 0.5) {
            self.popUpView.alpha = 1
        }
    }
    
    // MARK: Button Functions
    @objc func rulesTapped() {
        let vc = self.storyboard?.instantiateViewController(identifier: "RulesViewController") as! RulesViewController
        self.navigationController?.pushViewController(vc, animated: true)
        vibrate()
    }
    
    @objc func membersTapped() {
        let vc = self.storyboard?.instantiateViewController(identifier: "MembersViewController") as! MembersViewController
        self.navigationController?.pushViewController(vc, animated: true)
        vibrate()
    }

    @objc func timersTapped() {
        let vc = self.storyboard?.instantiateViewController(identifier: "TimersViewController") as! TimersViewController
        self.navigationController?.pushViewController(vc, animated: true)
        vibrate()
    }
    
    @objc func guidelinesTapped() {
        let vc = self.storyboard?.instantiateViewController(identifier: "GuidelinesViewController") as! GuidelinesViewController
        self.navigationController?.pushViewController(vc, animated: true)
        vibrate()
    }
    
    @objc func beginButtonTapped() {
        let vc = self.storyboard?.instantiateViewController(identifier: "MainPlayViewController") as! MainPlayViewController
        self.navigationController?.pushViewController(vc, animated: true)
        vibrate()
    }
    
    @objc func explanationButtonTapped() {
        triggerExplanationPopup()
    }
    
    @objc func dismissButtonTapped() {
        UIView.animate(withDuration: 0.5) {
            self.popUpView.alpha = 0
        }
    }
    
    @objc func creditsButtonTapped() {
        let vc = self.storyboard?.instantiateViewController(identifier: "CreditsViewController") as! CreditsViewController
        self.navigationController?.pushViewController(vc, animated: true)
        vibrate()
    }
}
