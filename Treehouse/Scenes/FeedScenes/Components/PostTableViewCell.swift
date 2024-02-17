//
//  PostTableViewCell.swift
//  Treehouse
//
//  Created by BoMin Lee on 2/13/24.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    private var mainContainerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private var userImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private var userIdLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private var branchAndDateLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private var contentLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private var contentImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
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
    }
    
    func makeConstraints() {
        mainContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
        }
    }
}
