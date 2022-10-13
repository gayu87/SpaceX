//
//  MainCoordinator.swift
//  SpaceX
//
//  Created by Gayatriben Patel on 10/11/22.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let vc = ListViewController.instantiate()
        vc.mainCoordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func navigateToDetailsViewController(missionDetails: String , missionPatch : String) {
        let vc = DetailsViewController.instantiate()
        vc.missionDetails = missionDetails
        vc.missionPatch = missionPatch
        navigationController.pushViewController(vc, animated: false)
    }
    
}
