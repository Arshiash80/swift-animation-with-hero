//
//  CollectionViewCell.swift
//  AnimationWithHero
//
//  Created by Arshia Shahidi on 14.03.2023.
//

import UIKit
import TinyConstraints

class CustomCollectionViewCell: UICollectionViewCell {
    
    let bgView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .lightGray
        return v
    }()
    
    let imageView: UIImageView = {
        let imgv = UIImageView()
        imgv.translatesAutoresizingMaskIntoConstraints = false
        imgv.image = UIImage(named: "cellImage")!
        return imgv
    }()
    
    let cellDesc: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Custom Cell Label"
        label.textAlignment = .center
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(self.bgView)
        self.bgView.addSubview(self.imageView)
        self.bgView.addSubview(self.cellDesc)
        
        self.bgView.edgesToSuperview()
        self.imageView.edgesToSuperview(excluding: .bottom)
        self.cellDesc.edgesToSuperview(excluding: .top)
        self.cellDesc.topToBottom(of: imageView)
        self.cellDesc.height(CGFloat(30))
        self.bgView.layoutSubviews()
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
