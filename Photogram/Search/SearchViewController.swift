//
//  SearchViewController.swift
//  Photogram
//
//  Created by 서동운 on 8/28/23.
//

import UIKit
import Kingfisher

class SearchViewController: BaseViewController {
    
    let mainView = SearchView()
    lazy var cancelBarButton = UIBarButtonItem(title: "돌아가기", style: .done, target: self, action: #selector(cancel))
    
    var delegate: (any ImageReceivable)?
    
    private var imageList: [UIImage?] = [] {
        didSet {
            DispatchQueue.main.async { [mainView] in
                mainView.collectionView.reloadData()
            }
        }
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        print("search")
        print(self)
    }
    
    @objc func cancel() {
        dismiss(animated: true)
    }
    
    override func configureViews() {
        super.configureViews()
        
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        mainView.searchBar.delegate = self
        
        navigationItem.leftBarButtonItem = cancelBarButton
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let text = searchBar.text else { return }
        
        DispatchQueue.global().async {
            APIManager.shared.fetchImage(searchText: text) { data in
                do {
                    let response = try JSONDecoder().decode(Response.self, from: data)
                    let regularSizeImages = try response.results.map {
                        let data = try Data(contentsOf: URL(string:  $0.urls.small)!)
                        return UIImage(data: data)
                    }
                    
                    self.imageList = regularSizeImages
                } catch {
                    print(error)
                }
                
            } onFailure: { error in
                print(error)
            }
        }
    }
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
        cell.imageView.image = imageList[indexPath.item]
        return cell
    }
}

extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.receive(imageList[indexPath.item])
    }
}
