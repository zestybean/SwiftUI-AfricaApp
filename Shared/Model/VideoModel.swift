//
//  VideoModel.swift
//  Africa (iOS)
//
//  Created by Brando Lugo on 6/5/21.
//

import SwiftUI

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    //Computer Property
    var thumbnail: String {
        "video-\(id)"
    }
}
