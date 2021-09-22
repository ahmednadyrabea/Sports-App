//
//  LeagueViewController.swift
//  SportsContinued
//
//  Created by Mostafa Zidan on 3/27/21.
//  Copyright © 2021 Mostafa Zidan. All rights reserved.
//

import UIKit
import SVProgressHUD


private var reuseIdentifier = "teamCell"
private var collectionViewCount: Int?

class LeagueViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, LeaguePresenterProtocol {
    
    
    var leagueTeams: [Team]! = [Team]()
    var leagueResults: [Result]! = [Result]()
    var leagueTeamsPresenterObject: LeagueTeamsPresenterClass!
    
    
    @IBOutlet weak var buttomCollectionView: UICollectionView!
    @IBOutlet weak var middleCollectionView: UICollectionView!
    @IBOutlet weak var topCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.startLoading()
        
        self.middleCollectionView.delegate = self
        self.middleCollectionView.dataSource = self
        self.buttomCollectionView.delegate = self
        self.buttomCollectionView.dataSource = self
        self.topCollectionView.delegate = self
        self.topCollectionView.dataSource = self
        
        
        //Teams
        leagueTeamsPresenterObject = LeagueTeamsPresenterClass()
        leagueTeamsPresenterObject.leagueTeamsViewController = self
        leagueTeamsPresenterObject.getLeagueTeams()
        
        
        //Results
        leagueTeamsPresenterObject.leagueTeamsViewController = self
        leagueTeamsPresenterObject.getLeagueResults()
        
        
        //UpComing Events
        leagueTeamsPresenterObject.leagueTeamsViewController = self

        
        // MARK: - TEAMS IMAGES COLLECTION VIEW Configuration
        if let flow =  buttomCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            flow.scrollDirection = .horizontal
        }
        
        //Cell configuration for buttom collection view
        let nibCell = UINib(nibName: "TeamCollectionViewCell", bundle: nil)
        self.buttomCollectionView.register(nibCell, forCellWithReuseIdentifier: "teamCell")
        
        
        
        // MARK: - Results CollectionView Configuration
        let resultNibCel = UINib(nibName: "ResultCollectionViewCell", bundle: nil)
        self.middleCollectionView.register(resultNibCel, forCellWithReuseIdentifier: "resultCell")
        
        
        // MARK: - UpComing CollectionView Configuration
        let upComingNibCel = UINib(nibName: "UpComingCollectionViewCell", bundle: nil)
        self.topCollectionView.register(upComingNibCel, forCellWithReuseIdentifier: "upComingCell")
        if let flow = topCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flow.scrollDirection = .horizontal
        }
    }
    
    
    @IBAction func addToFavoritePressed(_ sender: Any) {
    }
    
}





extension LeagueViewController {
    
    
    // MARK: - CollectionView Methods
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.buttomCollectionView {
            return leagueTeams.count
        } else {
            return leagueResults.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.buttomCollectionView {
            let cell = buttomCollectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamCollectionViewCell
            cell.teamNameLabel.text = leagueTeams[indexPath.item].strTeam
            cell.teamImage.sd_setImage(with: URL(string: leagueTeams[indexPath.item].strTeamBadge), placeholderImage: UIImage(named: "1.jpeg"), completed: nil)
            cell.teamImage.layer.cornerRadius = cell.teamImage.frame.width / 2
            cell.teamImage.layer.borderWidth = 3
            cell.teamImage.layer.borderColor = UIColor.blue.cgColor
            cell.teamImage.clipsToBounds = true
            
            return cell
        } else if collectionView == self.middleCollectionView {
            let resultCell = middleCollectionView.dequeueReusableCell(withReuseIdentifier: "resultCell", for: indexPath) as! ResultCollectionViewCell
            resultCell.homeTeamNameLabel.text = leagueResults[indexPath.item].homeTeam
            resultCell.awayTeamNameLabel.text = leagueResults[indexPath.item].awayTeam
            resultCell.homeScoreLabel.text = leagueResults[indexPath.item].homeTeamScore
            resultCell.awayScoreLabel.text = leagueResults[indexPath.item].awayTeamScore
            resultCell.eventDateLabel.text = leagueResults[indexPath.item].date
            resultCell.eventTimeLabel.text = leagueResults[indexPath.item].time
            return resultCell
        } else {
            let upComingCell = topCollectionView.dequeueReusableCell(withReuseIdentifier: "upComingCell", for: indexPath) as! UpComingCollectionViewCell
            upComingCell.homeTeamNameLabel.text = leagueResults[indexPath.item].homeTeam
            upComingCell.awayTeamNameLabel.text = leagueResults[indexPath.item].awayTeam
            upComingCell.eventTimeLabel.text = leagueResults[indexPath.item].time
            upComingCell.eventDateLabel.text = leagueResults[indexPath.item].date
            return upComingCell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        if collectionView == self.buttomCollectionView {
            let size = CGSize(width: 159, height: 174)
            return size
        } else if collectionView == self.middleCollectionView{
            let size = CGSize(width: 395, height: 365)
            return size
        } else {
            let size = CGSize(width: 400, height: 160)
            return size
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.buttomCollectionView {
            let teamViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TeamViewController") as! TeamViewController
            teamViewController.idTeam = leagueTeams[indexPath.item].idTeam
            self.present(teamViewController, animated: true)
        }
    }
    
    
    
    // MARK: - LeaguePresenterProtocol
    func startLoading() {
        SVProgressHUD.setOffsetFromCenter(UIOffset(horizontal: self.view.bounds.midX, vertical: self.view.bounds.midY))
        SVProgressHUD.show()
    }
    
    
    func finishLoading() {
        SVProgressHUD.dismiss()
    }
    
    
    func displayTeamsData(leagueTeams: [Team]) {
        self.leagueTeams = leagueTeams
        reuseIdentifier = "resultCell"
        self.buttomCollectionView.reloadData()
        self.finishLoading()
        collectionViewCount = self.leagueTeams.count
    }
    
    func displayResultsData(leagueResults: [Result]) {
        self.leagueResults = leagueResults
        self.middleCollectionView.reloadData()
        self.topCollectionView.reloadData()
    }
    
}
