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
    
    var audioPlayer: AVAudioPlayer?
    let pathToSound = Bundle.main.path(forResource: "timesUp", ofType: "wav")!
    
    var timerIsRunning = false
    var timer = Timer()
    
    @objc func updateTimer() {
        if currentRoundLength >= 0 {
            calculateDisplayTime()
            currentRoundLength -= 1
        } else {
            timer.invalidate()
            // Play sound
            let url = URL(fileURLWithPath: pathToSound)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {}
            
            triggerPopup()
            
            startStopButton.backgroundColor = .green
            startStopButton.setTitle("Start", for: .normal)
        }
    }
    
    // MARK: Creating UI components
    
    let driverImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "driver")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    let navigatorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
        return view
    }()
    
    let driverView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
        return view
    }()
    
    let navigatorImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "navigator")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
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
        label.text = ":"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let minutesLabel: UILabel = {
        let label = UILabel()
        label.font = timerLabelFont
        label.textAlignment = .center
        label.textColor = .white
        label.text = "05"
        return label
    }()
    
    let secondsLabel: UILabel = {
        let label = UILabel()
        label.font = timerLabelFont
        label.textAlignment = .center
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
    
    let popUpView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 5
        return view
    }()
    
    let roundOverLabel: UILabel = {
        let label = UILabel()
        label.text = "Round Over"
        label.font = buttonFont
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let nextRoundButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start Round", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(buttonTitleColor, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = buttonFont
        button.addTarget(self, action: #selector(nextRoundButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // ------- End of creating UI components ------- //
    
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
        
        imageStackView = UIStackView(arrangedSubviews: [driverView, navigatorView])
        imageStackView.distribution = .fillEqually
        imageStackView.axis = .horizontal
        imageStackView.spacing = playerStackSpacing
        
        view.addSubview(imageStackView)
        imageStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 30, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: stackViewHeight)
        
        driverView.addSubview(driverImage)
        driverImage.anchor(top: driverView.topAnchor, left: driverView.leftAnchor, bottom: driverView.bottomAnchor, right: driverView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: -10, paddingRight: 10, width: 0, height: 0)
        
        navigatorView.addSubview(navigatorImage)
        navigatorImage.anchor(top: navigatorView.topAnchor, left: navigatorView.leftAnchor, bottom: navigatorView.bottomAnchor, right: navigatorView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: -10, paddingRight: 10, width: 0, height: 0)
        
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
        timeStackView.anchor(top: nameStackView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: screenWidth * 0.5, height: 100)
        timeStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func triggerPopup() {
        view.addSubview(popUpView)
        popUpView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: -20, paddingRight: 20, width: 0, height: 0)
        
        
        view.addSubview(roundOverLabel)
        roundOverLabel.anchor(top: popUpView.topAnchor, left: popUpView.leftAnchor, bottom: nil, right: popUpView.rightAnchor, paddingTop: 5, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        
        view.addSubview(nextRoundButton)
        nextRoundButton.anchor(top: nil, left: popUpView.leftAnchor, bottom: popUpView.bottomAnchor, right: popUpView.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: -20, paddingRight: 20, width: 0, height: stackViewButtonHeight)
    }
    
    func calculateDisplayTime() {
        let minutes: Int = currentRoundLength / 60
        let seconds: Int = currentRoundLength % 60
        var minutesString = String()
        var secondsString = String()
        
        if(minutes > 1 && minutes < 10) {
            minutesString = "0\(minutes)"
        } else if (minutes < 1){
                minutesString = "00"
        } else {
            minutesString = String(minutes)
        }
        
        if (seconds < 10) {
            secondsString = "0\(seconds)"
        } else if (seconds == 0) {
            secondsString = "00"
        } else {
            secondsString = String(seconds)
        }
        
        minutesLabel.text = minutesString
        secondsLabel.text = secondsString
        
    }
    
    func nextRound() {
        
        // check if break time
        
        // dismiss the modal
        
        // update the navigator and driver labels
        
        // update the timer labels
        
        // increment the round counter
        if(memberIndex == members.count) {
            memberIndex = 0
        } else {
            memberIndex += 1
        }
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
    
    @objc func nextRoundButtonTapped() {
        popUpView.removeFromSuperview()
    }
}
