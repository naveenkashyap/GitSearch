//
//  RepoCell.swift
//  GithubDemo
//
//  Created by Naveen Kashyap on 1/25/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var forkImage: UIImageView!
    @IBOutlet weak var forkLabel: UILabel!
    
    var repo: GithubRepo! {
        didSet {
            nameLabel.text = repo.name
            ownerLabel.text = "by " + repo.ownerHandle!
            descriptionLabel.text = repo.repoDescription
            let avatarURL = URL(string: repo.ownerAvatarURL!)
            avatarImage.setImageWith(avatarURL!)
            starImage.image = #imageLiteral(resourceName: "star")
            starLabel.text = "\(repo.stars!)"
            forkImage.image = #imageLiteral(resourceName: "fork")
            forkLabel.text = "\(repo.forks!)"
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
