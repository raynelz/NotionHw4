//
//  ContainerView.swift
//  NotionHw4
//
//  Created by Захар Литвинчук on 02.01.2024.
//

import UIKit
import SnapKit

class ContainerView: UIView {
    
    //MARK: - UI
    private let titleLabel = UILabel()
    private let imageView = UIImageView()
    
    let text: String = ""
    let image: UIImage = .checkmark
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        embedViews()
        setupLayout()
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Embed Views

private extension ContainerView {
    
    func embedViews() {
        addSubview(titleLabel)
        addSubview(imageView)
    }
    
}

//MARK: - Setup Layout

private extension ContainerView {
    
    func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.centerX.equalToSuperview()
            make.height.equalTo(36)
            make.width.equalTo(36)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
    }
    
}

//MARK: - Setup Appearance

private extension ContainerView {
    
    func setupAppearance() {
        imageView.contentMode = .scaleAspectFit
        
        titleLabel.textColor = .secondaryLabel
        titleLabel.font = .systemFont(ofSize: 13, weight: .regular)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        
        
        backgroundColor = .green
        layer.cornerRadius = 15
    }
    
}

//MARK: - Set Text

extension ContainerView {
    
    func set(text: String) {
        titleLabel.text = text
    }
    
}

//MARK: - Set Image

extension ContainerView {
    
    func set(image: UIImage) {
        imageView.image = image
    }
    
}
