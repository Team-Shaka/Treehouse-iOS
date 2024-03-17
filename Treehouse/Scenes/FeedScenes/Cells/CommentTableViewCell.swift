//
//  CommentTableViewCell.swift
//  Treehouse
//
//  Created by BoMin Lee on 2/29/24.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    static let identifier: String = String(describing: CommentTableViewCell.self)
    
    var comment: CommentData! {
        didSet {
            update()
        }
    }
    
    private var mainContainerView: UIView = {
        let view = UIView()
        
        return view
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
            make.edges.equalToSuperview()
        }
    }
    
    func update() {
        
    }
}

extension CommentTableViewCell {
    static func makeCell(_ tableView: UITableView,
                         comment: CommentData) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.identifier) as? CommentTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.comment = comment
        return cell
    }
}
