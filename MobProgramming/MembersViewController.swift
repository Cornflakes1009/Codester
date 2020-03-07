//
//  MembersViewController.swift
//  MobProgramming
//
//  Created by HaroldDavidson on 3/4/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import UIKit

class MembersViewController: UIViewController {
    
//    let instructionLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Add Members"
//        label.font = UIFont(name: "Anton", size: 50)
//
//        label.textAlignment = .center
//        label.textColor = .white
//        return label
//    }()
    
    let addTeamTextField: UITextField = {
        let tf = UITextField()
        //tf.placeholder = "Enter team members"
        tf.attributedPlaceholder = NSAttributedString(string: "Enter team members", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        tf.textColor = .white
        tf.backgroundColor = UIColor.rgb(red: 112, green: 112, blue: 112, alpha: 1)
        tf.layer.cornerRadius = 5
        return tf
    }()
    
    let memberSubmitButton: UIButton = {
         let button = UIButton(type: .system)
         button.setTitle("Add Member", for: .normal)
         button.backgroundColor = UIColor.rgb(red: 217, green: 217, blue: 217, alpha: 1)
         button.setTitleColor(UIColor.rgb(red: 48, green: 48, blue: 48, alpha: 1), for: .normal)
         button.layer.cornerRadius = 5
         button.titleLabel?.font = UIFont(name: "Anton", size: 50)
         button.addTarget(self, action: #selector(addMembersTapped), for: .touchUpInside)
         return button
     }()
    
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: (UIImage(named: "dark-honeycomb.png")!))
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        let screenHeight = UIScreen.main.bounds.size.height
        let tableViewHeight = screenHeight * 0.5
        
//        view.addSubview(instructionLabel)
//        instructionLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: stackViewButtonHeight)
        view.addSubview(addTeamTextField)
        addTeamTextField.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: stackViewButtonHeight)
        view.addSubview(memberSubmitButton)
        memberSubmitButton.anchor(top: addTeamTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: stackViewButtonHeight)
        view.addSubview(tableView)
        tableView.anchor(top: memberSubmitButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: tableViewHeight)


        configureTableView()
    } // End of ViewDidLoad
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
        tableView.register(MemberCell.self, forCellReuseIdentifier: "MemberCell")
    }
    
    @objc func addMembersTapped() {
        addTeamTextField.resignFirstResponder()
        if(addTeamTextField.text != "") {
            if let member = addTeamTextField.text {
                members.append(member)
                membersSet = members.count > 2 ?  true : false
                addTeamTextField.text = nil
                tableView.reloadData()
            }
        }
    }
}

extension MembersViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        members.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell") as! MemberCell
        cell.set(label: members[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            members.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}
