//
//  ViewController.swift
//  collectionViewTask
//
//  Created by swamnx on 27.06.21.
//

import UIKit

class CustomCollectionViewController: UIViewController {
    
    var rectangles = [RectangleParams]()
    
    @IBOutlet weak var rectanglesView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rectanglesView.delegate = self
        rectanglesView.dataSource = self
    }
    
}

//
// MARK: Bar Actions
//
extension CustomCollectionViewController {
    
    @IBAction func addRectangleTapped(_ sender: UIBarButtonItem) {
        let rectangleParams = RectangleParams(width: RectangleParams.getRandomSize(),
                                             height: RectangleParams.getRandomSize(),
                                             color: RectangleParams.getRandomColor()
        )
        rectangles.append(rectangleParams)
        self.rectanglesView.reloadData()
    }
    
}

//
// MARK: Gesture Actions
//
extension CustomCollectionViewController {
    
    @IBAction func handleTap(_ sender: UITapGestureRecognizer) {
        if let indexPath = self.rectanglesView.indexPathForItem(at: sender.location(in: rectanglesView)) {
            rectangles[indexPath.row].randomizeColor()
            rectanglesView.reloadItems(at: [indexPath])
        }
    }
    
}

//
// MARK: Table view data source
//
extension CustomCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rectangles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RectangleCellID", for: indexPath) as? RectangleCell
        cell?.updateParams(params: rectangles[indexPath.row])
        return cell ?? RectangleCell()
    }

}

//
// MARK: Cell Size
//
extension CustomCollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.rectanglesView.frame.width * 1.0 / 3.0, height: self.rectanglesView.frame.height * 1.0 / 3.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0

    }
    
}
