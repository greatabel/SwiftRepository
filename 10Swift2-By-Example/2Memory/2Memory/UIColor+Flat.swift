//
//  UIColor+Flat.swift
//  2Memory
//
//  Created by 万畅 on 15/8/15.
//  Copyright © 2015年 abelwan. All rights reserved.
//

import UIKit

extension UIColor{
    
    class func greenSea() -> UIColor {
        return UIColor.colorComponents(comoponents: (22, 160, 133))
    }
    
    class func emerald() -> UIColor {
        return UIColor.colorComponents(comoponents: (46, 204, 113))
    }
    
    class func sunflower() -> UIColor {
        return UIColor.colorComponents(comoponents: (241, 196, 15))
    }
    
    class func alizarin() -> UIColor {
        return UIColor.colorComponents(comoponents: (231, 76, 60))
    }
    
}

private extension UIColor{
    class func colorComponents(comoponents:(CGFloat, CGFloat, CGFloat) ) -> UIColor
    {
        return UIColor(red:comoponents.0/255, green: comoponents.1/255, blue: comoponents.2/255, alpha:1)
    }
    
}
