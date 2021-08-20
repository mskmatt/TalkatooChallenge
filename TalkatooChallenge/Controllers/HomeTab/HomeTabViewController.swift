//
//  HomeTabViewController.swift
//  TalkatooChallenge
//
//  Created by mskmatt on 20/08/2021.
//

import UIKit

class HomeTabViewController: UIViewController {
    @IBOutlet weak var changeDueValueLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var amountPaidLabel: UILabel!
    
    @IBOutlet weak var numberOf5sLabel: UILabel!
    @IBOutlet weak var numberOf10sLabel: UILabel!
    @IBOutlet weak var numberOf25sLabel: UILabel!
    @IBOutlet weak var numberOf50sLabel: UILabel!
    @IBOutlet weak var numberOf100sLabel: UILabel!
    
    @IBOutlet weak var numberOfPenniesLabel: UILabel!
    @IBOutlet weak var numberOfNickelsLabel: UILabel!
    @IBOutlet weak var numberOfDimesLabel: UILabel!
    @IBOutlet weak var numberOfQuartersLabel: UILabel!
    @IBOutlet weak var numberOfLooniesLabel: UILabel!
    @IBOutlet weak var numberOfTooniesLabel: UILabel!
    
    @IBAction func addTotal(_ sender: Any) {
        let textFieldData = Alert.TextFieldData(placeholder: "Total", keyboardType: .decimalPad)
        let cancelAction = Alert.ActionData(title: "Cancel", style: .cancel, handler: nil)
        let saveAction = Alert.ActionData(title: "Next", style: .default) {
            self.viewModel.setTotal($0?.text)
        }
        let alertData = Alert.Data(title: "Purchase Total", message: "Enter the total amount due.", textFieldData: textFieldData, actions: [cancelAction, saveAction])
        Alert.displayAlertWithTextField(in: self, with: alertData)
    }
    
    @IBAction func addAmountPaid(_ sender: Any) {
        let textFieldData = Alert.TextFieldData(placeholder: "Total", keyboardType: .decimalPad)
        let cancelAction = Alert.ActionData(title: "Cancel", style: .cancel, handler: nil)
        let saveAction = Alert.ActionData(title: "Done", style: .default) {
            self.viewModel.setTotal($0?.text)
        }
        let alertData = Alert.Data(title: "Amount Paid", message: "Enter how much your customer paid.", textFieldData: textFieldData, actions: [cancelAction, saveAction])
        Alert.displayAlertWithTextField(in: self, with: alertData)
    }

    let viewModel = HomeTabViewModel()
}
