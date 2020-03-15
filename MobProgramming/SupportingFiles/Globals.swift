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
var roundLength                     =   0
var breakLength                     =   0
var guidelines                      =   ""
var rulesClicked                    =   false
var membersSet                      =   false
var timersSet                       =   false
var guidelinesSet                   =   false
var stackViewButtonHeight: CGFloat  =   0
let grayColor                       =   UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
let buttonFont                      =   UIFont(name: "Anton", size: 50)
let buttonTitleColor                =   UIColor.rgb(red: 48, green: 48, blue: 48, alpha: 1)

// MARK: Setting Button Green
func setGreen(button: UIButton) {
    button.backgroundColor = .green
}

// MARK: Setting Button Gray
func setGray(button: UIButton) {
    button.backgroundColor = grayColor
}

