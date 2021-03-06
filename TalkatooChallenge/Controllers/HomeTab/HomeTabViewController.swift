//
//  HomeTabViewController.swift
//  TalkatooChallenge
//
//  Created by mskmatt on 20/08/2021.
//

import UIKit

class HomeTabViewController: UIViewController {
    @IBOutlet weak var changeDueContainerView: UIView!
    @IBOutlet weak var changeDueValueLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var addTotalButton: UIButton!
    @IBOutlet weak var amountPaidLabel: UILabel!
    @IBOutlet weak var addAmountPaidButton: UIButton!
    @IBOutlet weak var amountPaidContainerView: UIView!

    @IBOutlet weak var changeBreakdownTitleLabel: UILabel!
    @IBOutlet weak var numberOf5sLabel: UILabel!
    @IBOutlet weak var numberOf10sLabel: UILabel!
    @IBOutlet weak var numberOf20sLabel: UILabel!
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
            self.viewModel.setAmountPaid($0?.text)
        }
        let alertData = Alert.Data(title: "Amount Paid", message: "Enter how much your customer paid.", textFieldData: textFieldData, actions: [cancelAction, saveAction])
        Alert.displayAlertWithTextField(in: self, with: alertData)
    }

    @IBAction func resetInput(_ sender: Any) {
        viewModel.reset()
    }

    let viewModel = HomeTabViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.delegate = self
        configureChangeDueValue()
        configureTotalView()
        configureAmountPaidView()
        configureBillsDueView()
        configureCoinsDueView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        design()
    }

    func design() {
        changeDueContainerView.roundCorners(corners: [.topLeft, .topRight], radius: 8)
        drawBackground()
    }

    func drawBackground() {
        let path = UIBezierPath()
        let amonutPaidBottom = amountPaidContainerView.frame.maxY
        let changeBreakdownTitleTop = changeBreakdownTitleLabel.frame.minY
        let horizontalLineY = (amonutPaidBottom + changeBreakdownTitleTop) / 2
        let arcRadius: CGFloat = 75

        path.move(to: CGPoint(x: 0, y: horizontalLineY - arcRadius))
        path.addArc(
            withCenter: CGPoint(x: arcRadius, y: horizontalLineY - arcRadius),
            radius: arcRadius,
            startAngle: CGFloat(Double.pi),
            endAngle: CGFloat(Double.pi/2),
            clockwise: false
        )
        path.addLine(to: CGPoint(x: view.frame.maxX - arcRadius, y: horizontalLineY))
        path.addArc(
            withCenter: CGPoint(x: view.frame.maxX - arcRadius, y: horizontalLineY + arcRadius),
            radius: arcRadius,
            startAngle: CGFloat(3*Double.pi/2),
            endAngle: CGFloat(2*Double.pi),
            clockwise: true
        )
        path.addLine(to: CGPoint(x: view.frame.maxX, y: view.frame.maxY))
        path.addLine(to: CGPoint(x: view.frame.minX, y: view.frame.maxY))
        path.addLine(to: CGPoint(x: view.frame.minX, y: horizontalLineY - arcRadius))

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.frame = view.bounds

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor(red: 0.627, green: 0.91, blue: 0.651, alpha: 1).cgColor,
            UIColor(red: 0.925, green: 0.961, blue: 0.894, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.mask = shapeLayer

        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }

    func configureChangeDueValue() {
        changeDueValueLabel.text = viewModel.changeDueString
    }

    func configureTotalView() {
        totalLabel.attributedText = viewModel.totalAttributedText
        addTotalButton.setTitle(viewModel.addTotalButtonTitle, for: .normal)
    }

    func configureAmountPaidView() {
        amountPaidLabel.attributedText = viewModel.amountPaidAttributedText
        addAmountPaidButton.setTitle(viewModel.addAmountPaidButtonTitle, for: .normal)
    }

    func configureBillsDueView() {
        numberOf5sLabel.text = "\(viewModel.changeBreakdown.fives)"
        numberOf10sLabel.text = "\(viewModel.changeBreakdown.tens)"
        numberOf20sLabel.text = "\(viewModel.changeBreakdown.twenties)"
        numberOf50sLabel.text = "\(viewModel.changeBreakdown.fifties)"
        numberOf100sLabel.text = "\(viewModel.changeBreakdown.hundreds)"
    }

    func configureCoinsDueView() {
        numberOfPenniesLabel.text = "\(viewModel.changeBreakdown.pennies)"
        numberOfNickelsLabel.text = "\(viewModel.changeBreakdown.nickles)"
        numberOfDimesLabel.text = "\(viewModel.changeBreakdown.dimes)"
        numberOfQuartersLabel.text = "\(viewModel.changeBreakdown.quarters)"
        numberOfLooniesLabel.text = "\(viewModel.changeBreakdown.loonies)"
        numberOfTooniesLabel.text = "\(viewModel.changeBreakdown.toonies)"
    }
}

extension HomeTabViewController: HomeTabViewModelDelegate {
    func totalUpdated() {
        configureTotalView()
        configureChangeDueValue()
        configureBillsDueView()
        configureCoinsDueView()
    }

    func amountPaidUpdated() {
        configureAmountPaidView()
        configureChangeDueValue()
        configureBillsDueView()
        configureCoinsDueView()
    }
}
