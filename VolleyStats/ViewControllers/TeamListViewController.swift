//
//  TeamListViewController.swift
//  VolleyStats
//
//  Created by Sartaj Singh on 5/10/20.
//  Copyright © 2020 Sartaj Singh. All rights reserved.
//

import UIKit
import RealmSwift
class TeamListViewController: UIViewController {

    @IBOutlet weak var teamListStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let realm = try! Realm()
        let teams = realm.objects(Team.self)
        for i in teams{
            addTeamButton(i)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func addTeamButton(_ team: Team){
        let buttontext = team.name!
        let button = CustomButton()
        button.setTitle(buttontext, for: .normal)
        self.teamListStackView.addArrangedSubview(button)
        print("Button for: \(buttontext)")
        button.addTarget(self, action: #selector(selectionMade(_:)), for: .touchUpInside)
    }
    
    @objc func selectionMade(_ butt: UIButton){
        HomepageViewController.tempName = butt.titleLabel!.text!
        self.performSegue(withIdentifier: "teamManagerTransition", sender: self)

    }

}
