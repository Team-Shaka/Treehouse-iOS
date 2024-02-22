//
//  PostTableViewCell.swift
//  Treehouse
//
//  Created by BoMin Lee on 2/13/24.
//

import UIKit
import Kingfisher

class PostTableViewCell: UITableViewCell {
    static let identifier: String = String(describing: PostTableViewCell.self)
    
    var post: PostData! {
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
        return imageView
    }()
    
    private var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(size: 16, weight: .semiBold)
        label.textColor = .black
        return label
    }()
    
    private var branchAndDateLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(size: 12)
        label.textColor = .trSubTextGray
        label.text = "Branch 2·하루 전"
        return label
    }()
    
    private var postSettingButton: UIButton = {
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.image = UIImage(systemName: "ellipsis")
        buttonConfiguration.baseForegroundColor = .trSubTextGray
        buttonConfiguration.setDefaultContentInsets()
        let button = UIButton(configuration: buttonConfiguration)
        return button
    }()
    
    private var contentContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private var contentImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private var commentCountView: CommentCountView = {
        let commentCountView = CommentCountView(count: 0)
        return commentCountView
    }()
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
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
                                      contentContainerView)
        contentContainerView.addSubviews(userNameLabel,
                                         branchAndDateLabel,
                                         postSettingButton,
                                         contentLabel,
                                         commentCountView)
    }
    
    func makeConstraints() {
        mainContainerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(16)
            make.bottom.greaterThanOrEqualTo(userImageView).priority(.high)
            make.bottom.equalTo(contentContainerView).offset(16)
            make.bottom.equalTo(self.contentView).offset(10)
        }
        
        userImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.width.height.equalTo(36)
        }
        
        contentContainerView.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.leading.equalTo(userImageView.snp.trailing).offset(10)
            make.bottom.equalTo(commentCountView)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.height.equalTo(20)
        }
        
        branchAndDateLabel.snp.makeConstraints { make in
            make.leading.equalTo(userNameLabel.snp.trailing).offset(4)
            make.trailing.lessThanOrEqualTo(postSettingButton.snp.leading).inset(-8)
            make.centerY.equalTo(userNameLabel)
        }
        
        postSettingButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.height.width.equalTo(18)
            make.centerY.equalTo(userNameLabel)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(6)
            make.leading.trailing.equalToSuperview()
        }
        
        commentCountView.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    func update() {
        guard let url = URL(string: post.profileImageUrl) else { return }
        self.userImageView.kf.setImage(with: url)
        self.userNameLabel.text = post.memberName
        self.contentLabel.text = post.content
        self.commentCountView.count = post.commentCount
    }
}

extension PostTableViewCell {
    static func makeCell(_ tableView: UITableView,
                         post: PostData) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier) as? PostTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.post = post
        return cell
    }
}
