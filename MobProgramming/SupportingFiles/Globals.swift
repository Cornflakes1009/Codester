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
var currentRoundLength              =   roundLength * 60
var breakLength                     =   1
var currentBreakLength              =   60
var guidelines                      =   String()
var rulesClicked                    =   false
var membersSet                      =   false
var timersSet                       =   false
var guidelinesSet                   =   false
var breakTime                       =   false
var stackViewButtonHeight: CGFloat  =   0
let grayColor                       =   UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
let whiteColor                      =   UIColor.rgb(red: 255, green: 255, blue: 255, alpha: 1)
let buttonTitleColor                =   UIColor.rgb(red: 48, green: 48, blue: 48, alpha: 1)
var titleLabelFont                  =   UIFont(name: "Mobsters", size: 90)
var instructionLabelFont            =   UIFont(name: "Anton", size: 20)
var buttonFont                      =   UIFont(name: "Anton", size: 50)
var rulesFont                       =   UIFont.systemFont(ofSize: 15)
var playerLabelFont                 =   UIFont(name: "Anton", size: 30)
var timerLabelFont                  =   UIFont(name: "Anton", size: 50)
var playerStackSpacing: CGFloat     =   20
let adUnitID                        =   "ca-app-pub-6504174477930496/6156031420"

// MARK:- Persistent Storage
let defaults                        =   UserDefaults.standard
var audioIsOn                       =   defaults.bool(forKey: "audioIsOn")

// MARK: Setting Button Green
func setGreen(button: UIButton) {
    button.backgroundColor = .green
}

// MARK: Setting Button Gray
func setGray(button: UIButton) {
    button.backgroundColor = grayColor
}
