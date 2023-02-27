//
//  FlowerCell.swift
//  FlowersShop
//
//  Created by Aleksey Libin on 23.02.2023.
//

import UIKit

class FlowerCell: UICollectionViewCell {
  
  let imageView = UIImageView()
  let nameLabel = UILabel()
  let price = 200
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  private func setupViews() {
    
    backgroundColor = .lightGray
    clipsToBounds = true
    layer.cornerRadius = 15
    
    imageView.image = UIImage(named: "Large bouquet of black callas")
    
    nameLabel.adjustsFontSizeToFitWidth = true
    nameLabel.text = "Bride's bouquet of black and burgundy callas (from CHF\(price.description)"
    nameLabel.numberOfLines = 2
    nameLabel.textAlignment = .center
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    
    addSubview(imageView)
    addSubview(nameLabel)
    
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: topAnchor),
      imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
      imageView.heightAnchor.constraint(equalTo: widthAnchor),
      
      nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
      nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
      nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
      nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
