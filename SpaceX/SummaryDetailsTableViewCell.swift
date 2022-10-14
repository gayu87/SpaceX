//
//  SummaryDetailsTableViewCell.swift
//  SpaceX
//
//  Created by Gayatriben Patel on 10/11/22.
//

import UIKit

class SummaryDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var missionNameLabel: UILabel!
    @IBOutlet weak var rocketNameLabel: UILabel!
    @IBOutlet weak var launchSiteNameLabel: UILabel!
    @IBOutlet weak var dateOfLaunchLabel: UILabel!
    @IBOutlet weak var launchPatchImage: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Set background color
        let view = UIView()
        view.backgroundColor = UIColor.systemBlue
        selectedBackgroundView = view
    }
    
    func setupdataCell(launchData : launch){
        guard let missionName = launchData.missioName, let rocketName = launchData.rocket.rocketName, let siteName = launchData.launchSite.siteName, let dateString = launchData.launchDateLocal else { return}
        missionNameLabel.text =  "Mission: " + missionName
        rocketNameLabel.text = "Rocket: " + rocketName
        launchSiteNameLabel.text = "Site: " + siteName
        dateOfLaunchLabel.text = "Date: " + dateFormattedString(string: dateString)
        getImageData(string: launchData.links.missionPatchSmall ?? "", imageToView: launchPatchImage)
    }
}
