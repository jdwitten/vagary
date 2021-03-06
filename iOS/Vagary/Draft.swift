//
//  Draft.swift
//  Vagary
//
//  Created by Jonathan Witten on 1/29/18.
//  Copyright © 2018 Jonathan Witten. All rights reserved.
//

import Foundation

struct Draft: Codable {
    var id: Int
    var author: Int
    var content: [PostElement]?
    var title: String?
    var trip: Trip?
    var location: String?
    var coverImage: PostImage?
}

extension Draft: Equatable {
    static func ==(lhs: Draft, rhs: Draft) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Draft {
    var markdown: String? {
        var s: String = ""
        for element in content ?? [] {
            switch element {
            case .image(let image):
                s.append(contentsOf: " ![image](\(image.url.absoluteURL))")
            case .text(let text):
                s.append(contentsOf: " ")
                s.append(contentsOf: text)
            }
        }
        return s
    }
}
