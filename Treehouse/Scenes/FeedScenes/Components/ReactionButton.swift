//
//  ReactionButton.swift
//  Treehouse
//
//  Created by 이전희 on 2/23/24.
//

import UIKit

class ReactionButton: UIButton {
    
    var emoji: String{
        didSet {
            updateLayout()
        }
    }
    
    var count: Int {
        didSet {
            updateLayout()
        }
    }
    
    override var isSelected: Bool {
        didSet {
            print(isSelected)
        }
    }
    
    private var mainContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 13
        view.backgroundColor = .trButtonBackground
        view.layer.borderColor = UIColor.trButtonSelectedBorder.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private var emojiLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(size: 16)
        return label
    }()
    
    private var countLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(size: 12)
        return label
    }()
    
    init(emoji: String, count: Int) {
        self.emoji = emoji
        self.count = count
        
        super.init(frame: .zero)
        configure()
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
    }
    
    private func addSubviews() {
        self.addSubviews(mainContainerView)
        mainContainerView.addSubviews(emojiLabel, countLabel)
    }
    
    private func makeConstraints() {
        self.snp.makeConstraints { make in
            make.width.height.equalTo(mainContainerView)
        }
        
        mainContainerView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.trailing.equalTo(countLabel).offset(8)
            make.height.equalTo(26)
        }
        
        emojiLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(5)
            make.centerY.equalToSuperview()
        }
        
        countLabel.snp.makeConstraints { make in
            make.leading.equalTo(emojiLabel.snp.trailing).offset(3)
            make.centerY.equalToSuperview()
        }
    }
    
    private func updateLayout() {
        self.emojiLabel.text = emoji
        self.countLabel.text = "\(count)"
    }
    
    func changeCount(_ count: Int) {
        UIView.animate(withDuration: 0.2) {
            self.count = count
            self.layoutIfNeeded()
        }
    }
}
