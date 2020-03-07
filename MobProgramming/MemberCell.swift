//
//  MemberCell.swift
//  MobProgramming
//
//  Created by HaroldDavidson on 3/5/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import UIKit

class MemberCell: UITableViewCell {

    var memberLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(memberLabel)
        configureMemberLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(label: String) {
        memberLabel.text = label
    }
    
    func configureMemberLabel() {
        memberLabel.textColor                                                                   = .black
        memberLabel.numberOfLines                                                               =   0
        memberLabel.adjustsFontSizeToFitWidth                                                   =   true
        memberLabel.translatesAutoresizingMaskIntoConstraints                                   =   false
        memberLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive                   =   true
        memberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive     =   true
        memberLabel.heightAnchor.constraint(equalToConstant: 40).isActive                       =   true
        memberLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive  =   true
    }
}
