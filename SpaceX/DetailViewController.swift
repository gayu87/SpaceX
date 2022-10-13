//
//  DetailsViewController.swift
//  SpaceX
//
//  Created by Gayatriben Patel on 10/11/22.
//

import UIKit

class DetailsViewController: UIViewController, Storyboarded{
    
    
    var missionDetails: String?
    var missionPatch : String?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        // Do any additional setup after loading the view.
    }
    
    func setup(){
        self.navigationItem.title = "Launch Detail"
        navigationItem.backButtonTitle = ""
        getImageData(string:  missionPatch ?? "", imageToView: imageView)
        detailLabel.text = missionDetails
    }
}
