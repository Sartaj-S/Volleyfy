//
//  StatisticalViewController.swift
//  VolleyStats
//
//  Created by Sartaj Singh on 5/11/20.
//  Copyright © 2020 Sartaj Singh. All rights reserved.
//

import UIKit
import RealmSwift
class StatisticalViewController: UIViewController {

    @IBOutlet weak var playerSV: UIStackView!
    @IBOutlet weak var hittingSV: UIStackView!
    @IBOutlet weak var diggingSV: UIStackView!
    @IBOutlet weak var servingSV: UIStackView!
    @IBOutlet weak var errorSV: UIStackView!
    @IBOutlet weak var collectiveSV: UIStackView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let realm = try! Realm()
        let teamObj = realm.objects(Team.self).filter("name = %@", HomepageViewController.tempName)
        //print(teamObj[0].name)
        
        for i in teamObj[0].players{
            print(i.name)
            addPlayerInfo(i)
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
    func addPlayerInfo(_ player: Player){
        let playerlabel = UILabel.init()
        playerlabel.font = UIFont(name: "System", size: 14)
        playerlabel.text = player.name
        playerlabel.textAlignment = .center
        playerSV.addArrangedSubview(playerlabel)
        
        let hittinglabel = UILabel.init()
        hittinglabel.font = UIFont(name: "System", size: 14)
        var hitting = 0
        if player.attackErrors == 0 {
            hitting = player.kills
        }
        else{
            print(player.kills)
            print(player.attackErrors)
            hitting = player.kills/(player.attackErrors + player.kills)*100
            print(hitting)
        }
        hittinglabel.text = String(hitting)
        hittinglabel.textAlignment = .center
        hittingSV.addArrangedSubview(hittinglabel)
        
        
        let digginglabel = UILabel.init()
        digginglabel.font = UIFont(name: "System", size: 14)
        var digging = 0
        if player.digError == 0 {
            digging = player.digError
        }
        else{
            digging = player.digs/(player.digError + player.digs)*100
        }
        digginglabel.text = String(digging)
        digginglabel.textAlignment = .center
        diggingSV.addArrangedSubview(digginglabel)
        
        
        let servlabel = UILabel.init()
        servlabel.font = UIFont(name: "System", size: 14)
        var service = 0
        if player.serviceErrors == 0 {
            service = player.serviceErrors
        }
        else{
            service = player.serverec/(player.serviceErrors + player.serverec)*100
        }
        servlabel.text = String(service)
        servlabel.textAlignment = .center
        servingSV.addArrangedSubview(servlabel)
        
        let errorLabel = UILabel.init()
        errorLabel.font = UIFont(name: "System", size:14)
        var errors = player.attackErrors + player.digError + player.serverecErr + player.serviceErrors
        errorLabel.text = String(errors)
        errorLabel.textAlignment = .center
        errorSV.addArrangedSubview(errorLabel)
        
        let collectiveLabel = UILabel.init()
        collectiveLabel.font = UIFont(name: "System", size:14)
        var collection = ""
        collection = String(player.kills)+"/"+String(player.digs)+"/"+String(player.aces)
        collectiveLabel.text = collection
        collectiveLabel.textAlignment = .center
        collectiveSV.addArrangedSubview(collectiveLabel)
    }

}
