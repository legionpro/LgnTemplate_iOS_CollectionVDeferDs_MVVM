//
//  ItemViewController.swift
//  iOS
//
//  Created by Oleh Poremskyy on 03.06.2024.
//

import UIKit

class ItemViewController: UIViewController {
    lazy var customView = ItemView(viewModel: viewModel)
    private let viewModel: ItemViewModel
    
    override func loadView() {
        view = customView
    }
    
    init(viewModel: ItemViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}



final class ItemView: UIView {
    private let viewModel: ItemViewModel
    
    init(viewModel: ItemViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
                backgroundColor = .white
                addSubview(label)
                setUpLabelConstrains()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = self.viewModel.item.name
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .gray
        return label
    }()



    private func setUpLabelConstrains() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        label.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        label.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        label.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
}
