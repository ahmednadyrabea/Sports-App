//
//  Alamofire.swift
//  SportsContinued
//
//  Created by Mostafa Zidan on 3/27/21.
//  Copyright © 2021 Mostafa Zidan. All rights reserved.
//
//https://www.thesportsdb.com/api/v1/json/1/lookupteam.php?id=133604
import Foundation
import Alamofire


class APIService: NSObject {
    //Singleton
    static let shared = APIService()
    
    
    func getTeam(urlLink: String, completion: @escaping ([String: [[String: Any]]]) -> ()) {
        let request = AF.request(urlLink)
        request.responseJSON { (response) in
            switch response.result {
            case .success(let data):
                completion(data as! [String : [[String: Any]]])
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    func getLeagueTeams(urlLink: String, completion: @escaping ([String: [[String: Any]]]) -> ()) {
        let request = AF.request(urlLink)
        request.responseJSON { (response) in
            switch response.result {
            case .success(let data):
                completion(data as! [String : [[String: Any]]])
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    func getLeagueResults(urlLink: String, completion: @escaping ([String: [[String: Any]]]) -> ()) {
        let request = AF.request(urlLink)
        request.responseJSON { (response) in
            switch response.result {
            case .success(let data):
                completion(data as! [String: [[String: Any]]])
            case .failure(let error):
                print(error)
            }
        }
    }
}
