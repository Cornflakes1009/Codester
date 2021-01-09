//
//  GuidelinesViewController.swift
//  MobProgramming
//
//  Created by HaroldDavidson on 3/5/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import UIKit

class GuidelinesViewController: UIViewController {

    let screenHeight = UIScreen.main.bounds.size.height
    var textViewHeight: CGFloat = 0
    
    let guidelinesTextView: UITextView = {
        let tv = UITextView()
        tv.layer.cornerRadius = 5
        tv.text = guidelines
        tv.font = rulesFont
        tv.textColor = .black
        tv.backgroundColor = .white
        tv.isScrollEnabled = true
        tv.addDoneButtonOnKeyboard()
        return tv
    }()
    
    let saveGuidelinesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(UIColor.rgb(red: 48, green: 48, blue: 48, alpha: 1), for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = buttonFont
        button.addTarget(self, action: #selector(saveGuidelinesTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: Keyboard Responders - listening for the keyboard
    func addKeyboardResponders() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    deinit {
        // Stop listening for keyboard show/hide events
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    // MARK: Setting Up the Views
    func setUpViews() {
        self.view.backgroundColor = UIColor(patternImage:  backgroundImage)
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        textViewHeight = CGFloat(screenHeight * 0.7)
        
        if(guidelines != "") {
            saveGuidelinesButton.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
        }
        
        view.addSubview(guidelinesTextView)
        setupTextViewConstraints()
        
        view.addSubview(saveGuidelinesButton)
        saveGuidelinesButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: -20, paddingRight: 20, width: 0, height: stackViewButtonHeight)
        
        addKeyboardResponders()
    }
    
    // Moving the view up and down when the keyboard is opened/closed
    @objc func keyboardWillChange(notification: Notification) {
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        if notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardWillChangeFrameNotification {
            view.frame.origin.y = -keyboardRect.height
            // Adding a magic number based on adding 20 padding to the top and bottom of the submit button
            let textViewHeight = screenHeight - keyboardRect.height - stackViewButtonHeight - 40 - topbarHeight
            guidelinesTextView.removeAllConstraints()
            guidelinesTextView.anchor(top: nil, left: view.leftAnchor, bottom: saveGuidelinesButton.topAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: -20, paddingRight: 20, width: 0, height: textViewHeight)
            
        } else {
            view.frame.origin.y = 0
            guidelinesTextView.removeAllConstraints()
            setupTextViewConstraints()
        }
    }
    
    func setupTextViewConstraints() {
        guidelinesTextView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: textViewHeight)
    }
    
    @objc func saveGuidelinesTapped() {
        if let guidelinesText = guidelinesTextView.text {
            guidelinesSet = true
            guidelines = guidelinesText
        }
        if(guidelines.trim() != "") {
            saveGuidelinesButton.backgroundColor = grayColor
            vibrate()
            // Dismissing the ViewController once the user saves the guidelines
            self.navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
        } else {
            saveGuidelinesButton.backgroundColor = .green
        }
    }
}
