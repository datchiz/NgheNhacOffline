//
//  SongViewModel.swift
//  FMusicOffline
//
//  Created by mai.quoc.dat on 1/8/18.
//  Copyright © 2018 com.framgia. All rights reserved.
//

import UIKit
import MediaPlayer

class SongViewModel: NSObject {
    var songs = Array<Song>()
    
    override init() {
        let song1 = Song(name: "Something In The Air - Bonobo Remix", author: "Night Vision", time: "4:49")
        let song2 = Song(name: "Something In The Air - Bonobo Remix", author: "Night Vision", time: "4:49")
        songs.append(song1)
        songs.append(song2)
        
        if let plays = MPMediaQuery.playlists().collections {
            for play in plays {
                print(play.value(forProperty: MPMediaPlaylistPropertyName) ?? "No name")
            }
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return songs.count
    }
}
