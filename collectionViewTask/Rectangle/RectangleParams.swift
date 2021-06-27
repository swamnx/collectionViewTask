//
//  RectangleParams.swift
//  collectionViewTask
//
//  Created by swamnx on 27.06.21.
//

import Foundation
import UIKit

struct RectangleParams {
    
    var width: CGFloat
    var height: CGFloat
    var color: UIColor
    
    init (width: CGFloat, height: CGFloat, color: UIColor) {
        self.width = width
        self.height = height
        self.color = color
    }
    
    mutating func randomizeColor() {
        color = RectangleParams.getRandomColor()
    }
    
    static func getRandomColor() -> UIColor {
        return UIColor.init(red: CGFloat(Int.random(in: 1...255))/255,
                           green: CGFloat(Int.random(in: 1...255))/255,
                           blue: CGFloat(Int.random(in: 1...255))/255,
                           alpha: 1.0
        )
    }
    
    static func getRandomSize() -> CGFloat {
        return CGFloat(Int.random(in: 3...20))/20
    }
    
}
