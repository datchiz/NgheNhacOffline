//
//  ViewController.swift
//  FMusicOffline
//
//  Created by mai.quoc.dat on 1/3/18.
//  Copyright © 2018 com.framgia. All rights reserved.
//

import UIKit

class PlayViewController: UITableViewController {
    
    @IBOutlet weak var carousel: iCarousel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carousel.type = .rotary
        carousel.backgroundColor = .clear
    }
}

extension PlayViewController : iCarouselDataSource {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 10
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let imageView: UIImageView
        
        if view != nil {
            imageView = view as! UIImageView
        } else {
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
        }
        
        imageView.image = UIImage(named: "song")
        
        return imageView
    }
}

