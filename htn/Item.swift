//
//  Item.swift
//  htn
//
//  Created by Akshayan on 2024-09-14.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
