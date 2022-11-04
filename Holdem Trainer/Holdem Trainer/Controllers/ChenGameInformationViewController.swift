//
//  ChenGameInformationViewController.swift
//  Holdem Trainer
//
//  Created by Luke Smith  on 11/3/22.
//

import UIKit

class ChenGameInformationViewController: UIViewController {
    let chenGameInfo = ChenGameInfoText()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
        edgesForExtendedLayout = []
    }
    
  
    private func createHeaderView(info: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = info
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }
    
    private func createParagraphView(info: String) -> UITextView {
        let paragraph = UITextView()
        paragraph.translatesAutoresizingMaskIntoConstraints = false
        paragraph.text = info
        paragraph.font = UIFont.systemFont(ofSize: 18)
        paragraph.textAlignment = .left
        paragraph.isScrollEnabled = false
        paragraph.isEditable = false
        paragraph.backgroundColor = globalBackgroundColor
        return paragraph
    }
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    private func setupViews() {
        scrollView.backgroundColor = globalBackgroundColor
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        var headerArray = chenGameInfo.returnHeaderArray()
        var paragraphArray = chenGameInfo.returnParagraphArray()
        while(!(headerArray.isEmpty && paragraphArray.isEmpty)) {
            if(!headerArray.isEmpty) {
                let info = headerArray.removeFirst()
                let headerView = createHeaderView(info: info)
                stackView.addArrangedSubview(headerView)
            }
            if(!paragraphArray.isEmpty) {
                let info = paragraphArray.removeFirst()
                let paragraphView = createParagraphView(info: info)
                stackView.addArrangedSubview(paragraphView)
            }
        
        }
    }
    
    private func setupLayout() {
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
}
