//
//  MainPlayViewController.swift
//  MobProgramming
//
//  Created by HaroldDavidson on 3/12/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import UIKit

class MainPlayViewController: UIViewController {
    
    var seconds = roundLength * 60
    var timerIsRunning = false
    var timer = Timer()
    
    @objc func updateTimer() {
        if seconds >= 0 {
            timerLabel.text = "\(seconds)"
            seconds -= 1
        }
    }
    
    let driverImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "driver")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
        image.layer.cornerRadius = 10
        return image
    }()
    
    let navigatorImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "navigator")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
        return image
    }()
    
    let driverLabel: UILabel = {
        let label = UILabel()
        label.text = "Driver"
        label.font = playerLabelFont
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let navigatorLabel: UILabel = {
        let label = UILabel()
        label.text = "Navigator"
        label.font = playerLabelFont
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "\(roundLength * 60)"
        label.font = timerLabelFont
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let startStopButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(buttonTitleColor, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = buttonFont
        button.addTarget(self, action: #selector(startStopTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: Setting Up the Views
    func setUpViews() {
        view.backgroundColor = .black
        self.view.backgroundColor = UIColor(patternImage:  backgroundImage)
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        setupStackViews()
        
        view.addSubview(timerLabel)
        timerLabel.anchor(top: nameStackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        
        view.addSubview(startStopButton)
        startStopButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: -50, paddingRight: 20, width: 0, height: stackViewButtonHeight)
        

    }
    
    // MARK: Setting Up the StackView
    var imageStackView = UIStackView()
    var nameStackView = UIStackView()
    
    func setupStackViews() {
        let screenHeight = UIScreen.main.bounds.size.height
        let stackViewHeight = CGFloat(screenHeight / 5)
        
        imageStackView = UIStackView(arrangedSubviews: [driverImage, navigatorImage])
        imageStackView.distribution = .fillEqually
        imageStackView.axis = .horizontal
        imageStackView.spacing = playerStackSpacing
        
        view.addSubview(imageStackView)
        imageStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 30, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: stackViewHeight)

        
        nameStackView = UIStackView(arrangedSubviews: [driverLabel, navigatorLabel])
        nameStackView.distribution = .fillEqually
        nameStackView.axis = .horizontal
        nameStackView.spacing = playerStackSpacing
        
        view.addSubview(nameStackView)
        nameStackView.anchor(top: imageStackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 100)
    }
    
    @objc func startStopTapped() {
        if(timerIsRunning == false) {
            timerIsRunning = true
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(MainPlayViewController.updateTimer)), userInfo: nil, repeats: true)
            startStopButton.backgroundColor = .red
            startStopButton.setTitle("Stop", for: .normal)
        } else if(timerIsRunning == true) {
            timerIsRunning = false
            timer.invalidate()
            startStopButton.backgroundColor = .green
            startStopButton.setTitle("Start", for: .normal)
        }
    }
}
