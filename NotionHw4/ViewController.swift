//
//  ViewController.swift
//  NotionHw4
//
//  Created by Захар Литвинчук on 02.01.2024.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    //MARK: - UI
    private let checkImageView = UIImageView()
    private let clientLabel = UILabel()
    private let totalCostLabel = UILabel()
    private let feeLabel = UILabel()
    private let transactionDateLabel = UILabel()
    private let containersStackView = UIStackView()
    
    private let containers = [
        ContainerView() : ContainerModel(id: 1, title: "Open\nreceipt", image: .receipt),
        ContainerView() : ContainerModel(id: 2, title: "Create\nsample", image: .favourite),
        ContainerView() : ContainerModel(id: 4, title: "Repeat\npayment", image: .repeat)
    ].sorted { $0.value.id < $1.value.id }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        embedViews()
        setupLayout()
        setupContainers()
        setupContainersData()
        setupAppearance()
        setupText()
    }
    
}

//MARK: - Embed Views

private extension ViewController {
    
    func embedViews() {
        [
            checkImageView,
            clientLabel,
            totalCostLabel,
            feeLabel,
            transactionDateLabel,
            containersStackView
        ].forEach { view.addSubview($0) }
    }
    
}

//MARK: - Setup Layout

private extension ViewController {
    
    func setupLayout() {
        
        checkImageView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin).offset(70)
            make.centerX.equalToSuperview()
        }
        
        clientLabel.snp.makeConstraints { make in
            make.top.equalTo(checkImageView.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }
        
        totalCostLabel.snp.makeConstraints { make in
            make.top.equalTo(clientLabel.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
        
        feeLabel.snp.makeConstraints { make in
            make.top.equalTo(totalCostLabel.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
        
        transactionDateLabel.snp.makeConstraints { make in
            make.top.equalTo(feeLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
        }
        
        containersStackView.snp.makeConstraints { make in
            make.top.equalTo(transactionDateLabel.snp.bottom).offset(24)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.lessThanOrEqualTo(view.snp.bottom).offset(34)
        }
        
    }
    
}

//MARK: - Setup Containers

private extension ViewController {
    
    func setupContainers() {
        containers.forEach { view, _ in
            containersStackView.addArrangedSubview(view)
        }
    }
    
    func setupContainersData() {
        containers.forEach { view, model in
            view.set(text: model.title)
            view.set(image: model.image)
        }
    }
    
}

//MARK: - Setup Appearance

private extension ViewController {
    
    func setupAppearance() {
        view.backgroundColor = .systemGray6
        
        checkImageView.image = .checkIcon
        checkImageView.contentMode = .scaleAspectFit
        
        clientLabel.textColor = .label
        clientLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        
        totalCostLabel.textColor = .label
        totalCostLabel.font = .systemFont(ofSize: 30, weight: .black)
        
        feeLabel.textColor = .secondaryLabel
        feeLabel.font = .systemFont(ofSize: 13, weight: .regular)
        
        transactionDateLabel.textColor = .secondaryLabel
        transactionDateLabel.font = .systemFont(ofSize: 13, weight: .regular)
        
        containersStackView.alignment = .fill
        containersStackView.axis = .horizontal
        containersStackView.distribution = .fillProportionally
        containersStackView.spacing = 13
        
        [clientLabel, totalCostLabel, feeLabel, transactionDateLabel].forEach { label in
            label.textAlignment = .center
            label.numberOfLines = 0
        }

    }
    
}

//MARK: - Setup Text

private extension ViewController {
    
    func setupText() {
        clientLabel.text = "Aleksander Dmitrievich V."
        
        totalCostLabel.text = "100$"
        
        feeLabel.text = "No commission"
        
        transactionDateLabel.text = "Completed, 12 September 16:00"
    }
    
}

#Preview(traits: .portrait, body: {
    ViewController()
})
