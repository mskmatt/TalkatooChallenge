//
//  DialogBox.swift
//  TalkatooChallenge
//
//  Created by mskmatt on 20/08/2021.
//

import UIKit

class Alert {
    static func displayAlertWithTextField(in presenter: UIViewController, with data: Data) {
        let alert = UIAlertController(title: data.title, message: data.message, preferredStyle: .alert)
        if let textFieldData = data.textFieldData {
            alert.addTextField(configurationHandler: { textField in
                textField.placeholder = textFieldData.placeholder
                textField.keyboardType = textFieldData.keyboardType
            })
        }
        data.actions.forEach { actionData in
            let action = UIAlertAction(
                title: actionData.title,
                style: actionData.style
            ) { _ in
                actionData.handler?(alert.textFields?.first)
            }
            alert.addAction(action)
        }
        presenter.present(alert, animated: true, completion: nil)
    }
    
    struct Data {
        let title: String
        let message: String
        let textFieldData: TextFieldData?
        let actions: [ActionData]
    }
    
    struct TextFieldData {
        let placeholder: String
        let keyboardType: UIKeyboardType
    }
    
    struct ActionData {
        let title: String
        let style: UIAlertAction.Style
        let handler: ((UITextField?) -> Void)?
    }
}
