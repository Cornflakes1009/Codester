//
//  MembersViewController.swift
//  MobProgramming
//
//  Created by HaroldDavidson on 3/4/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import UIKit

class MembersViewController: UIViewController {
    
    let addTeamTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Add at least 3 team members", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        tf.textColor = .white
        tf.backgroundColor = UIColor.rgb(red: 112, green: 112, blue: 112, alpha: 1)
        tf.layer.cornerRadius = 5
        tf.addDoneButtonOnKeyboard()
        return tf
    }()
    
    let memberSubmitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Member", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(buttonTitleColor, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = buttonFont
        button.addTarget(self, action: #selector(addMembersTapped), for: .touchUpInside)
        return button
    }()
    
    let doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Done", for: .normal)
        button.backgroundColor = grayColor
        button.setTitleColor(UIColor.rgb(red: 48, green: 48, blue: 48, alpha: 1), for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = buttonFont
        button.addTarget(self, action: #selector(doneTapped), for: .touchUpInside)
        return button
    }()
    
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    func setUpView() {
        self.view.backgroundColor = UIColor(patternImage:  backgroundImage)
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        let screenHeight = UIScreen.main.bounds.size.height
        let tableViewHeight = screenHeight * 0.5
        
        view.addSubview(addTeamTextField)
        addTeamTextField.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: stackViewButtonHeight)
        if(members.count > 2) {
            memberSubmitButton.backgroundColor = grayColor
            doneButton.backgroundColor = .green
        }
        view.addSubview(memberSubmitButton)
        memberSubmitButton.anchor(top: addTeamTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: stackViewButtonHeight)
        view.addSubview(tableView)
        tableView.anchor(top: memberSubmitButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: tableViewHeight)
        tableView.layer.cornerRadius = 5
        tableView.backgroundColor = .white
        
        configureTableView()
        
        view.addSubview(doneButton)
        doneButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: -20, paddingRight: 20, width: 0, height: stackViewButtonHeight)
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
        tableView.register(MemberCell.self, forCellReuseIdentifier: "MemberCell")
    }
    
    func checkNumOfMembers() {
        if members.count > 2 {
            memberSubmitButton.backgroundColor = grayColor
            doneButton.backgroundColor = .green
        } else {
            memberSubmitButton.backgroundColor = .green
        }
        membersSet = members.count > 2 ?  true : false
    }
    
    @objc func addMembersTapped() {
        addTeamTextField.resignFirstResponder()
        if let member = addTeamTextField.text {
            if(member.trim() != "") {
                members.append(member)
                membersSet = members.count > 2 ?  true : false
                tableView.reloadData()
                vibrate()
            }
        }
        addTeamTextField.text = nil
        checkNumOfMembers()
    }
    
    @objc func doneTapped() {
        vibrate()
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
}

extension MembersViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        members.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell") as! MemberCell
        cell.set(label: members[indexPath.row])
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            members.remove(at: indexPath.row)
            checkNumOfMembers()
            tableView.reloadData()
        }
    }
}
