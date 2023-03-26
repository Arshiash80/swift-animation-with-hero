//
//  ViewController.swift
//  AnimationWithHero
//
//  Created by Arshia Shahidi on 14.03.2023.
//

import UIKit
import TinyConstraints
import Hero
class ViewController: UIViewController {

    struct Constant  {
        static let MINIMUM_LINE_SPACING: CGFloat = 5
        
    }
    
    
    let collectionV: UICollectionView = {
        // Collection View Layout
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        // Collecton View
        let colv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        colv.translatesAutoresizingMaskIntoConstraints = false
        colv.showsHorizontalScrollIndicator = false
        colv.isPagingEnabled = false
        colv.isScrollEnabled = true
        colv.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "customCell")
        
        colv.backgroundColor = .darkGray
        
        return colv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.addSubview(self.collectionV)
        self.collectionV.edgesToSuperview(usingSafeArea: true)
        
        collectionV.delegate = self
        collectionV.dataSource = self

        
    }

}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (collectionView.frame.width / 2) - ViewController.Constant.MINIMUM_LINE_SPACING
        return CGSize(width: itemWidth, height: itemWidth)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCollectionViewCell
        
        cell.imageView.hero.id = "cellImage-\(indexPath.row)"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell else {
            return
           }
        let vc = DetailViewController()
        vc.imagev.hero.id = cell.imageView.hero.id
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
}
