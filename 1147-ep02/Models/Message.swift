//
//  Message.swift
//  1147-ep02
//
//  Created by Elizabeth Silvia Pumacota Quispe on 20/07/22.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
