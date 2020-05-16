//
//  StatRecorderViewController.swift
//  VolleyStats
//
//  Created by Sartaj Singh on 5/11/20.
//  Copyright © 2020 Sartaj Singh. All rights reserved.
//

import UIKit
import RealmSwift
class StatRecorderViewController: UIViewController {

    @IBOutlet weak var homeScoreButt: UIButton!
    @IBOutlet weak var awayScoreButt: UIButton!
    //@IBOutlet weak var frontRow: UIStackView!
    //@IBOutlet weak var backRow: UIStackView!
    @IBOutlet weak var backRow: UIStackView!
    @IBOutlet weak var frontRow: UIStackView!
    
    @IBOutlet weak var playerNameInPop: UILabel!
    
    
    @IBOutlet weak var popup: UIView!
    var home = 0
    var away = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        popup.alpha = 0
        createBackRow()
        createFrontRow()
//        let realm = try! Realm()
//        let teamObj = realm.objects(Team.self).filter("name = %@", HomepageViewController.tempName)
//        //print(teamObj[0].name)
//
//        for i in teamObj[0].players{
//            print(i.name)
//            //addPlayerButton(i)
//        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func homeScoreButtPressed(_ sender: Any) {
//        home+=1
//        homeScoreButt.setTitle(String(home), for: .normal)
        incrementHomeScore()
    }
    
    @IBAction func awayScoreButtPressed(_ sender: Any) {
//        away+=1
//        awayScoreButt.setTitle(String(away), for: .normal)
        incrementAwayScore()
    }
    
    func incrementHomeScore(){
        home+=1
        homeScoreButt.setTitle(String(home), for: .normal)
    }
    
    func incrementAwayScore(){
        away+=1
        awayScoreButt.setTitle(String(away), for: .normal)
    }
    
    func createFrontRow(){

        let realm = try! Realm()
        let teamObj = realm.objects(Team.self).filter("name = %@", HomepageViewController.tempName)
        print(Realm.Configuration.defaultConfiguration.fileURL)
        //var player = teamObj[0].players[4]
        let buttontext = teamObj[0].players[3].name
        let button = CustomButton()
        button.setTitle(buttontext, for: .normal)
        self.frontRow.addArrangedSubview(button)
        button.addTarget(self, action: #selector(playerButtonPressed(_:)), for: .touchUpInside)
        
        //var player = teamObj[0].players[5]
        let buttontext2 = teamObj[0].players[2].name
        let button2 = CustomButton()
        button2.setTitle(buttontext2, for: .normal)
        self.frontRow.addArrangedSubview(button2)
        button2.addTarget(self, action: #selector(playerButtonPressed(_:)), for: .touchUpInside)
        
        //var player = teamObj[0].players[0]
        let buttontext3 = teamObj[0].players[1].name
        let button3 = CustomButton()
        button3.setTitle(buttontext3, for: .normal)
        self.frontRow.addArrangedSubview(button3)
        button3.addTarget(self, action: #selector(playerButtonPressed(_:)), for: .touchUpInside)

    }
    
    func createBackRow(){
        let realm = try! Realm()
        let teamObj = realm.objects(Team.self).filter("name = %@", HomepageViewController.tempName)
        print(Realm.Configuration.defaultConfiguration.fileURL)
        //var player = teamObj[0].players[4]
        let buttontext = teamObj[0].players[4].name
        let button = CustomButton()
        button.setTitle(buttontext, for: .normal)
        self.backRow.addArrangedSubview(button)
        button.addTarget(self, action: #selector(playerButtonPressed(_:)), for: .touchUpInside)
        
        //var player = teamObj[0].players[5]
        let buttontext2 = teamObj[0].players[5].name
        let button2 = CustomButton()
        button2.setTitle(buttontext2, for: .normal)
        self.backRow.addArrangedSubview(button2)
        button2.addTarget(self, action: #selector(playerButtonPressed(_:)), for: .touchUpInside)
        
        //var player = teamObj[0].players[0]
        let buttontext3 = teamObj[0].players[0].name
        let button3 = CustomButton()
        button3.setTitle(buttontext3, for: .normal)
        self.backRow.addArrangedSubview(button3)
        button3.addTarget(self, action: #selector(playerButtonPressed(_:)), for: .touchUpInside)
        
        
        
    }
    
//    func addTeamButton(_ team: Team){
//        let buttontext = team.name!
//        let button = CustomButton()
//        button.setTitle(buttontext, for: .normal)
//        self.teamListStackView.addArrangedSubview(button)
//        print("Button for: \(buttontext)")
//        button.addTarget(self, action: #selector(selectionMade(_:)), for: .touchUpInside)
//    }
    
    @objc func playerButtonPressed(_ butt: UIButton){
        var name = butt.titleLabel!.text!
        playerNameInPop.text = name
        popup.alpha = 1

    }
    
    @IBAction func killPressed(_ sender: Any) {
        incrementHomeScore()
        let realm = try! Realm()
        let teamObj = realm.objects(Team.self).filter("name = %@", HomepageViewController.tempName)
        let player = teamObj[0].players.filter("name = %@", playerNameInPop.text)
        try! realm.write{
            player[0].kills = player[0].kills+1
        }
        popup.alpha = 0
        
    }
    
    @IBAction func hittingErrorPressed(_ sender: Any) {
        incrementAwayScore()
        let realm = try! Realm()
        let teamObj = realm.objects(Team.self).filter("name = %@", HomepageViewController.tempName)
        let player = teamObj[0].players.filter("name = %@", playerNameInPop.text)
        try! realm.write{
            player[0].attackErrors = player[0].attackErrors+1
        }
        popup.alpha = 0

    }
    @IBAction func acePressed(_ sender: Any) {
        incrementHomeScore()
        let realm = try! Realm()
        let teamObj = realm.objects(Team.self).filter("name = %@", HomepageViewController.tempName)
        let player = teamObj[0].players.filter("name = %@", playerNameInPop.text)
        try! realm.write{
            player[0].aces = player[0].aces+1
        }
        popup.alpha = 0

    }
    @IBAction func serviceErrPressed(_ sender: Any) {
        incrementAwayScore()
        let realm = try! Realm()
        let teamObj = realm.objects(Team.self).filter("name = %@", HomepageViewController.tempName)
        let player = teamObj[0].players.filter("name = %@", playerNameInPop.text)
        try! realm.write{
            player[0].serverecErr = player[0].serverecErr+1
        }
        popup.alpha = 0

    }
    @IBAction func digPressed(_ sender: Any) {
        let realm = try! Realm()
        let teamObj = realm.objects(Team.self).filter("name = %@", HomepageViewController.tempName)
        let player = teamObj[0].players.filter("name = %@", playerNameInPop.text)
        try! realm.write{
            player[0].digs = player[0].digs+1
        }
        popup.alpha = 0

    }
    
    @IBAction func diggingErrPressed(_ sender: Any) {
        incrementAwayScore()
        let realm = try! Realm()
        let teamObj = realm.objects(Team.self).filter("name = %@", HomepageViewController.tempName)
        let player = teamObj[0].players.filter("name = %@", playerNameInPop.text)
        try! realm.write{
            player[0].digError = player[0].digError+1
        }
        popup.alpha = 0

    }
    @IBAction func serveRecPressed(_ sender: Any) {
        let realm = try! Realm()
        let teamObj = realm.objects(Team.self).filter("name = %@", HomepageViewController.tempName)
        let player = teamObj[0].players.filter("name = %@", playerNameInPop.text)
        try! realm.write{
            player[0].serverec = player[0].serverec+1
        }
        popup.alpha = 0
    }
    
    @IBAction func serveRecErrPressed(_ sender: Any) {
        incrementAwayScore()
        let realm = try! Realm()
        let teamObj = realm.objects(Team.self).filter("name = %@", HomepageViewController.tempName)
        let player = teamObj[0].players.filter("name = %@", playerNameInPop.text)
        try! realm.write{
            player[0].serverecErr = player[0].serverecErr+1
        }
        popup.alpha = 0

    }
}
