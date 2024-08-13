//
//  LoginController.swift
//  UserFileManager
//
//  Created by Musa Adıtepe on 13.08.2024.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let fileManager = FileManagerHelper.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        fileManager.readJsonFile()

        // Do any additional setup after loading the view.
    }
  
    func checUser(){
        if let email = emailTextField.text, let password = passwordTextField.text{
            for user in fileManager.users{
                if user.email == email && user.password == password{
                    print("user logged in")
                }
            }
        }
        else{
            print("fill the information")
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        checUser()
    }
}
