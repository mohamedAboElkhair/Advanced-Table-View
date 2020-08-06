//
//  CardCell.swift
//  TableAdvi
//
//  Created by Mohamed AbouElkhair on 7/16/20.
//  Copyright © 2020 Mohamed AbouElkhair. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {
    
    var cellData:CellData!{
        didSet{
       //    textLabel?.text = cellData.titel
       //   imageView?.image = cellData.feathureImage
            
            feathureImage.image = cellData.feathureImage
            tileLabel.text = cellData.titel.uppercased()
        }
    }
    
    fileprivate var feathureImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 2
        
        return iv
    }()
    
    fileprivate var tileLabel : UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
    return label
        
    }()
    fileprivate var infoText : UITextView = {
       let infoText = UITextView()
        infoText.font = UIFont.systemFont(ofSize: 15, weight: .light)
        infoText.textColor = .black
        infoText.isEditable = false
        infoText.translatesAutoresizingMaskIntoConstraints = false
        infoText.text = "ItalkWithComputer.com"
        infoText.backgroundColor = .clear
        return infoText
    }()
    fileprivate var imageHeightClosed: NSLayoutConstraint!
      fileprivate var imageHeightOpen: NSLayoutConstraint!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        backgroundColor = .clear
        setupConstraints()
    }
    fileprivate func setupConstraints (){
    contentView.addSubview(feathureImage)
    contentView.addSubview(tileLabel)
    contentView.addSubview(infoText)
 feathureImage.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8).isActive = true
 feathureImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
 feathureImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -8).isActive = true
 
 imageHeightOpen = feathureImage.heightAnchor.constraint(equalToConstant:240 )
 imageHeightClosed = feathureImage.heightAnchor.constraint(equalToConstant: 20)
        
 tileLabel.topAnchor.constraint(equalTo: feathureImage.bottomAnchor,constant: 3).isActive = true
 tileLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
 tileLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -8).isActive = true
        
infoText.topAnchor.constraint(equalTo: tileLabel.bottomAnchor, constant: -4).isActive = true
infoText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
infoText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -8).isActive = true
infoText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -8).isActive = true

    }
    func ainmte(){
     
        self.imageHeightOpen.isActive = false
        self.imageHeightClosed.isActive = true
        
     
       
            
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1){
            self.imageHeightClosed.isActive = false
                         self.imageHeightOpen.isActive = true
            UIView.animate(withDuration: 0.3, delay: 0.15, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            
            self.contentView.layoutIfNeeded()
        }, completion: nil)
    }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30))

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
