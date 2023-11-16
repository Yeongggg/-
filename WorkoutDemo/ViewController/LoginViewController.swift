//
//  LoginViewController.swift
//  WorkoutDemo
//
//  Created by 김규민 on 2023/11/06.
//  Copyright © 2023 Vishal Patel. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var inpEmail: UITextField!
    @IBOutlet var inpPwd: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func pressLogin(_ sender: Any) {
        urlRequest.shared.trylogin(email: inpEmail.text!, password: inpPwd.text!, httpmethod: "POST")
        if urlRequest.shared.login == true
        {
            print("login success")
        }
        else
        {
            print("login failed")
        }
    }
}
