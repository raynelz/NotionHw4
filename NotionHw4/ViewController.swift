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
    private let infoButton = UIButton()
    private let detailsLabel = UILabel()
    private let caretImageView = UIImageView()
    private let detailsButton = UIButton()
    
    
    private let items = [
        ContainerModel(id: 0, title: NSLocalizedString("Open receipt", comment: "receipt view label"), image: .receipt),
        ContainerModel(id: 1, title: NSLocalizedString("Create sample", comment: "create sample view label"), image: .favourite),
        ContainerModel(id: 2, title: NSLocalizedString("Repeat payment", comment: "repeat payment view label"), image: .repeat)
    ].sorted { $0.id < $1.id }
    
    var colors = [UIColor.label, UIColor.green, UIColor.blue]
    
    var debugMessages = ["Open receipt", "Create sample", "Repeat payment"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        embedViews()
        setupLayout()
        setupContainers()
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
            infoButton,
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
        
        infoButton.snp.makeConstraints { make in
            make.top.equalTo(detailsView.snp.topMargin).offset(20)
            make.leading.equalTo(detailsView.snp.leading).offset(16)
        }
        
        detailsLabel.snp.makeConstraints { make in
            make.top.equalTo(detailsView.snp.topMargin).offset(28)
            make.leading.equalTo(infoButton.snp.trailing).offset(12)
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
        
        items.forEach { model in
            let view = ContainerView()
            view.configure(model: model)
            
            view.didSelectView = { [weak self] in
                guard let self else { return }
                view.set(textColor: colors[model.id])
                print(debugMessages[model.id])
            }
            
            containersStackView.addArrangedSubview(view)
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
        
        infoButton.setImage(.info, for: .normal)
        infoButton.contentMode = .scaleAspectFit
        
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
        clientLabel.text = NSLocalizedString("Aleksander Dmitrievich V.", comment: "client full name")
        
        totalCostLabel.text = NSLocalizedString("100$", comment: "totalCost label")
        
        feeLabel.text = NSLocalizedString("No commission", comment: "fee label")
        
        transactionDateLabel.text = NSLocalizedString("Completed, 12 September 16:00", comment: "transaction status with date")
        
        detailsLabel.text = NSLocalizedString("Operation details", comment: "details label")
        
        detailsButton.setTitle(NSLocalizedString("To Main", comment: "button title"), for: .normal)
    }
    
}

//MARK: - Setup Behavior

private extension ViewController {
    
    func setupBehavior() {
        
        infoButton.addTarget(self, action: #selector(iconTap(sender:)), for: .touchUpInside)
        
        detailsButton.addTarget(self, action: #selector(testTap(sender:)), for: .touchUpInside)
    }
    
    @objc
    func iconTap(sender: UIButton) {
        let alertController = UIAlertController(title: NSLocalizedString("Congratulations! 🎉", comment: "Alert title"), message: NSLocalizedString("The alert is now working correct!", comment: "Alert message"), preferredStyle: .alert)
        
        let closeAction = UIAlertAction(title: NSLocalizedString("Close Alert", comment: "Action Alert button"), style: .default) { _ in
            self.dismiss(animated: true)
        }
        alertController.addAction(closeAction)
        present(alertController, animated: true)
        animateView(sender)
    }
    
    @objc
    func testTap(sender: UIButton) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
        detailsButton.backgroundColor = .systemRed
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
