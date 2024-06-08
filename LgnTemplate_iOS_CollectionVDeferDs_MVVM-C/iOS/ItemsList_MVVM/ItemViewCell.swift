//
//  ItemView.swift
//  iOS
//
//  Created by Oleh Poremskyy on 03.06.2024.
//

import UIKit

extension UIView {
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
}

class ItemViewCell: UICollectionViewCell  {

    var item: ItemDataModel? {
        didSet {
            nameLbl.text = item?.name
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupCardCellShadow()
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var nameLbl: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "Contact Name", size: 22)
        lbl.textColor = UIColor.init(white: 0.3, alpha: 0.4)
        return lbl
    }()
    
    
    lazy var itemImage: UIImageView = {
        let profileImg = UIImage(systemName: "person.crop.circle")
        let renderedImg = profileImg!.withTintColor(.gray, renderingMode: .alwaysOriginal)
        let imv = UIImageView(image: renderedImg )
        imv.translatesAutoresizingMaskIntoConstraints = false
        return imv
    }()
    
    private func setupCell() {
    
        self.backgroundView?.addSubview(itemImage)
        self.backgroundView?.addSubview(nameLbl)

        NSLayoutConstraint.activate([
            itemImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            itemImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            itemImage.widthAnchor.constraint(equalToConstant: 50),
            itemImage.heightAnchor.constraint(equalToConstant: 50),

            nameLbl.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLbl.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 16),
            nameLbl.widthAnchor.constraint(equalToConstant: 150),
            nameLbl.heightAnchor.constraint(equalToConstant: 50),

        ])
        
    }
    
    override var isHighlighted: Bool {
        
        didSet{
            
            var transform = CGAffineTransform.identity
            if isHighlighted {
               transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            }
            
            UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.4, options: .curveEaseOut, animations: {
                self.transform = transform
            })
        }
    }
    
    func setupCardCellShadow() {
         backgroundView = UIView()
         addSubview(backgroundView!)
         backgroundView?.fillSuperview()
         backgroundView?.backgroundColor     = .white
         backgroundView?.layer.cornerRadius  = 26
         backgroundView?.layer.shadowOpacity = 0.1
         backgroundView?.layer.shadowOffset  = .init(width: 4, height: 10)
         backgroundView?.layer.shadowRadius  = 10

         layer.borderColor  = UIColor.gray.cgColor
         layer.borderWidth  = 0.2
         layer.cornerRadius = 26
         self.layoutIfNeeded()
     }
    
}
