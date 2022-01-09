//
//  TournamentsCardTVCell.swift
//  test
//
//  Created by Lucky on 09/01/22.
//

import UIKit

class TournamentsCardTVCell: UITableViewCell {

    static let identifier = "TournamentsCardTVCell"
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(object:TournamentList){
        gameName.text =  object.name
        name.text = object.gameName
        
        if let coverURL = object.coverURL{
            coverImage.addImage(url:coverURL, placeholderImage: "footbal")
        }else {
            coverImage.image = UIImage()
        }
        
    }

}
