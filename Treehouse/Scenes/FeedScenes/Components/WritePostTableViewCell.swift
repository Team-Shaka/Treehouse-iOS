//
//  WritePostTableViewCell.swift
//  Treehouse
//
//  Created by BoMin Lee on 2/13/24.
//

import UIKit

class WritePostTableViewCell: UITableViewCell {
    private var mainContainerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private var userImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private var writePostTextField: UITextField = {
        let textField = UITextField()
        
        return textField
    }()
    
    private lazy var addPictureButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
    }
    
    func addSubviews() {
        self.contentView.addSubview(mainContainerView)
        
        mainContainerView.addSubviews(userImageView, writePostTextField)
    }
    
    func makeConstraints() {
        mainContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
        }
        
        userImageView.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(36)
        }
        
        addPictureButton.snp.makeConstraints{ make in
            make.centerY.equalTo(userImageView)
            make.trailing.equalToSuperview().inset(14)
            make.height.width.equalTo(30)
        }
        
        writePostTextField.snp.makeConstraints{ make in
            make.centerY.equalTo(userImageView)
            make.leading.equalTo(userImageView.snp.trailing).offset(6)
            make.trailing.equalTo(addPictureButton.snp.leading).inset(12)
        }
    }
}
