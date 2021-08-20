//
//  HomeTabViewModel.swift
//  TalkatooChallenge
//
//  Created by mskmatt on 20/08/2021.
//

import Foundation

class HomeTabViewModel {
    var total: Double?
    var amountPaid: Double?
    
    var changeDue: Double {
        guard let total = total,
              let amountPaid = amountPaid
        else {
            return 0.0
        }
        return total - amountPaid
    }
    
    var changeDueString: String {
        return changeDue.toDollarsString() ?? "$0.00"
    }

    func setTotal(_ totalString: String?) {
        
    }
}
