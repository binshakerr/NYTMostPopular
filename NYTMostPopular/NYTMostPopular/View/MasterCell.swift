//
//  MasterCell.swift
//  NYTMostPopular
//
//  Created by Eslam Shaker  on 11/12/18.
//  Copyright © 2018 Eslam Shaker . All rights reserved.
//

import UIKit
import SDWebImage

class MasterCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var NewsImageView: UIImageView!
    
    
    var result: Result! {
        didSet {
            titleLabel.text = result.title
            detailsLabel.text = result.abstract
            dateLabel.text = result.publishedDate
            
            var imageUrlString = ""
            for media in result.media {
                for metadata in media.mediaMetadata {
                    if metadata.height == 320 {
                        imageUrlString = metadata.url
                    }
                }
            }
            
            NewsImageView.sd_setShowActivityIndicatorView(true)
            NewsImageView.sd_setIndicatorStyle(.gray)
            NewsImageView.sd_setImage(with: URL(string: imageUrlString))
        }
    }

}
