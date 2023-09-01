//
//  SearchView.swift
//  Photogram
//
//  Created by 서동운 on 8/28/23.
//

import UIKit

class SearchView: BaseView {
    
    let searchBar = {
        let bar = UISearchBar()
        bar.placeholder = "검색어를 입력해주세요."
        bar.autocorrectionType = .no
        bar.autocapitalizationType = .none
        return bar
    }()
    
    
    lazy var collectionView = {
      
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout())
        view.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        return view
    }()
    
    func flowLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 10
        let deviceWidth = UIScreen.main.bounds.width
        let itemSize = (deviceWidth - (spacing * 4)) / 3
        
        flowLayout.itemSize = CGSize(width: itemSize, height: itemSize)
        flowLayout.minimumLineSpacing = spacing
        flowLayout.minimumInteritemSpacing = spacing
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
        
        return flowLayout
    }
    
    override func configureViews() {
        super.configureViews()
        
        addSubview(searchBar)
        addSubview(collectionView)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        searchBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self.safeAreaLayoutGuide)
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(searchBar.snp.bottom)
        }
    }
}
