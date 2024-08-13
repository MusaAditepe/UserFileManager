//
//  SignupController.swift
//  UserFileManager
//
//  Created by Musa Adıtepe on 13.08.2024.
//

struct User: Codable{
    let fullname: String
    let password: String
    let email: String
    
}

import UIKit

class SignupController: UIViewController {

    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let fileManager = FileManagerHelper.shared
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fileManager.readJsonFile()
        
    }
    
    @IBAction func signupBottonTapped(_ sender: Any) {
        // TODO: append new data to user array
        if let email = emailTextField.text, let fullname  = fullNameTextField.text,let password = passwordTextField.text{
           let user = User(fullname: fullname, password: password, email: email)
            fileManager.users.append(user)
            fileManager.writeToJsonFile{
            }
        }
        else{
            print("Fill the information")
        }
       
    }
}
