//
//  HomepageViewController.swift
//  VolleyStats
//
//  Created by Sartaj Singh on 5/5/20.
//  Copyright © 2020 Sartaj Singh. All rights reserved.
//

import UIKit
import RealmSwift
class HomepageViewController: UIViewController {

    static var tempName = String()
    @IBOutlet weak var accessTeams: UIButton!
    @IBOutlet weak var createTeam: UIButton!
    @IBOutlet weak var popup: UIView!
    @IBOutlet weak var teamName: UITextField!
    @IBOutlet weak var teamEntered: UIButton!
    let temp = Team.init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        popup.alpha = 0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func createTeamTapped(_ sender: Any) {
        popup.alpha = 1
    }
    
    @IBAction func teamEnteredTapped(_ sender: Any) {
        temp.name = teamName.text
        HomepageViewController.tempName = teamName.text!
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL)
        try! realm.write{
            //realm.deleteAll()
            realm.add(temp)
        }
//        let vc = TeamManagerViewController
//        try! vc.team = temp
        //popup.alpha = 0
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let vc = segue.destination as! TeamManagerViewController
//        try! vc.team = temp
//    }
}
