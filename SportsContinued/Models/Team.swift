//
//  Team.swift
//  SportsContinued
//
//  Created by Mostafa Zidan on 3/27/21.
//  Copyright © 2021 Mostafa Zidan. All rights reserved.
//

import Foundation

//Teams Details: https://www.thesportsdb.com/api/v1/json/1/lookupteam.php?id=/*133604 -> Team ID*/


//struct Teams: Codable {
//    let sports: [Team]
//}





struct Team {
    var idTeam: String = ""          //Team Id
    var strTeam: String = ""          //Team Name
    var intFormedYear: String = ""     //Since Year
    var strKeywords: String = ""     //like Arsenal: Gunners
    var strStadiumThumb: String = "" //Stadium Image
    var strFacebook: String = ""     //FaceBook page
    var strDescriptionEN: String = "" //Team Description
    var strTeamJersey: String = ""   //Tshirt image
    var strTeamBanner: String = ""   //Banner Logo
    var strTeamBadge: String = ""
}
