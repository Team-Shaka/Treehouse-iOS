//
//  TreehallTableViewCell.swift
//  Treehouse
//
//  Created by BoMin Lee on 2/13/24.
//

import UIKit

class TreehallTableViewCell: UITableViewCell {
    static let identifier: String = String(describing: TreehallTableViewCell.self)
    
    private lazy var mainContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var treeNameLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(size: 12)
        label.textColor = .trTextGray
        label.text = "점심팟의 트리홀"
        return label
    }()
    
    private var treehallNameLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(size: 18, weight: .bold)
        label.textColor = .trBackgroundWhite
        label.text = "트리홀 제목 트리홀 제목"
        return label
    }()
    
    private var member1ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemBlue
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    private var member2ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemYellow
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    private var member3ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemRed
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    private var memberCountLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(size: 12)
        label.textColor = .trTextGray
        label.text = "외 3명이 노닥거리는 중"
        return label
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
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        print(mainContainerView.bounds)
        mainContainerView.addGradientLayer(firstColor: .trHallGradientGreen,
                                           secondColor: .trHallGradientBlue)
    }
    
    func configure() {
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.mainContainerView.layer.cornerRadius = 20
    }
    
    func addSubviews() {
        self.contentView.addSubview(mainContainerView)
        
        mainContainerView.addSubviews(treeNameLabel,
                                      treehallNameLabel,
                                      member1ImageView,
                                      member2ImageView,
                                      member3ImageView,
                                      memberCountLabel)
    }
    
    func makeConstraints() {
        mainContainerView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(14)
            make.trailing.equalToSuperview().inset(14)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().inset(8)
        }
        
        treeNameLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.lessThanOrEqualToSuperview().inset(20)
        }
        
        treehallNameLabel.snp.makeConstraints{ make in
            make.top.equalTo(treeNameLabel.snp.bottom).offset(4)
            make.leading.trailing.equalTo(treeNameLabel)
        }
        
        member1ImageView.snp.makeConstraints{ make in
            make.top.equalTo(treehallNameLabel.snp.bottom).offset(4)
            make.leading.equalTo(treehallNameLabel)
            make.width.height.equalTo(30)
        }
        
        member2ImageView.snp.makeConstraints{ make in
            make.top.equalTo(member1ImageView)
            make.leading.equalTo(member1ImageView.snp.trailing).inset(10)
            make.width.height.equalTo(30)
        }
        
        member3ImageView.snp.makeConstraints{ make in
            make.top.equalTo(member1ImageView)
            make.leading.equalTo(member2ImageView.snp.trailing).inset(10)
            make.width.height.equalTo(30)
        }
        
        memberCountLabel.snp.makeConstraints{ make in
            make.centerY.equalTo(member1ImageView)
            make.leading.equalTo(member3ImageView.snp.trailing).offset(8)
        }
    }
}
