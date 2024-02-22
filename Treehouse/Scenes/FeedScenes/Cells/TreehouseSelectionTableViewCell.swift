//
//  TreehouseSelectionTableViewCell.swift
//  Treehouse
//
//  Created by BoMin Lee on 2/23/24.
//

import UIKit

class TreehouseSelectionTableViewCell: UITableViewCell {
    static let identifier: String = String(describing: TreehouseSelectionTableViewCell.self)
    
    private var mainContainerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private var treehouseView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.trPrimaryGray.cgColor
        view.layer.cornerRadius = 35
        return view
    }()
    
    private var checkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = TreehouseImageCollection.checkNormal
        return imageView
    }()
    
    private var treehouseNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .pretendard(size: 16, weight: .bold)
        label.textColor = .black
        label.text = "점심팟"
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
        label.textAlignment = .left
        label.font = .pretendard(size: 16)
        label.textColor = .trPrimaryGray
        label.text = "외 20명"
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
    
    func configure() {
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
    }
    
    func addSubviews() {
        self.contentView.addSubview(mainContainerView)
        mainContainerView.addSubview(treehouseView)

        treehouseView.addSubviews(checkImageView,
                                  treehouseNameLabel,
                                  member1ImageView,
                                  member2ImageView,
                                  member3ImageView,
                                  memberCountLabel)
    }
    
    func makeConstraints() {
        mainContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        treehouseView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().inset(8)
            make.trailing.equalToSuperview().inset(16)
        }
        
        checkImageView.snp.makeConstraints{ make in
            make.width.height.equalTo(30)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(22)
        }
        
//        memberCountLabel.snp.makeConstraints{ make in
//            make.trailing.equalToSuperview().inset(22)
//            make.centerY.equalToSuperview()
//        }
        
        member1ImageView.snp.makeConstraints{ make in
            make.trailing.equalTo(memberCountLabel.snp.leading).inset(-50)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(30)
        }
    
        member2ImageView.snp.makeConstraints{ make in
            make.leading.equalTo(member1ImageView.snp.leading).offset(20)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(30)
        }
        
        member3ImageView.snp.makeConstraints{ make in
            make.leading.equalTo(member2ImageView.snp.leading).offset(20)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(30)
        }
        
        treehouseNameLabel.snp.makeConstraints{ make in
            make.leading.equalTo(checkImageView.snp.trailing)
            make.trailing.equalTo(member1ImageView.snp.leading)
            make.centerY.equalToSuperview()
        }
        
        memberCountLabel.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().inset(22)
            make.centerY.equalToSuperview()
        }
        
        treehouseView.bringSubviewToFront(member2ImageView)
        treehouseView.bringSubviewToFront(member1ImageView)
    }
}

extension TreehouseSelectionTableViewCell {
    static func makeCell(_ tableView: UITableView,
                         treehouse: TreehouseData) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TreehouseSelectionTableViewCell.identifier) as? TreehouseSelectionTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        return cell
    }
}
