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
    
    private let detailsView = UIView()
    private let infoImageView = UIImageView()
    private let detailsLabel = UILabel()
    private let caretImageView = UIImageView()
    private let detailsButton = UIButton()
    
    
    
    private let containers = [
        ContainerView() : ContainerModel(id: 1, title: "Open\nreceipt", image: .receipt),
        ContainerView() : ContainerModel(id: 2, title: "Create\nsample", image: .favourite),
        ContainerView() : ContainerModel(id: 3, title: "Repeat\npayment", image: .repeat)
    ].sorted { $0.value.id < $1.value.id }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        embedViews()
        setupLayout()
        setupContainers()
        setupContainersData()
        setupAppearance()
        setupText()
        setupBehavior()
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
            containersStackView,
            detailsView
        ].forEach { view.addSubview($0) }
        
        
        [
            infoImageView,
            detailsLabel,
            caretImageView,
            detailsButton
        ].forEach { detailsView.addSubview($0) }
        
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
        }
        
        detailsView.snp.makeConstraints { make in
            make.top.equalTo(containersStackView.snp.bottom).offset(34)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(view.snp.bottom)
        }
        
        infoImageView.snp.makeConstraints { make in
            make.top.equalTo(detailsView.snp.topMargin).offset(20)
            make.leading.equalTo(detailsView.snp.leading).offset(16)
        }
        
        detailsLabel.snp.makeConstraints { make in
            make.top.equalTo(detailsView.snp.topMargin).offset(28)
            make.leading.equalTo(infoImageView.snp.trailing).offset(12)
        }
        
        caretImageView.snp.makeConstraints { make in
            make.top.equalTo(detailsView.snp.topMargin).offset(32)
            make.trailing.equalTo(detailsView.snp.trailing).inset(16)
        }
        
        detailsButton.snp.makeConstraints { make in
            make.top.equalTo(detailsView.snp.bottomMargin).inset(52)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(52)
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
        
        detailsView.backgroundColor = .systemBackground
        detailsView.layer.cornerRadius = 12
        
        infoImageView.image = .info
        infoImageView.contentMode = .scaleAspectFit
        
        detailsLabel.textColor = .label
        detailsLabel.font = .systemFont(ofSize: 16, weight: .regular)
        
        caretImageView.image = .caret
        caretImageView.contentMode = .scaleAspectFit
        
        detailsButton.layer.cornerRadius = 12
        detailsButton.backgroundColor = .systemBlue
    }
    
}

//MARK: - Setup Text

private extension ViewController {
    
    func setupText() {
        clientLabel.text = "Aleksander Dmitrievich V."
        
        totalCostLabel.text = "100$"
        
        feeLabel.text = "No commission"
        
        transactionDateLabel.text = "Completed, 12 September 16:00"
        
        detailsLabel.text = "Operation details"
        
        detailsButton.setTitle("To Main", for: .normal)
    }
    
}

//MARK: - Setup Behavior

private extension ViewController {
    
    func setupBehavior() {
        
        containers.forEach({ view, model in
            
            let gesture = UITapGestureRecognizer(target: self, action:  #selector (viewGestureTest(sender:)))
            let gestureTwo = UITapGestureRecognizer(target: self, action: #selector(receiptGesture(sender:)))
            let gestureThree = UITapGestureRecognizer(target: self, action: #selector(paymentGesture(sender:)))
            
            if model.id == 1 {
                view.addGestureRecognizer(gesture)
            } else if model.id == 2 {
                view.addGestureRecognizer(gestureTwo)
            } else {
                view.addGestureRecognizer(gestureThree)
            }
        })
        
        
        detailsButton.addTarget(self, action: #selector(testTap(sender:)), for: .touchUpInside)
        
    }
    
    @objc
    func viewGestureTest(sender: UITapGestureRecognizer) {
        print("Open Receipt Tapped!")
        containers.forEach { view, model in
            if model.id == 1 {
                view.set(textColor: .blue)
                view.set(image: .s)
            }
        }
        //viewToChange.set(textColor: .blue)
    }
    
    @objc
    func receiptGesture(sender: UITapGestureRecognizer) {
        print("Create Sample Tapped!")
    }
    
    @objc
    func paymentGesture(sender: UITapGestureRecognizer) {
        print("Repeat Payment Tapped!")
    }
    
    @objc
    func testTap(sender: UIButton) {
        print("Test passed!")
        animateView(sender)
    }
    
    func animateView(_ viewToAnimate: UIView) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5) {
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }
        UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn) {
            viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    
    
}

#Preview(traits: .portrait, body: {
    ViewController()
})
