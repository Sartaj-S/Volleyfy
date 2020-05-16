//
//  LogInViewController.swift
//  VolleyStats
//
//  Created by Sartaj Singh on 5/3/20.
//  Copyright © 2020 Sartaj Singh. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        errorlabel.alpha = 0
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func loginTapped(_ sender: Any) {
        // Valiudate Text Fields
        //Create clkeaned versions of the text fields
        let usernameC = username.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let passwordC = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)

        //Sign the user in
        Auth.auth().signIn(withEmail: usernameC, password: passwordC) { (result, error) in
            if error != nil {
                self.errorlabel.text = "Log in failed"
                self.errorlabel.alpha=1
            }
            else {
                print("correct")
                self.transitionHome()
            }
        }
        
    }
    func transitionHome(){
         let homeViewController =
         storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homepageViewController) as? HomeViewController
         view.window?.rootViewController = homeViewController
         view.window?.makeKeyAndVisible()
     }
}
