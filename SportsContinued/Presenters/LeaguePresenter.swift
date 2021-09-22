//
//  LeaguePresenter.swift
//  SportsContinued
//
//  Created by Mostafa Zidan on 3/27/21.
//  Copyright © 2021 Mostafa Zidan. All rights reserved.
//

private let leagueTeamsLink = "https://www.thesportsdb.com/api/v1/json/1/lookup_all_teams.php?id=4328"
private let leagueResultsLink = "https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id=4328"


import Foundation


protocol LeaguePresenterProtocol {
    
    func startLoading()
    func finishLoading()
    func displayTeamsData(leagueTeams: [Team])
    func displayResultsData(leagueResults: [Result])
    
}



protocol LeaguePresenterClassProtocol {
    
    //Teams
    func getLeagueTeams()
    func parseToTeamsArray(dataDB: [[String : Any]]) /*-> Team*/
    
    
    //Results
    func getLeagueResults()
    func parseToResultsArray(dataDB: [[String: Any]])
}



class LeagueTeamsPresenterClass: LeaguePresenterClassProtocol {
    
    
    var leagueTeamsViewController: LeaguePresenterProtocol! = nil
    var leagueTeams: [Team]!
    var leagueResults: [Result]?
    
    
    
    //Teams
    func getLeagueTeams() {
        
        APIService.shared.getLeagueTeams(urlLink: leagueTeamsLink) {data in
            let tempTeamsArray = data["teams"]
            self.parseToTeamsArray(dataDB: tempTeamsArray!)
            self.leagueTeamsViewController.displayTeamsData(leagueTeams: self.leagueTeams)
//            self.leagueTeamsViewController.displayResultsData(leagueResults: self.leagueResults!)
        }
    }
    
    
    func parseToTeamsArray(dataDB:[[String: Any]]) /*-> Team*/{
        leagueTeams = [Team]()
        var team = Team()
        for tempTeam in dataDB {
            team.idTeam = tempTeam["idTeam"] as? String ?? "none"
            team.strTeam = tempTeam["strTeam"] as? String ?? "none"
            team.intFormedYear = tempTeam["intFormedYear"] as? String ?? "none"
            team.strKeywords = tempTeam["strKeywords"] as! String
            team.strStadiumThumb = tempTeam["strStadiumThumb"] as? String ?? "none"
            team.strFacebook = tempTeam["strFacebook"] as? String ?? "none"
            team.strDescriptionEN = tempTeam["strDescriptionEN"] as? String ?? "none"
            team.strTeamJersey = tempTeam["strTeamJersey"] as? String ?? "none"
            team.strTeamBanner = tempTeam["strTeamBanner"] as? String ?? "none"
            team.strTeamBadge = tempTeam["strTeamBadge"] as? String ?? "none"
            leagueTeams.append(team)
        }
    }
    
    
    
    //Results
    func getLeagueResults() {
        APIService.shared.getLeagueResults(urlLink: leagueResultsLink) { (data) in
            let tempResultsArray = data["events"]
            self.parseToResultsArray(dataDB: tempResultsArray!)
            self.leagueTeamsViewController.displayResultsData(leagueResults: self.leagueResults!)
        }
    }
    
    
    func parseToResultsArray(dataDB: [[String : Any]]) {
        leagueResults = [Result]()
        var result = Result()
        for tempResult in dataDB {
            result.homeTeam = tempResult["strHomeTeam"] as? String ?? "none"
            result.awayTeam = tempResult["strAwayTeam"] as? String ?? "none"
            result.homeTeamScore = tempResult["intHomeScore"] as? String ?? "none"
            result.awayTeamScore = tempResult["intAwayScore"] as? String ?? "none"
            result.time = tempResult["strTime"] as? String ?? "none"
            result.date = tempResult["dateEvent"] as? String ?? "none"
            leagueResults?.append(result)
        }
    }
}
