//
//  LNCathc.swift
//  demo
//
//  Created by lhs7248 on 16/12/30.
//  Copyright © 2016年 lhs7248. All rights reserved.
//

import Foundation
import UIKit



extension UIImage{
    
    
    
//    var rect : CGRect = CGRectMake(0, 0, 1, 1)
//    UIGraphicsBeginImageContext(rect.size)
//    var context : CGContextRef = UIGraphicsGetCurrentContext()
//    
//    CGContextSetFillColorWithColor(context, self.CGColor)
//    CGContextFillRect(context, rect)
//    
//    var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
//    UIGraphicsEndImageContext()
//    return image
//    
    class  func imageWithColor(color:UIColor,size:CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
        
    }
    
}
