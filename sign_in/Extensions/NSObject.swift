//
//  NSObject.swift
//  sign_in
//
//  Created by Student on 3/9/22.
//

import Foundation
import UIKit

extension NSObject{
    var screenHeight: CGFloat{
    return UIScreen.main.bounds.height
    }
    
    var screenWidth: CGFloat{
    return UIScreen.main.bounds.width
    }
    
    func ComputedHeight(_ heigth: CGFloat) -> CGFloat{ // nijniy probel pri vyzove funkcii pokajet slovo "Height"
        return screenHeight * heigth / 812
    }
    
    func ComputedWidth(_ width: CGFloat) -> CGFloat{ // nijniy probel pri vyzove funkcii pokajet slovo "Height"
        return screenWidth * width / 375
    }
}
