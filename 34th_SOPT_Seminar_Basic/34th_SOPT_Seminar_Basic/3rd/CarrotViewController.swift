//
//  CarrotViewController.swift
//  34th_SOPT_Seminar_Basic
//
//  Created by 박민서 on 4/20/24.
//

import UIKit
import SnapKit

final class CarrotViewController: UIViewController {
    
    final let carrotLineSpacing: CGFloat = 10
    final let carrotInterItemSpacing: CGFloat = 21
    final let cellHeight: CGFloat = 198
    final let carrotInset = UIEdgeInsets(top: 48, left: 20, bottom: 10, right: 20)
    
    var itemData = ItemModel.dummy()
    
    private func calculateCellHeight() -> CGFloat {
//        let count = CGFloat(itemData.count)
        let count = CGFloat(10)
        let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 2)
        return heightCount * cellHeight + (heightCount - 1) * carrotLineSpacing + carrotInset.top + carrotInset.bottom
    }

    private lazy var carrotCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - carrotInset.left - carrotInset.right - carrotInterItemSpacing
                flowLayout.itemSize = CGSize(width: doubleCellWidth / 2, height: 198)
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: doubleCellWidth / 2, height: 198)
        
        flowLayout.minimumLineSpacing = carrotLineSpacing
        flowLayout.minimumInteritemSpacing = carrotInterItemSpacing
        
        flowLayout.sectionInset = .init(top: 48, left: 20, bottom: 48, right: 20)
        
        return UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(carrotCollectionView)
        
        carrotCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        register()
        setDelegate()
    }
    
    
    private func register() {
        carrotCollectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
    }
    
    private func setDelegate() {
        carrotCollectionView.delegate = self
        carrotCollectionView.dataSource = self
    }
}

extension CarrotViewController: UICollectionViewDelegate {
    
}

extension CarrotViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell() }
        cell.delegate = self
        cell.dataBind(itemData[indexPath.item], itemRow: indexPath.item)
        return cell
    }
}

extension CarrotViewController: ItemCollectoinViewCellDelegate {
    func heartButtonDidTapEvent(state: Bool, row: Int) {
            itemData[row].heartIsSelected = state
    }
}

//extension CarrotViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//          let screenWidth = UIScreen.main.bounds.width
//                  let doubleCellWidth = screenWidth - carrotInset.left - carrotInset.right - carrotInterItemSpacing
//                  return CGSize(width: doubleCellWidth / 2, height: 198)
//      }
//      
//      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//          return carrotLineSpacing
//      }
//      
//      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//          return carrotInterItemSpacing
//      }
//      
//      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//          return carrotInset
//      }
//}
