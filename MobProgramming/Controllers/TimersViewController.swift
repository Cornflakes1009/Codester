//
//  TimersViewController.swift
//  MobProgramming
//
//  Created by HaroldDavidson on 3/5/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import UIKit

class TimersViewController: UIViewController, UITextFieldDelegate {
    let times = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
    
    let minsPerRoundLabel: UILabel = {
        let label = UILabel()
        label.text = "Select Minutes Per Round"
        label.font = instructionLabelFont
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let minutesPerRoundPickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = UIColor.rgb(red: 160, green: 160, blue: 160, alpha: 0.5)
        picker.layer.cornerRadius = 5
        return picker
    }()
    
    let minsPerBreakLabel: UILabel = {
        let label = UILabel()
        label.text = "Select Minutes Per Break"
        label.font = instructionLabelFont
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let minutesPerBreakPickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = UIColor.rgb(red: 160, green: 160, blue: 160, alpha: 0.5)
        picker.layer.cornerRadius = 5
        return picker
    }()
    
    let submitTimersButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Submit", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(UIColor.rgb(red: 48, green: 48, blue: 48, alpha: 1), for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = buttonFont
        button.addTarget(self, action: #selector(submitTimers), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: Setting Up The Views
    func setUpViews() {
        self.view.backgroundColor = UIColor(patternImage:  backgroundImage)
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        view.addSubview(minsPerRoundLabel)
        minsPerRoundLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        
        let screenHeight = UIScreen.main.bounds.size.height
        let pickerViewHeight = screenHeight * 0.20
        view.addSubview(minutesPerRoundPickerView)
        minutesPerRoundPickerView.anchor(top: minsPerRoundLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: pickerViewHeight)
        minutesPerRoundPickerView.delegate = self
        
        view.addSubview(minsPerBreakLabel)
        minsPerBreakLabel.anchor(top: minutesPerRoundPickerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        
        view.addSubview(minutesPerBreakPickerView)
        minutesPerBreakPickerView.anchor(top: minsPerBreakLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: pickerViewHeight)
        minutesPerBreakPickerView.delegate = self
        
        if(timersSet) {
            submitTimersButton.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
        }
        view.addSubview(submitTimersButton)
        submitTimersButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: -20, paddingRight: 20, width: 0, height: stackViewButtonHeight)
    }
    
    // MARK: Button Functions
    @objc func submitTimers() {
        timersSet = true
        submitTimersButton.backgroundColor = grayColor
        vibrate()
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
}

extension TimersViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return times.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(times[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == minutesPerRoundPickerView {
            roundLength = times[row]
            currentRoundLength = roundLength * 60
        } else {
            breakLength = times[row]
            currentBreakLength = breakLength * 60
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: String(times[row]), attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
}
