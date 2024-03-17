//
//  NotificationTableViewCell.swift
//  Treehouse
//
//  Created by BoMin Lee on 3/2/24.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    static let identifier: String = String(describing: NotificationTableViewCell.self)
    
    var notification: NotificationData! {
        didSet {
            update()
        }
    }
    
    private var mainContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 18
        imageView.clipsToBounds = true
        imageView.image = TreehouseImageCollection.defaultImage
        return imageView
    }()
    
    private var contentLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(size: 16)
        label.textColor = .black
        label.text = "아럼닝러ㅗㅁㅇㄹㅇ님이 좋아용를 ㅇ라ㅓㄴ마ㅣㅇ러ㅐㅁ냐륟"
        return label
    }()
    
    private var timeLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(size: 12)
        label.textColor = .trSubTextGray
        label.text = "30분 전"
        return label
    }()
    
    private var separatorLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(size: 12)
        label.textColor = .trSubTextGray
        label.text = "·"
        return label
    }()
    
    private var treehouseNameLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(size: 12)
        label.textColor = .trSubTextGray
        label.text = "점심팟"
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
        
        mainContainerView.addSubviews(userImageView,
                                      contentLabel,
                                      timeLabel,
                                      separatorLabel,
                                      treehouseNameLabel)
    }
    
    func makeConstraints() {
        mainContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        userImageView.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(18)
            make.height.width.equalTo(36)
        }
        
        contentLabel.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(userImageView.snp.trailing).offset(14)
            make.trailing.equalToSuperview().inset(16)
        }
        
    }
    
    func update() {
        self.contentLabel.text = notification.message
//        if let url = URL(string: notification.profileImageString) {
//            self.userImageView.kf.setImage(with: url, placeholder: TreehouseImageCollection.defaultImage)
//        }
    }
}

extension NotificationTableViewCell {
    static func makeCell(_ tableView: UITableView,
                         notification: NotificationData) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NotificationTableViewCell.identifier) as? NotificationTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.notification = notification
        return cell
    }
}
