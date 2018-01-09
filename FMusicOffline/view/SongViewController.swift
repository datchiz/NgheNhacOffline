//
//  SongViewController.swift
//  FMusicOffline
//
//  Created by mai.quoc.dat on 1/8/18.
//  Copyright © 2018 com.framgia. All rights reserved.
//

import UIKit

class SongViewController: UIViewController {
    let SONG_CELL_IDENTIFIER = "SongCellIdentifier"
    
    @IBOutlet weak var songTableView: UITableView!
    
    var songViewModel: SongViewModel = SongViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background")
        self.view.insertSubview(backgroundImage, at: 0)
    }
}

extension SongViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SONG_CELL_IDENTIFIER) as? SongTableViewCell else {
            return UITableViewCell()
        }
        let song = songViewModel.songs[indexPath.row]
        cell.updateCell(song: song)
        return cell
    }
}
