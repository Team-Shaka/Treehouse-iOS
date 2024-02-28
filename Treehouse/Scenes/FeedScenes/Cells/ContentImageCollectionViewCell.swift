//
//  ContentImageCollectionViewCell.swift
//  Treehouse
//
//  Created by BoMin Lee on 2/24/24.
//

import UIKit
import Kingfisher

final class ContentImageCollectionViewCell: UICollectionViewCell {
    static let identifier: String = String(describing: ContentImageCollectionViewCell.self)
    
    private var imageUrl: String = ""
    
    var isDimmed: Bool = false
    
    private var mainContainerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private var contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .trDimGray
        return view
    }()
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        addSubviews()
        makeConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.prepare(imageUrl: "", isDimmed: false)
    }
    
    func configure() {
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
    }
    
    func addSubviews() {
        self.contentView.addSubview(mainContainerView)
        self.contentView.addSubview(dimmedView)
        
        self.mainContainerView.addSubview(contentImageView)
    }
    
    func makeConstraints() {
        mainContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentImageView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        dimmedView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    
    func prepare(imageUrl: String, isDimmed: Bool) {
        if let url = URL(string: imageUrl) { 
            self.contentImageView.kf.setImage(with: url)
        }
        self.dimmedView.isHidden = !isDimmed
    }
}
