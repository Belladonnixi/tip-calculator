//
//  ResultView.swift
//  tip-calculator
//
//  Created by Jessi on 08.04.24.
//

import UIKit

class ResultView: UIView {
    
    init() {
        super.init(frame: .zero)
        layout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        backgroundColor = .systemPink
    }
}
