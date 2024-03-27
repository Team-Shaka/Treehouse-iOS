//
//  RegisterBottomButton.swift
//  Treehouse
//
//  Created by BoMin Lee on 3/18/24.
//

import UIKit
import SnapKit

class RegisterBottomButton: UIButton {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setupButton()
    }
    
    private func setupButton() {
        backgroundColor = .black
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .pretendard(size: 20)
        layer.cornerRadius = 30
        clipsToBounds = true
    }
}

