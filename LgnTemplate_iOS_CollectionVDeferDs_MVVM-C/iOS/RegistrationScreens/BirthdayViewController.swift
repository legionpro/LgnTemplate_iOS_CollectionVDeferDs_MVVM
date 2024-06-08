//
//  BirthdayViewController.swift
//  iOS
//
//  Created by Oleh Poremskyy on 08.06.2024.
//

import UIKit


class BirthdayViewController: UIViewController, FlowControllerProtocol  {
    var completionHandler: ((Date?) -> ())?
    private var userData: UserData!
    
    private var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = " Enter birthday"
        return textField
    }()
    
    private let nextButton: UIButton = {
        let nextButton = UIButton(type: .system)
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget( self, action: #selector(didPressedNextButton), for: .touchUpInside)
        return nextButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
    }
    
    func setUp(userData: UserData) {
        self.userData = userData
    }
    
    func addSubViews() {
        title = "Birthdady"
        view.backgroundColor = .white
        let stackView = UIStackView(arrangedSubviews: [textField, nextButton])
        stackView.frame.size = CGSize(width: 200, height: 120)
        stackView.axis = .vertical
        stackView.center = view.center
        view.addSubview(stackView)
    }
    
    @objc
    func didPressedNextButton() {
        completionHandler?(Date())
    }
    
}
