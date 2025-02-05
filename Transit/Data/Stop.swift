//
//  Item.swift
//  Transit
//
//  Created by Sangit Manandhar on 2/5/25.
//

import Foundation
import SwiftData

@Model
final class Stop {
    var stopID: Int
    var stopName: String

    init(
        stopID: Int, stopName: String
    ) {
        self.stopID = stopID
        self.stopName = stopName
    }
}
