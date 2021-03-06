//
//  ChangeBreakdown.swift
//  TalkatooChallenge
//
//  Created by mskmatt on 20/08/2021.
//

import Foundation

struct ChangeBreakdown: Equatable {
    private(set) var fives: Int = 0
    private(set) var tens: Int = 0
    private(set) var twenties: Int = 0
    private(set) var fifties: Int = 0
    private(set) var hundreds: Int = 0

    private(set) var pennies: Int = 0
    private(set) var nickles: Int = 0
    private(set) var dimes: Int = 0
    private(set) var quarters: Int = 0
    private(set) var loonies: Int = 0
    private(set) var toonies: Int = 0

    enum DenominationInCents: Int, CaseIterable {
        case penny = 1
        case nickle = 5
        case dime = 10
        case quarter = 25
        case loonie = 100
        case toonie = 200
        case five = 500
        case ten = 1000
        case twenty = 2000
        case fifty = 5000
        case hundred = 10000
    }

    init(fives: Int = 0, tens: Int = 0, twenties: Int = 0, fifties: Int = 0, hundreds: Int = 0, pennies: Int = 0, nickles: Int = 0, dimes: Int = 0, quarters: Int = 0, loonies: Int = 0, toonies: Int = 0) {
        self.fives = fives
        self.tens = tens
        self.twenties = twenties
        self.fifties = fifties
        self.hundreds = hundreds
        self.pennies = pennies
        self.nickles = nickles
        self.dimes = dimes
        self.quarters = quarters
        self.loonies = loonies
        self.toonies = toonies
    }

    init?(changeDue: Decimal) {
        guard let denominationsUsed = getDenominationsUsed(changeDue: changeDue),
              populateDenominationsUsed(with: denominationsUsed)
        else {
            return nil
        }
    }

    private mutating func getDenominationsUsed(changeDue: Decimal) -> [DenominationInCents?]? {
        // Assume changeDue has just two decimal places
        var changeDueInCents = NSDecimalNumber(decimal: changeDue * 100).intValue

        guard changeDueInCents >= 0 else {
            return nil
        }

        // Take out the 100s to improve efficieny
        if changeDueInCents > 10000 {
            hundreds = changeDueInCents / 10000
            changeDueInCents %= 10000
        }

        var minDenominationsToTotalArray: [Int] = Array.init(repeating: Int.max, count: changeDueInCents + 1)
        minDenominationsToTotalArray[0] = 0
        var denominationsUsedToReachTotal: [DenominationInCents?] = Array.init(repeating: nil, count: changeDueInCents + 1)

        for targetTotal in 0...changeDueInCents {
            for denomination in DenominationInCents.allCases {
                guard denomination.rawValue <= targetTotal else {
                    // since DenominationInCents.allCases is sorted don't need to check any values larger than the target total
                    break
                }

                let minDenominationsIfUsingCurrentDenominationNext = minDenominationsToTotalArray[targetTotal - denomination.rawValue] + 1
                if minDenominationsToTotalArray[targetTotal] > minDenominationsIfUsingCurrentDenominationNext {
                    minDenominationsToTotalArray[targetTotal] = minDenominationsIfUsingCurrentDenominationNext
                    denominationsUsedToReachTotal[targetTotal] = denomination
                }
            }
        }

        return denominationsUsedToReachTotal
    }

    private mutating func populateDenominationsUsed(with denominationsUsed: [DenominationInCents?]) -> Bool {
        var index = denominationsUsed.count - 1
        while index > 0 {
            guard let denomination = denominationsUsed[index] else {
                // Change is not possible. Will not exist with pennies in play
                return false
            }
            switch denomination {
            case .penny: pennies += 1
            case .nickle: nickles += 1
            case .dime: dimes += 1
            case .quarter: quarters += 1
            case .loonie: loonies += 1
            case .toonie: toonies += 1
            case .five: fives += 1
            case .ten: tens += 1
            case .twenty: twenties += 1
            case .fifty: fifties += 1
            case .hundred: hundreds += 1
            }
            index -= denomination.rawValue
        }
        return true
    }
}
