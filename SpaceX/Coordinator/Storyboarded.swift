//
//  Storyboarded.swift
//  SpaceX
//
//  Created by Gayatriben Patel on 10/11/22.
//

import Foundation
import UIKit

protocol Storyboarded  {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate() -> Self {
        
        let className = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
