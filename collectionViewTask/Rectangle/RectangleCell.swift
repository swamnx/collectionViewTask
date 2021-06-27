//
//  RectangleCell.swift
//  collectionViewTask
//
//  Created by swamnx on 27.06.21.
//

import Foundation
import UIKit

class RectangleCell: UICollectionViewCell {
    
    var rectangleView: RectangleView?
    
    override init(frame: CGRect) {
        rectangleView = RectangleView.init(frame: frame)
        super.init(frame: .zero)
        contentView.addSubview(rectangleView!)
    }
    
    required init?(coder: NSCoder) {
        rectangleView = RectangleView.init(coder: coder)
        super.init(coder: coder)
        contentView.addSubview(rectangleView!)
    }
    
    func updateParams(params: RectangleParams) {
        rectangleView?.updateParams(params: params)
    }
    
}
