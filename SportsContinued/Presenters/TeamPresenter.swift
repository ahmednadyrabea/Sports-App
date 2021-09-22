//
//  TeamPresenter.swift
//  SportsContinued
//
//  Created by Mostafa Zidan on 3/27/21.
//  Copyright © 2021 Mostafa Zidan. All rights reserved.
//

import Foundation


private let teamLink = "https://www.thesportsdb.com/api/v1/json/1/lookupteam.php?id="


protocol TeamPresenterProtocol {
    
    func startLoading()
    func finishLoading()
    func displayData(team: Team)
    
}



protocol TeamPresenterClassProtocol {
    
    func getTeam(idTeam: String)
    func parseToTeamsArray(dataDB: [String : Any]) /*-> Team*/

}



class TeamPresenterClass: TeamPresenterClassProtocol {
    
    
    
    
    var teamViewController: TeamPresenterProtocol! = nil
    var team: Team!
    
    
    func getTeam(idTeam: String) {
        
        APIService.shared.getTeam(urlLink: teamLink + idTeam) {data in
            let temp = data["teams"]![0]
            self.parseToTeamsArray(dataDB: temp)
            self.teamViewController.displayData(team: self.team)
        }
    }
    
    
    func parseToTeamsArray(dataDB:[String: Any]) /*-> Team*/{
        team = Team()
        team.idTeam = dataDB["idTeam"] as? String ?? "none"
        team.strTeam = dataDB["strTeam"] as? String ?? "none"
        team.intFormedYear = dataDB["intFormedYear"] as? String ?? "none"
        team.strKeywords = dataDB["strKeywords"] as? String ?? "none"
        team.strStadiumThumb = dataDB["strStadiumThumb"] as? String ?? "none"
        team.strFacebook = dataDB["strFacebook"] as? String ?? "none"
        team.strDescriptionEN = dataDB["strDescriptionEN"] as? String ?? "none"
        team.strTeamJersey = dataDB["strTeamJersey"] as? String ?? "none"
        team.strTeamBanner = dataDB["strTeamBanner"] as? String ?? "none"
    }
    
}
