//
//  TeamManagerViewController.swift
//  VolleyStats
//
//  Created by Sartaj Singh on 5/10/20.
//  Copyright © 2020 Sartaj Singh. All rights reserved.
//

import UIKit
import RealmSwift

class TeamManagerViewController: UIViewController {

    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var AddPlayerButton: UIButton!
    @IBOutlet weak var AddPlayerView: UIView!
    
    @IBOutlet weak var playerListStackView: UIStackView!
    
    
    @IBOutlet weak var playerNameField: UITextField!
    @IBOutlet weak var playerNumberField: UITextField!
    
    var team = Team()
    
    override func viewDidLoad() {
        AddPlayerView.alpha = 0
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        team.name = HomepageViewController.tempName
        teamName.text = team.name
        let realm = try! Realm()
        let teamObj = realm.objects(Team.self).filter("name = %@", team.name)
        //print(teamObj[0].name)
        
        for i in teamObj[0].players{
            print(i.name)
            addPlayerButton(i)
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
    
    @IBAction func AddPlayerTapped(_ sender: Any) {
        AddPlayerView.alpha = 1
    }
    //add the player to the view on the left
    @IBAction func confirmTapped(_ sender: Any) {
        let tempPlayer = Player()
        tempPlayer.name = playerNameField.text
        playerNameField.text = ""
        tempPlayer.number = playerNumberField.text
        playerNumberField.text = ""
        addPlayerButton(tempPlayer)
        let realm = try! Realm()
        let teamObj = realm.objects(Team.self).filter("name = %@", team.name)
        print(teamObj[0].name)
        //teamObj[0].players.append(tempPlayer)
        try! realm.write{
            teamObj[0].players.append(tempPlayer)
        }
    }
    
    func addPlayerButton(_ player: Player){
        let buttontext = "#" + player.number! + " - " + player.name!
        let button = CustomButton()
        button.setTitle(buttontext, for: .normal)
        self.playerListStackView.addArrangedSubview(button)
        print("Button for: \(buttontext)")
    }
}
