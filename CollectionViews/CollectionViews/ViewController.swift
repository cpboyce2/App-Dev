//
//  ViewController.swift
//  CollectionViews
//
//  Created by Connor Boyce on 12/11/19.
//  Copyright © 2019 Connor Boyce. All rights reserved.
//

import UIKit

struct CustomData {
    var title: String
    var image: UIImage
}
class ViewController: UIViewController {

    let data: [CustomData] = [
                CustomData(title: "Image 1", image: #imageLiteral(resourceName: "2")),
                CustomData(title: "Image 2", image: #imageLiteral(resourceName: "5")),
                CustomData(title: "Image 3", image: #imageLiteral(resourceName: "4")),
                CustomData(title: "Image 4", image: #imageLiteral(resourceName: "6")),
                CustomData(title: "Image 5", image: #imageLiteral(resourceName: "7")),
                CustomData(title: "Image 6", image: #imageLiteral(resourceName: "3"))
    ]

    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "Cell")
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.5).isActive = true


    }


}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.height*0.9)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCell
        cell.data = self.data[indexPath.row]
        return cell
    }

}

class CustomCell: UICollectionViewCell{

    var data: CustomData? {
        didSet{
            guard let data = data else { return }
            bg.image = data.image
        }
    }

    fileprivate let bg: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 20
        return iv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
