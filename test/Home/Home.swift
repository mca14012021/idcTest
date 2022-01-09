//
//  Home.swift
//  test
//
//  Created by Lucky on 09/01/22.
//

import UIKit

class Home: UIViewController {

    @IBOutlet weak var tableVIew: UITableView!
    
    let viewModel = TournamentVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    func initialSetup(){
        viewModel.delegate = self
        viewModel.viewController = self
        viewModel.getTournamentData()
    }
    
    
}
extension Home:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tournamentList.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView = tableView.dequeueReusableCell(withIdentifier:UserSectionTVCell.identifier) as! UserSectionTVCell
        return sectionView
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tournamentView = tableView.dequeueReusableCell(withIdentifier:TournamentsCardTVCell.identifier) as! TournamentsCardTVCell
        tournamentView.setData(object: viewModel.tournamentList[indexPath.row])
        if (indexPath.row == (viewModel.tournamentList.count-3)){
            if !viewModel.isDataLoading{
                viewModel.getTournamentData()
            }
        }
        return tournamentView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 230
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
extension Home:TournamentProtocol{
    func success() {
        tableVIew.reloadData()
    }
    func failure() {
        tableVIew.reloadData()
    }
}
