//
//  SongViewModel.swift
//  FMusicOffline
//
//  Created by mai.quoc.dat on 1/8/18.
//  Copyright © 2018 com.framgia. All rights reserved.
//

import UIKit
import MediaPlayer
import GCDWebServer
import Foundation

class SongViewModel: NSObject {
    var songs = Array<Song>()
    
    override init() {
        super.init()
        
        let song1 = Song(name: "Something In The Air - Bonobo Remix", author: "Night Vision", time: "4:49")
        let song2 = Song(name: "Something In The Air - Bonobo Remix", author: "Night Vision", time: "4:49")
        songs.append(song1)
        songs.append(song2)
        
        if let plays = MPMediaQuery.playlists().collections {
            for play in plays {
                print(play.value(forProperty: MPMediaPlaylistPropertyName) ?? "No name")
            }
        }
        
        self.initWebServer()
    }
    
    func numberOfRowsInSection() -> Int {
        return songs.count
    }
    
    func initWebServer() {
        var documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        var davServer = GCDWebDAVServer.init(uploadDirectory: documentPath)
        
        var server = GCDWebServer.init()
        server.addHandler(forMethod: "GET", path: "/", request: GCDWebServerRequest.self, processBlock: { request in
            var boby = "<html><body> <form name=\"input\" action=\"/\" method=\"post\" enctype=\"multipart/form-data\"><input type=\"file\" name=\"value\"> <input type=\"submit\" value=\"Submit\"> </form> </body></html>"
            return GCDWebServerDataResponse(html: boby)
        })
        
        server.addHandler(forMethod: "POST", path: "/",request: GCDWebServerMultiPartFormRequest.self, processBlock: {request  in
            var boby = "<html><body><p>Hello World</p></body></html>"
            if let res = request as? GCDWebServerFileRequest {
                let value = res.description
                boby = String(format: "<html><body><p>%@</p></body></html>", value)
            }
            return GCDWebServerDataResponse(html: boby)
        })
        
        server.start(withPort: 8080, bonjourName: "GCD Web Server")
        
        print("Visit \(davServer.serverURL) in your web browser")
        
        
        //        let webServer = GCDWebServer()
        //
        //        webServer.addDefaultHandler(forMethod: "GET", request: GCDWebServerRequest.self, processBlock: {request in
        //            return GCDWebServerDataResponse(html: "<html><body><p>Hello World</p></body></html>")
        //        })
        //
        //        webServer.start(withPort: 8080, bonjourName: "GCD Web Server")
        //
        //        print("Visit \(webServer.serverURL) in your web browser")
    }
}
