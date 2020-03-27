//
//  MainPlayViewController.swift
//  MobProgramming
//
//  Created by HaroldDavidson on 3/12/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import UIKit
import AVFoundation

class MainPlayViewController: UIViewController {
    
    var time = roundLength * 60
    var timerIsRunning = false
    var timer = Timer()
    
    @objc func updateTimer() {
        if time >= 0 {
            calculateDisplayTime()
            time -= 1
        } else {
            // Play sound
            
            // Trigger modal
            
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
        label.font = timerLabelFont
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let colonLabel: UILabel = {
        let label = UILabel()
        label.font = timerLabelFont
        label.text = " : "
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let minutesLabel: UILabel = {
        let label = UILabel()
        label.font = timerLabelFont
        label.textAlignment = .right
        label.textColor = .white
        label.text = "05"
        return label
    }()
    
    let secondsLabel: UILabel = {
        let label = UILabel()
        label.font = timerLabelFont
        label.textAlignment = .left
        label.textColor = .white
        label.text = "31"
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
        
//        view.addSubview(timerLabel)
//        timerLabel.anchor(top: nameStackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        
        view.addSubview(startStopButton)
        startStopButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: -50, paddingRight: 20, width: 0, height: stackViewButtonHeight)
        
        calculateDisplayTime()
    }
    
    // MARK: Setting Up the StackView
    var imageStackView = UIStackView()
    var nameStackView = UIStackView()
    var timeStackView = UIStackView()
    
    func setupStackViews() {
        let screenHeight = UIScreen.main.bounds.size.height
        let screenWidth = UIScreen.main.bounds.size.width
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
        
        timeStackView = UIStackView(arrangedSubviews: [minutesLabel, colonLabel, secondsLabel])
        timeStackView.distribution = .fillEqually
        timeStackView.axis = .horizontal
        timeStackView.spacing = 1
        
        view.addSubview(timeStackView)
//        timeStackView.anchor(top: nameStackView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: screenWidth / 2, height: 100)
        
        timeStackView.topAnchor.constraint(equalTo: nameStackView.bottomAnchor, constant: 10).isActive = true
        timeStackView.widthAnchor.constraint(equalToConstant: screenWidth / 2).isActive = true
        timeStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        timeStackView.center = view.center
    }
    
    func calculateDisplayTime() {
        var minutes: Int = time / 60
        let seconds: Int = time % 60
        
        if(minutes < 1) {
            minutes = 00
        }
        
        timerLabel.text = "\(minutes):\(seconds)"
        
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
