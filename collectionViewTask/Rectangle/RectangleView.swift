//
//  RectangleView.swift
//  collectionViewTask
//
//  Created by swamnx on 27.06.21.
//

import Foundation
import UIKit

class RectangleView: UIView {
    
    var rectangleParams: RectangleParams?
    
    override func draw(_ rect: CGRect) {
        guard let rectangleParamsUnwrapped = rectangleParams else { return }
        guard let context: CGContext = UIGraphicsGetCurrentContext() else { return }
        context.setStrokeColor(rectangleParamsUnwrapped.color.cgColor)
        context.setFillColor(rectangleParamsUnwrapped.color.cgColor)
        let rectWidth = rectangleParamsUnwrapped.width * rect.size.width
        let rectHeight = rectangleParamsUnwrapped.height * rect.size.height
        context.fill(CGRect.init(x: 0, y: 0, width: rectWidth, height: rectHeight))
    }
    
    func updateParams(params: RectangleParams) {
        rectangleParams = params
        setNeedsDisplay()
    }

}
