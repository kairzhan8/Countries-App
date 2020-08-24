//
//  Extension + MainCollectionVC.swift
//  Countries App
//
//  Created by Kairzhan Kural on 8/19/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//
import UIKit

extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 30)
    }
}
