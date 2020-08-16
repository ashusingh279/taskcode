//
//  SceneDelegate.swift
//  social x example
//
//  Created by admin on 15/08/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ExpanedTCell: UITableViewCell {
 @IBOutlet weak var CollectionView: UICollectionView!
         
    
    override func awakeFromNib() {
        super.awakeFromNib()
      CollectionView.delegate = self
      CollectionView.dataSource = self
        
      
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}

extension ExpanedTCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    
    
         let cell:ReviewsCollectionViewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ReviewsCollectionViewCell", for: indexPath) as! ReviewsCollectionViewCell
            return cell
       
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    let width = (collectionView.frame.size.width)/3.5 //some width
    let height = width * 1.5 //ratio
   return CGSize(width: width, height: height)
}
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
    }
}
