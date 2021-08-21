//
//  HomeTabViewModel.swift
//  TalkatooChallenge
//
//  Created by mskmatt on 20/08/2021.
//

import UIKit

class HomeTabViewModel {
    weak var delegate: HomeTabViewModelDelegate?
    var changeBreakdown = ChangeBreakdown()

    private var total: Double? {
        didSet {
            self.changeBreakdown = ChangeBreakdown(changeDue: changeDue) ?? ChangeBreakdown()
            delegate?.totalUpdated()
        }
    }
    private var amountPaid: Double? {
        didSet {
            self.changeBreakdown = ChangeBreakdown(changeDue: changeDue) ?? ChangeBreakdown()
            delegate?.amountPaidUpdated()
        }
    }
    
    var changeDue: Double {
        guard let total = total,
              let amountPaid = amountPaid
        else {
            return 0.0
        }
        return amountPaid - total
    }
    
    var changeDueString: String {
        return changeDue.toDollarsString() ?? "$0.00"
    }

    var totalAttributedText: NSMutableAttributedString {
        if let total = total?.toDollarsString() {
            let attributedString = NSMutableAttributedString(string: "Total: ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15.0)])
            let boldSection = NSMutableAttributedString(string: total, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15.0), NSAttributedString.Key.foregroundColor: UIColor.black])
            attributedString.append(boldSection)
            return attributedString
        } else {
            return NSMutableAttributedString(string: "Start by adding total", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15.0)])
        }
    }

    var addTotalButtonTitle: String {
        return total == nil ? "Add Total" : "Edit Total"
    }

    var amountPaidAttributedText: NSMutableAttributedString {
        if let amountPaid = amountPaid?.toDollarsString() {
            let attributedString = NSMutableAttributedString(string: "Paid: ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15.0)])
            let boldSection = NSMutableAttributedString(string: amountPaid, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15.0), NSAttributedString.Key.foregroundColor: UIColor.black])
            attributedString.append(boldSection)
            return attributedString
        } else {
            return NSMutableAttributedString(string: "Then add amount paid", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15.0)])
        }
    }

    var addAmountPaidButtonTitle: String {
        return amountPaid == nil ? "Add Paid" : "Edit Paid"
    }

    func setTotal(_ totalString: String?) {
        guard let totalString = totalString else {
            total = nil
            return
        }
        total = Double(totalString)
    }

    func setAmountPaid(_ amountPaidString: String?) {
        guard let amountPaidString = amountPaidString else {
            amountPaid = nil
            return
        }
        amountPaid = Double(amountPaidString)
    }

    func reset() {
        total = nil
        amountPaid = nil
    }
}

protocol HomeTabViewModelDelegate: AnyObject {
    func totalUpdated()
    func amountPaidUpdated()
}
