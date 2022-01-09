//
//  TournamentVM.swift
//  test
//
//  Created by Lucky on 09/01/22.
//

import Foundation
import UIKit

protocol TournamentProtocol:NSObjectProtocol{
    func success()
    func failure()
}

class TournamentVM{
    
    weak var delegate:TournamentProtocol?
    weak var viewController:UIViewController?
    var cursor:String = ""
    var tournamentList:[TournamentList] = [TournamentList]()
    var isDataLoading = false
    
    func getTournamentData(){
        self.isDataLoading = true
        ApiCall.getTournamentInfo(cursor, false, viewController) { data in
            self.isDataLoading = false
            if let d = data{
                do{
                    let model = try JSONDecoder().decode(TournamentResponse.self, from: d)
                    if let _ = model.success{
                        if let modelData = model.data{
                            if let tournaments = modelData.tournaments{
                                self.tournamentList += tournaments
                            }
                            if let cursor = modelData.cursor{
                                self.cursor = cursor
                            }
                        }
                        self.delegate?.success()
                    }
            
                }catch{
                    print("fail")
                    self.delegate?.failure()
                }
            }
            
        } failure: { error, data, statusCode in
            self.delegate?.failure()
        }
    }
    
}
class TournamentResponse:Codable{
    var data:TournamentData?
    var code:Int?
    var success:Bool?
    
    enum CodingKeys:String,CodingKey{
        case data = "data"
        case code = "code"
        case success = "success"
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try values.decodeIfPresent(Int.self, forKey: .code)
        self.success = try values.decodeIfPresent(Bool.self, forKey: .success)
        self.data = try values.decodeIfPresent(TournamentData.self, forKey: .data)
    }
}
class TournamentData:Codable{
    var cursor:String?
    var isLastBatch:Bool?
    var tournamenCount:Int?
    var tournaments:[TournamentList]?
    
    enum CodingKeys:String,CodingKey{
        case cursor = "cursor"
        case isLastBatch = "is_last_batch"
        case tournamenCount = "tournament_count"
        case tournaments = "tournaments"
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.cursor = try values.decodeIfPresent(String.self, forKey: .cursor)
        self.isLastBatch =  try values.decodeIfPresent(Bool.self, forKey: .isLastBatch)
        self.tournamenCount = try values.decodeIfPresent(Int.self, forKey: .tournamenCount)
        self.tournaments = try values.decodeIfPresent([TournamentList].self, forKey: .tournaments)
    }
}

class TournamentList:Codable{
    var name:String?
    var coverURL:String?
    var gameName:String?
    
    enum CodingKeys:String,CodingKey{
        case name = "name"
        case coverURL = "cover_url"
        case gameName = "game_name"
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try values.decodeIfPresent(String.self, forKey: .name)
        self.coverURL = try values.decodeIfPresent(String.self, forKey: .coverURL)
        self.gameName = try values.decodeIfPresent(String.self, forKey: .gameName)
    }
    
}
