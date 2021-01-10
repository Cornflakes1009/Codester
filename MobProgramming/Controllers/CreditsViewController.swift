//
//  CreditsViewController.swift
//  MobProgramming
//
//  Created by HaroldDavidson on 3/12/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import UIKit

class CreditsViewController: UIViewController {

    let creditsTextView: UITextView = {
        let tv = UITextView()
        tv.text = """
        I would like to give a special thanks to my girlfriend, Rechie who created the app icon and to the PDX CocoaHeads group for giving me the idea to make this app. I hope everyone using this finds it helpful and enjoyable. Happy coding.
        """
        // changing line height
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 20
        let attributes = [NSAttributedString.Key.paragraphStyle : style]
        tv.attributedText = NSAttributedString(string: tv.text, attributes: attributes)
        
        tv.font = rulesFont
        tv.textColor = .white
        tv.backgroundColor = .clear
        tv.isEditable = false
        tv.isSelectable = false
        tv.isScrollEnabled = true
        
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
   
    func setUpViews() {
        self.view.backgroundColor = UIColor(patternImage: (UIImage(named: "dark-honeycomb.png")!))
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        let screenHeight = UIScreen.main.bounds.size.height
          if(screenHeight < 569) {

          }
        
        let textViewHeight = CGFloat(screenHeight * 0.7)
        
        view.addSubview(creditsTextView)
        creditsTextView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: textViewHeight)
    }


}
