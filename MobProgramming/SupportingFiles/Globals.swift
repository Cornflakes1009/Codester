//
//  Globals.swift
//  MobProgramming
//
//  Created by HaroldDavidson on 2/27/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

// These are variables that are passed around multiple views

import UIKit

let backgroundImage                 =   UIImage(named: "dark-honeycomb.png")!
var members                         =   [String]()
var memberIndex                     =   0
var roundLength                     =   1
var currentRoundLength              =   60
var breakLength                     =   0
var currentBreakLength              =   0
var guidelines                      =   String()
var rulesClicked                    =   false
var membersSet                      =   false
var timersSet                       =   false
var guidelinesSet                   =   false
var breakTime                       =   false
var stackViewButtonHeight: CGFloat  =   0
let grayColor                       =   UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
let buttonTitleColor                =   UIColor.rgb(red: 48, green: 48, blue: 48, alpha: 1)
var titleLabelFont                  =   UIFont(name: "Mobsters", size: 90)
var instructionLabelFont            =   UIFont(name: "Anton", size: 20)
var buttonFont                      =   UIFont(name: "Anton", size: 50)
var rulesFont                       =   UIFont.systemFont(ofSize: 15)
var playerLabelFont                 =   UIFont(name: "Anton", size: 30)
var timerLabelFont                  =   UIFont(name: "Anton", size: 50)
var playerStackSpacing: CGFloat     =   20

// MARK: Setting Button Green
func setGreen(button: UIButton) {
    button.backgroundColor = .green
}

// MARK: Setting Button Gray
func setGray(button: UIButton) {
    button.backgroundColor = grayColor
}

// MARK: Screen Sizes - h x w
/*
 iPhones
 11 Pro, Xs, X                    =       812 x 375
 11 Pro Max, 11, Xs Max, XR       =       896 x 414
 8+, 7+                           =       736 x 414
 8, 7, 6s, 6s+, 6+, 6             =       667 x 375
 SE                               =       568 x 320


 iPads
 12.9" Pro 1-2                    =       1366 x 1024
 10.5" Pro, Air 3                 =       1112 x 834
 9.7" Pro, Air 2, Mini 5          =       1024 x 768
*/

enum Devices: CGFloat {
    case elevenHeight               =     812
    case elevenProMaxHeight         =     896
    case eightPlusHeight            =     736
    case eightHeight                =     667
    case sEHeight                   =     568
    case bigiPadProHeight           =     1366
    case airThreeHeight             =     1112
    case airTwoHeight               =     1024
}

/*
 Getting the size of the view and setting specific UI elements
 */
func configureVariableViews(on screenSize: CGFloat, titleLabel: UILabel, instructionLabel: UILabel, buttons: [UIButton], creditsButton: UIButton) {
    switch screenSize {
    case Devices.elevenHeight.rawValue:
        buttonFont = UIFont(name: "Anton", size: 50)
    case Devices.elevenProMaxHeight.rawValue:
        buttonFont = UIFont(name: "Anton", size: 50)
    case Devices.eightPlusHeight.rawValue:
        buttonFont = UIFont(name: "Anton", size: 50)
    case Devices.eightHeight.rawValue:
        buttonFont = UIFont(name: "Anton", size: 50)
        
    case Devices.sEHeight.rawValue:
        creditsButton.titleLabel?.font = UIFont(name: "Anton", size: 25)
        
    case Devices.bigiPadProHeight.rawValue:
        buttonFont = UIFont(name: "Anton", size: 50)
        
        
        
    case Devices.airThreeHeight.rawValue:
        buttonFont = UIFont(name: "Anton", size: 100)
        titleLabelFont = UIFont(name: "Mobsters", size: 200)
        titleLabel.font = titleLabelFont
        instructionLabelFont = UIFont(name: "Anton", size: 50)
        instructionLabel.font = instructionLabelFont
        creditsButton.titleLabel?.font = UIFont(name: "Anton", size: 50)
        rulesFont = UIFont.systemFont(ofSize: 24)
    
    case Devices.airTwoHeight.rawValue:
        buttonFont = UIFont(name: "Anton", size: 50)
    default:
        buttonFont = UIFont(name: "Anton", size: 50)
        return
    }
    
    for button in buttons {
        button.titleLabel?.font = buttonFont
    }
}


