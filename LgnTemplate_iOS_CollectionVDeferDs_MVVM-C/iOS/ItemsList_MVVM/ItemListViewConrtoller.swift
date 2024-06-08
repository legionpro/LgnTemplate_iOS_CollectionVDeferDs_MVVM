//
//  ViewController.swift
//  Assesment-iOS-OlehP
//
//  Created by Oleh Poremskyy on 03.06.2024.
//

import UIKit

fileprivate typealias ItemsDataSource  = UICollectionViewDiffableDataSource<ItemListViewConrtoller.Section, ItemDataModel>
fileprivate typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<ItemListViewConrtoller.Section, ItemDataModel>



class ItemListViewConrtoller: UIViewController {

    let cellId = "cellId"
    private var viewModel: ItemListViewModel
    private var dataSource: ItemsDataSource!
    private var collectionView: UICollectionView! = nil

    init(viewModel: ItemListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Diffable Data Source"

        //FIXME: just dummy daata for futher development
        viewModel.dummyItemsList

        configureHierarchy()
        configureDataSource()
    }

}



//MARK: - SetUp collectionView
extension ItemListViewConrtoller {
    
    
    private func createLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 16, bottom: 8, trailing: 16)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.25))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func configureHierarchy() {
         
         collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
         collectionView.delegate = self
         collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
         collectionView.backgroundColor = .systemBackground
         collectionView.register(ItemViewCell.self, forCellWithReuseIdentifier: cellId)
         view.addSubview(collectionView)
     }
    
    private func configureDataSource() {
        
        dataSource = ItemsDataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) -> ItemViewCell? in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellId, for: indexPath) as! ItemViewCell
            cell.item = item
            return cell
        })
        
        var snapshot = DataSourceSnapshot()
        snapshot.appendSections([Section.main])
        snapshot.appendItems(self.viewModel.itemsList)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
}

//MARK: - Collection View Delegates
extension ItemListViewConrtoller: UICollectionViewDelegate  {
    
    fileprivate enum Section {
        case main
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         collectionView.deselectItem(at: indexPath, animated: true)
         guard let item = dataSource.itemIdentifier(for: indexPath) else { return }
         
         let viewModel = ItemViewModel(model: ItemModel(item: item))
         
         let cellViewController = ItemViewController(viewModel: viewModel)
         self.navigationController?.pushViewController(cellViewController, animated: true)
     }
    
}
