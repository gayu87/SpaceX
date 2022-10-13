//
//  Utility.swift
//  SpaceX
//
//  Created by Gayatriben Patel on 10/11/22.
//

import Foundation
import UIKit


let inDateFormatter = ISO8601DateFormatter()

let outDateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/yyyy"
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    return dateFormatter
}()


func dateFormattedString(string: String)-> String{
    if let date = inDateFormatter.date(from: string){
        let formattedString = outDateFormatter.string(from: date)
        return formattedString
    }else {
        return ""
    }
}

func getImageData(string: String, imageToView: UIImageView){
    guard let url = URL(string: string) else { return }
    let data = try? Data(contentsOf: url)
    if let imageData = data {
        let image = UIImage(data: imageData)
        imageToView.image = image
    }
    else {
        let imageName = "Detail.png"
        let image = UIImage(named: imageName)
        imageToView.image = image
    }
}
