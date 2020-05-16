//
//  ViewController.swift
//  VolleyStats
//
//  Created by Sartaj Singh on 5/3/20.
//  Copyright © 2020 Sartaj Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var debugButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
    }
    
    
    @IBAction func debugTapped(_ sender: Any) {
        //self.transitionHome()
    }
    
    func transitionHome(){
        let homeViewController =
        storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homepageViewController) as? HomeViewController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
}

