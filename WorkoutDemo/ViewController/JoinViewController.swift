//
//  JoinViewController.swift
//  WorkoutDemo
//
//  Created by 김규민 on 2023/11/06.
//  Copyright © 2023 Vishal Patel. All rights reserved.
//

import UIKit

class JoinViewController: UIViewController {

    @IBOutlet var inpName: UITextField!
    @IBOutlet var inpPwd: UITextField!
    @IBOutlet var inpEamil: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func pressJoin(_ sender: Any) {
        urlRequest.shared.tryjoin(name: inpName.text!, email: inpEamil.text!, password: inpPwd.text!, httpmethod: "POST")
        if urlRequest.shared.join == true
        {
            print("join success")
        }
        else
        {
            print("join failed")
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    

}
