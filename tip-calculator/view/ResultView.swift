//
//  ResultView.swift
//  tip-calculator
//
//  Created by Jessi on 08.04.24.
//

import UIKit

class ResultView: UIView {
    
    private let headerLabel: UILabel = {
        let fontSize = UIScreen.main.bounds.size.width * 0.045
        let label = LabelFactory.build(
            text: "Total p/person",
            font: ThemeFont.demiBold(ofSize: fontSize))
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 0
        return label
    }()
    
    private let amountPerPersonLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        let fontSize = UIScreen.main.bounds.size.width * 0.12
        let text = NSMutableAttributedString(
            string: "0€",
            attributes: [
                .font: ThemeFont.bold(ofSize: fontSize)
            ])
        label.attributedText = text
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 0
        label.accessibilityIdentifier = ScreenIdentifier.ResultView.totalAmountPerPersonValueLabel.rawValue
        return label
    }()
        
    private let horizontalLineView: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColor.separator
        return view
    }()
    
    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            headerLabel,
            amountPerPersonLabel,
            horizontalLineView,
            buildSpacerView(height: 0),
            hStackView
        ])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private let totalTipView: AmountView = {
        let view = AmountView(
            title: "Total tip",
            textAlignement: .right, 
            amountLabelIdentifier: ScreenIdentifier.ResultView.totalTipValueLabel.rawValue)
        return view
    }()
    
    private let totalBillView: AmountView = {
        let view = AmountView(
            title: "Total bill",
            textAlignement: .left, 
            amountLabelIdentifier: ScreenIdentifier.ResultView.totalBillValueLabel.rawValue)
        return view
    }()
    
    private lazy var hStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            totalBillView,
            UIView(),
            totalTipView
        ])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        layout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(result: Result) {
        let text = NSMutableAttributedString(
            string: result.amountPerPerson.currencyFormatted,
            attributes: [.font: ThemeFont.bold(ofSize: 48)])
        amountPerPersonLabel.attributedText = text
        
        totalBillView.configure(amount: result.totalBill)
        totalTipView.configure(amount: result.totalTip)
    }
    
    private func layout() {
        backgroundColor = .white
        addSubview(vStackView)
        
        vStackView.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(16)
            make.leading.equalTo(snp.leading).offset(16)
            make.trailing.equalTo(snp.trailing).offset(-16)
            make.bottom.equalTo(snp.bottom).offset(-16)
        }
        
        headerLabel.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(20)
        }
        
        amountPerPersonLabel.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(40)
        }
        
        horizontalLineView.snp.makeConstraints { make in
            make.height.equalTo(2)
        }
        
        addShadow(
            offset: CGSize(width: 0, height: 3),
            color: .black,
            radius: 12.0,
            opacity: 0.1)
    }
    
    private func buildSpacerView(height: CGFloat) -> UIView {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
        return view
    }
}
