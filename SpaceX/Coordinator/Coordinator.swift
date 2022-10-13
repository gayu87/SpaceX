//
//  Coordinator.swift
//  SpaceX
//
//  Created by Gayatriben Patel on 10/11/22.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinator: [Coordinator] {get set}
    var navigationController: UINavigationController{ get set}
    
    func start()
}
