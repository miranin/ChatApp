//
//  ConversationCell.swift
//  UITinkoffHomework
//
//  Created by Tamirlan Aubakirov on 24.07.2023.
//

import UIKit


final class ConversationCell: UITableViewCell {
    private let nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    private let lastMessageLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    private lazy var disclosureButton: UIButton = {
        let button = UIButton(frame: .zero)
        return button
    }()
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.frame.size.width = 24
        profileImageView.frame.size.height = 24
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 12),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
    }
}
