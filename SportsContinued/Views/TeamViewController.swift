//
//  ViewController.swift
//  SportsContinued
//
//  Created by Mostafa Zidan on 3/27/21.
//  Copyright © 2021 Mostafa Zidan. All rights reserved.
//

import UIKit
import SVProgressHUD
import SDWebImage
import SafariServices


class TeamViewController: UIViewController, TeamPresenterProtocol {
    
    
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var sinceLabel: UILabel!
    @IBOutlet weak var stadiumImage: UIImageView!
    @IBOutlet weak var tShirtJesreyImage: UIImageView!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var keyWordLabel: UILabel!
    @IBOutlet weak var backButtonOutlet: UIButton!
    
    
    var teamPresenterObject: TeamPresenterClass!
    var faceBookLink: String!
    var idTeam: String!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.startLoading()
        teamPresenterObject = TeamPresenterClass()
        teamPresenterObject.teamViewController = self
        teamPresenterObject.getTeam(idTeam: idTeam)
        
    }
    

    
    @IBAction func facebookButtonPressed(_ sender: Any) {
        
        let safariObject = SFSafariViewController(url: URL(string: faceBookLink)!)
        self.present(safariObject, animated: true)
        
    }
}




extension TeamViewController {
    func startLoading() {
        
        SVProgressHUD.setOffsetFromCenter(UIOffset(horizontal: self.view!.bounds.midX, vertical: self.view!.bounds.midY))
        SVProgressHUD.show()
        
    }
    
    
    func finishLoading() {
        
        SVProgressHUD.dismiss()
        
    }
    
    
    func displayData(team: Team) {
        
        faceBookLink = "https://" + team.strFacebook
        teamNameLabel.text = team.strTeam
        sinceLabel.text = "Since: \(team.intFormedYear)"
        keyWordLabel.text = team.strKeywords
        descriptionTextField.isEditable = false
        descriptionTextField.text = team.strDescriptionEN
        tShirtJesreyImage!.sd_setImage(with: URL(string: team.strTeamJersey), placeholderImage: UIImage(named: "1.jpeg"), completed: nil)
    
        
        stadiumImage.layer.cornerRadius = 10.0
        stadiumImage.layer.borderWidth = 2.0
        stadiumImage.layer.borderColor = UIColor.blue.cgColor
        stadiumImage!.sd_setImage(with: URL(string: team.strStadiumThumb), placeholderImage: UIImage(named: "1.jpeg"), completed: nil)
        
        
        self.finishLoading()
        
    }
}



