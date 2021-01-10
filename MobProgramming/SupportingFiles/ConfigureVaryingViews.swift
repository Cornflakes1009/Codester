//
//  ConfigureVaryingViews.swift
//  MobProgramming
//
//  Created by HaroldDavidson on 1/1/21.
//  Copyright © 2021 HaroldDavidson. All rights reserved.
//

import UIKit

// MARK: Screen Sizes - h x w
/*
 
 https://developer.apple.com/library/archive/documentation/DeviceInformation/Reference/iOSDeviceCompatibility/Displays/Displays.html
 
 iPhones
 12 Pro Max                       =       926 x 428
 12, 12 Pro                       =       844 x 390
 11 Pro, Xs, X, 12m               =       812 x 375
 11 Pro Max, 11, Xs Max, XR       =       896 x 414
 8+, 7+                           =       736 x 414
 8, 7, 6s, 6s+, 6+, 6, SE2        =       667 x 375
 SE, Touch 7                      =       568 x 320


 iPads
 12.9" Pro 1-2                    =       1366 x 1024
 Air 4                            =       1180 x 820
 10.5" Pro, Air 3                 =       1112 x 834
 9.7" Pro, Air 2, Mini 5          =       1024 x 768
 11" Pro                         =       1194 x 835
*/

enum Devices: CGFloat {
    case twelveAndProHeight         =     844
    case elevenAndProMaxHeight      =     896
    case elevenProHeight            =     812
    case eightPlusHeight            =     736
    case eightHeight                =     667
    case sEHeight                   =     568
    case bigiPadProHeight           =     1366
    case airThreeHeight             =     1112
    case airTwoHeight               =     1024
    case airFourHeight              =     1180
    case proElevenInchHeight        =     1194
}

/*
 Getting the size of the view and setting specific UI elements
 */
