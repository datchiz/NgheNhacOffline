//
//  Song.swift
//  FMusicOffline
//
//  Created by mai.quoc.dat on 1/8/18.
//  Copyright © 2018 com.framgia. All rights reserved.
//

import UIKit

class Song: NSObject {
    var name: String
    var author: String
    var time: String
    
    init(name: String, author: String, time: String) {
        self.name = name
        self.author = author
        self.time = time
    }
}
