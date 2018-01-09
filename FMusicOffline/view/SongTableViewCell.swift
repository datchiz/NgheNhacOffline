//
//  SongTableViewCell.swift
//  FMusicOffline
//
//  Created by mai.quoc.dat on 1/8/18.
//  Copyright © 2018 com.framgia. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var songAuthor: UILabel!
    @IBOutlet weak var songTime: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        songName.text = nil
        songAuthor.text = nil
        songTime.text = nil
    }

    func updateCell(song: Song) {
        songName.text = song.name
        songAuthor.text = song.author
        songTime.text = song.time
    }
}
