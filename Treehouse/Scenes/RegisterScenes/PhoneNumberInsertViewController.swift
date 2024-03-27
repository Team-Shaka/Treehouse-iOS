//
//  PhoneNumberInsertViewController.swift
//  Treehouse
//
//  Created by BoMin Lee on 3/18/24.
//

import UIKit

class PhoneNumberInsertViewController: UIViewController {
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "만나서 반가워요!\n가입과 로그인을 위해 전화번호를 입력해주세요!"
        label.numberOfLines = 0
        label.font = .pretendard(size: 20)
        label.textColor = .black
        return label
    }()
    
    private var phoneNumberTextField: UITextField = {
        let textField = UITextField()
        let textFieldPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 75, height: 40))
        let countryCodeLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 65, height: 40))
        textField.placeholder = "전화번호"
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.trTextGray.cgColor
        textField.layer.cornerRadius = 5.0
        textField.leftView = textFieldPaddingView
        return textField
    }()
    
    private lazy var sendVerificationNumberButton: RegisterBottomButton = {
        let button = RegisterBottomButton(title: "인증 번호 보내기")
        
        return button
    }()
}
