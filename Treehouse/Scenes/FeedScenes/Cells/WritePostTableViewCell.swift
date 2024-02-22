//
//  WritePostTableViewCell.swift
//  Treehouse
//
//  Created by BoMin Lee on 2/13/24.
//

import UIKit

class WritePostTableViewCell: UITableViewCell {
    static let identifier: String = String(describing: WritePostTableViewCell.self)
    
    private var mainContainerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemBlue
        imageView.layer.cornerRadius = 18
        return imageView
    }()
    
    private var writePostTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "점심팟에 글 쓰기..."
        textField.font = .pretendard(size: 16, weight: .light)
        return textField
    }()
    
    private lazy var addPictureButton: UIButton = {
        let button = UIButton()
        button.setImage(TreehouseImageCollection.addPicture, for: .normal)
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
        
        mainContainerView.addSubviews(userImageView, writePostTextField, addPictureButton)
    }
    
    func makeConstraints() {
        mainContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        userImageView.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(36)
        }
        
        addPictureButton.snp.makeConstraints{ make in
            make.centerY.equalTo(userImageView)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(30)
        }
        
        writePostTextField.snp.makeConstraints{ make in
            make.centerY.equalTo(userImageView)
            make.leading.equalTo(userImageView.snp.trailing).offset(8)
            make.trailing.equalTo(addPictureButton.snp.leading).inset(12)
        }
    }
}

extension WritePostTableViewCell {
    static func makeCell(_ tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WritePostTableViewCell.identifier) as? WritePostTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        return cell
    }
}
