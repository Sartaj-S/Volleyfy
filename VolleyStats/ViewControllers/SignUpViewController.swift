//
//  SignUpViewController.swift
//  VolleyStats
//
//  Created by Sartaj Singh on 5/3/20.
//  Copyright © 2020 Sartaj Singh. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        errorLabel.alpha = 0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // validate fields
    func validateFields() -> String? {
        if firstname.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastname.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            email.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            return "Please fill in all fields."
        }
        
        let cleanPass = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if !isPasswordValid(cleanPass){
            return "Pelase make sure password is 8 or more characters, contains a special character and a number"
        }
        return nil
    }
    
    func isPasswordValid(_ password : String) -> Bool {
           
           let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
           return passwordTest.evaluate(with: password)
    }
    @IBAction func signUpTapped(_ sender: Any) {
        let err = validateFields()
        
        if err != nil{
            //error triggered
            showError(err!)
        }
        else {
            //create cleaned versions of the data entry
            let firstC = firstname.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastC = lastname.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let emailC = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let passC = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)


            
            //creating the user
            Auth.auth().createUser(withEmail: emailC, password: passC) { (result, error) in
                if error != nil {
                    //error ocurred
                    self.showError("Error creating user")
                }
                else{
                    //user created successfully
                    let db = Firestore.firestore()
                    //stored with key value pairs
                    db.collection("users").addDocument(data: ["firstname":firstC, "lastname":lastC, "uid":result!.user.uid ]) { (errorC) in
                        if errorC != nil {
                            self.showError("User data could not be saved to database")
                        }
                    }
                    
                    //transition to homescreen here
                    self.transitionHome()
                }
            }
        }
        
    }
    
    func showError (_ msg:String){
        errorLabel.text = msg
        errorLabel.alpha = 1
    }
    
    // we will change the root view controller to the homescreen/welcome one
    func transitionHome(){
        let homeViewController =
        storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homepageViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
}
