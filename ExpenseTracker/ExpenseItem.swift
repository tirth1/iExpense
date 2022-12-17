//
//  ExpenseItem.swift
//  ExpenseTracker
//
//  Created by Tirth on 10/24/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
