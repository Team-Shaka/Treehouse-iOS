//
//  TreehouseCreateTableViewCell.swift
//  Treehouse
//
//  Created by BoMin Lee on 2/23/24.
//

import UIKit

class TreehouseCreateTableViewCell: UITableViewCell {
    static let identifier: String = String(describing: TreehouseCreateTableViewCell.self)
    
    private var mainContainerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private var createTreehouseView: UIView = {
        let view = UIView()
        view.backgroundColor = .trTextGray
        view.layer.cornerRadius = 35
        return view
    }()
    
    private var plusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = TreehouseImageCollection.plus
        return imageView
    }()
    
    private var createTreehouseLabel: UILabel = {
        let label = UILabel()
        label.text = "새로운 트리 만들기"
        label.font = .pretendard(size: 16, weight: .bold)
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
        
        mainContainerView.addSubview(createTreehouseView)
        createTreehouseView.addSubviews(createTreehouseLabel, plusImageView)
    }
    
    func makeConstraints() {
        mainContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        createTreehouseView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().inset(8)
            make.trailing.equalToSuperview().inset(16)
        }
        
        createTreehouseLabel.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview().offset(4)
        }
        
        plusImageView.snp.makeConstraints{ make in
            make.width.height.equalTo(20)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(createTreehouseLabel.snp.leading).offset(-1)
        }
    }
    
    func update() {
        
    }
}

extension TreehouseCreateTableViewCell {
    static func makeCell(_ tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TreehouseCreateTableViewCell.identifier) as? TreehouseCreateTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        return cell
    }
}
