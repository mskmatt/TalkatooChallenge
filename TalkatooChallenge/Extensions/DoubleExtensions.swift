//
//  DoubleExtensions.swift
//  TalkatooChallenge
//
//  Created by mskmatt on 20/08/2021.
//

import Foundation

extension Double {
    func toDollarsString() -> String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        return formatter.string(from: self as NSNumber)
    }
}