func configureVariableViews(on screenSize: CGFloat, titleLabel: UILabel, instructionLabel: UILabel, buttons: [UIButton], creditsButton: UIButton, emailButton: UIButton, explanationButton: UIButton) {
    switch screenSize {
    case Devices.elevenAndProMaxHeight.rawValue:
        buttonFont = UIFont(name: "Anton", size: 55)
        titleLabelFont = UIFont(name: "Mobsters", size: 110)
        titleLabel.font = titleLabelFont
        instructionLabelFont = UIFont(name: "Anton", size: 25)
        instructionLabel.font = instructionLabelFont
        creditsButton.titleLabel?.font = UIFont(name: "Anton", size: 30)
        emailButton.titleLabel?.font = UIFont(name: "Anton", size: 30)
        explanationButton.titleLabel?.font = UIFont(name: "Anton", size: 30)
        rulesFont = UIFont.systemFont(ofSize: 18)
        
    case Devices.twelveAndProHeight.rawValue:
        buttonFont = UIFont(name: "Anton", size: 50)
        titleLabelFont = UIFont(name: "Mobsters", size: 100)
        titleLabel.font = titleLabelFont
        instructionLabelFont = UIFont(name: "Anton", size: 20)
        instructionLabel.font = instructionLabelFont
        creditsButton.titleLabel?.font = UIFont(name: "Anton", size: 25)
        emailButton.titleLabel?.font = UIFont(name: "Anton", size: 25)
        explanationButton.titleLabel?.font = UIFont(name: "Anton", size: 25)
        rulesFont = UIFont.systemFont(ofSize: 18)
        
    case Devices.elevenProHeight.rawValue:
        buttonFont = UIFont(name: "Anton", size: 50)
        titleLabelFont = UIFont(name: "Mobsters", size: 100)
        titleLabel.font = titleLabelFont
        instructionLabelFont = UIFont(name: "Anton", size: 23)
        instructionLabel.font = instructionLabelFont
        creditsButton.titleLabel?.font = UIFont(name: "Anton", size: 30)
        emailButton.titleLabel?.font = UIFont(name: "Anton", size: 30)
        explanationButton.titleLabel?.font = UIFont(name: "Anton", size: 30)
        rulesFont = UIFont.systemFont(ofSize: 18)
        
    case Devices.eightPlusHeight.rawValue:
        buttonFont = UIFont(name: "Anton", size: 50)
        titleLabelFont = UIFont(name: "Mobsters", size: 100)
        titleLabel.font = titleLabelFont
        instructionLabelFont = UIFont(name: "Anton", size: 23)
        instructionLabel.font = instructionLabelFont
        creditsButton.titleLabel?.font = UIFont(name: "Anton", size: 30)
        emailButton.titleLabel?.font = UIFont(name: "Anton", size: 30)
        explanationButton.titleLabel?.font = UIFont(name: "Anton", size: 30)
        rulesFont = UIFont.systemFont(ofSize: 18)
        
    case Devices.eightHeight.rawValue:
        buttonFont = UIFont(name: "Anton", size: 50)
        titleLabelFont = UIFont(name: "Mobsters", size: 100)
        titleLabel.font = titleLabelFont
        instructionLabelFont = UIFont(name: "Anton", size: 23)
        instructionLabel.font = instructionLabelFont
        creditsButton.titleLabel?.font = UIFont(name: "Anton", size: 30)
        emailButton.titleLabel?.font = UIFont(name: "Anton", size: 30)
        explanationButton.titleLabel?.font = UIFont(name: "Anton", size: 30)
        rulesFont = UIFont.systemFont(ofSize: 18)
        
    case Devices.sEHeight.rawValue:
        buttonFont = UIFont(name: "Anton", size: 50)
        titleLabelFont = UIFont(name: "Mobsters", size: 100)
        titleLabel.font = titleLabelFont
        instructionLabelFont = UIFont(name: "Anton", size: 19)
        instructionLabel.font = instructionLabelFont
        creditsButton.titleLabel?.font = UIFont(name: "Anton", size: 25)
        emailButton.titleLabel?.font = UIFont(name: "Anton", size: 25)
        explanationButton.titleLabel?.font = UIFont(name: "Anton", size: 25)
        rulesFont = UIFont.systemFont(ofSize: 18)

    case Devices.bigiPadProHeight.rawValue:
        playerLabelFont = UIFont(name: "Anton", size: 90)
        timerLabelFont = UIFont(name: "Anton", size: 150)
        buttonFont = UIFont(name: "Anton", size: 90)
        titleLabelFont = UIFont(name: "Mobsters", size: 150)
        titleLabel.font = titleLabelFont
        instructionLabelFont = UIFont(name: "Anton", size: 40)
        instructionLabel.font = instructionLabelFont
        creditsButton.titleLabel?.font = UIFont(name: "Anton", size: 40)
        emailButton.titleLabel?.font = UIFont(name: "Anton", size: 40)
        explanationButton.titleLabel?.font = UIFont(name: "Anton", size: 40)
        rulesFont = UIFont.systemFont(ofSize: 40)

    case Devices.airThreeHeight.rawValue:
        playerLabelFont = UIFont(name: "Anton", size: 60)
        timerLabelFont = UIFont(name: "Anton", size: 100)
        buttonFont = UIFont(name: "Anton", size: 80)
        titleLabelFont = UIFont(name: "Mobsters", size: 180)
        titleLabel.font = titleLabelFont
        instructionLabelFont = UIFont(name: "Anton", size: 40)
        instructionLabel.font = instructionLabelFont
        creditsButton.titleLabel?.font = UIFont(name: "Anton", size: 50)
        emailButton.titleLabel?.font = UIFont(name: "Anton", size: 50)
        explanationButton.titleLabel?.font = UIFont(name: "Anton", size: 50)
    
    case Devices.proElevenInchHeight.rawValue:
        playerLabelFont = UIFont(name: "Anton", size: 60)
        timerLabelFont = UIFont(name: "Anton", size: 100)
        buttonFont = UIFont(name: "Anton", size: 80)
        titleLabelFont = UIFont(name: "Mobsters", size: 180)
        titleLabel.font = titleLabelFont
        instructionLabelFont = UIFont(name: "Anton", size: 40)
        instructionLabel.font = instructionLabelFont
        creditsButton.titleLabel?.font = UIFont(name: "Anton", size: 50)
        emailButton.titleLabel?.font = UIFont(name: "Anton", size: 50)
        explanationButton.titleLabel?.font = UIFont(name: "Anton", size: 50)
        rulesFont = UIFont.systemFont(ofSize: 24)
    
    case Devices.airTwoHeight.rawValue:
        playerLabelFont = UIFont(name: "Anton", size: 75)
        timerLabelFont = UIFont(name: "Anton", size: 110)
        buttonFont = UIFont(name: "Anton", size: 90)
        titleLabelFont = UIFont(name: "Mobsters", size: 175)
        titleLabel.font = titleLabelFont
        instructionLabelFont = UIFont(name: "Anton", size: 45)
        instructionLabel.font = instructionLabelFont
        creditsButton.titleLabel?.font = UIFont(name: "Anton", size: 45)
        emailButton.titleLabel?.font = UIFont(name: "Anton", size: 45)
        explanationButton.titleLabel?.font = UIFont(name: "Anton", size: 45)
        rulesFont = UIFont.systemFont(ofSize: 24)
        
    case Devices.airFourHeight.rawValue:
        playerLabelFont = UIFont(name: "Anton", size: 60)
        timerLabelFont = UIFont(name: "Anton", size: 100)
        buttonFont = UIFont(name: "Anton", size: 80)
        titleLabelFont = UIFont(name: "Mobsters", size: 180)
        titleLabel.font = titleLabelFont
        instructionLabelFont = UIFont(name: "Anton", size: 40)
        instructionLabel.font = instructionLabelFont
        creditsButton.titleLabel?.font = UIFont(name: "Anton", size: 50)
        emailButton.titleLabel?.font = UIFont(name: "Anton", size: 50)
        explanationButton.titleLabel?.font = UIFont(name: "Anton", size: 50)
        rulesFont = UIFont.systemFont(ofSize: 24)
        
    default:
        buttonFont = UIFont(name: "Anton", size: 50)
        return
    }
    
    for button in buttons {
        button.titleLabel?.font = buttonFont
    }
}


