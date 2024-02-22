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
    var post: PostData!
    
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
        
        return label
    }()
    
    private var branchAndDateLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private var contentContainerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private var contentLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private var contentImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
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
                                         contentLabel)
    }
    
    func makeConstraints() {
        mainContainerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(16)
            make.bottom.greaterThanOrEqualTo(userImageView).priority(.high)
            make.bottom.equalTo(contentContainerView).offset(16)
        }
        
        userImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.width.height.equalTo(36)
        }
        
        contentContainerView.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.leading.equalTo(userImageView.snp.trailing).offset(10)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
            
        }
        
    }
    
    func setPost(_ post: PostData) {
        self.post = post
        // let userImageUrlString = post.profil
        let userImageUrlString = "https://live.staticflickr.com/65535/51734305911_f4541d7629_m.jpg"
        guard let url = URL(string: userImageUrlString) else { return }
        self.userImageView.kf.setImage(with: url)
    }
}

extension PostTableViewCell {
    static func makeCell(_ tableView: UITableView,
                         post: PostData) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier) as? PostTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.setPost(post)
        return cell
    }
}
