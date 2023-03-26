//
//  DetailViewController.swift
//  AnimationWithHero
//
//  Created by Arshia Shahidi on 14.03.2023.
//

import UIKit
import TinyConstraints
import Hero

class DetailViewController: UIViewController {

    private let bgView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .darkGray
        return v
    }()
    
    let backBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("back", for: .normal)
        btn.titleLabel?.textColor = .red
        btn.setTitleColor(.red, for: .normal)
        btn.addTarget(self, action: #selector(backBtnPressed(_:)), for: .touchUpInside)
        return btn
    }()
    
    let imagev: UIImageView = {
        let imagev = UIImageView()
        imagev.translatesAutoresizingMaskIntoConstraints = false
        imagev.image = UIImage(named: "cellImage")
        return imagev
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hero.isEnabled = true

        self.view.backgroundColor = .white
        
        self.view.addSubview(self.bgView)
        self.bgView.edgesToSuperview(usingSafeArea: true)
                
        
        self.bgView.addSubview(self.imagev)
        
        self.imagev.edgesToSuperview(excluding: .bottom)
        self.imagev.height(500)
        
        
        
        self.bgView.addSubview(backBtn)
        backBtn.topToSuperview(offset: 10)
        backBtn.leftToSuperview(offset: 10)
        
    
    }
    
    @objc
    func backBtnPressed(_ btn: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
