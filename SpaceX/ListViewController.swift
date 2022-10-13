//
//  ViewController.swift
//  SpaceX
//
//  Created by Gayatriben Patel on 10/11/22.
//

import UIKit



class ListViewController: UIViewController, Storyboarded {
    
    var mainCoordinator: MainCoordinator?
    let APIManager = API_Manager()
    var vSpinner: UIView?
    var launches = [launch]()
    var array = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    func setup(){
        self.navigationItem.title = "Launch list "
        registerForCell(tableView: tableView)
        showSpinner(onView: view)
        
        APIManager.getData(completionHandler: { [weak self] info in
            
            switch info {
            case .success(let data):
                DispatchQueue.main.async{
                    self?.launches = data
                    if self?.launches.count == 0{
                        self?.showAlert(title: "Alert", message: "No data found")
                    }else{
                        self?.tableView.reloadData()
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.showAlert(title: "Alert", message: error.rawValue)
                }
            }
            self?.hideSpinner()
        } )
    }
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: {_ in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // Mark: - Spinner
    func showSpinner(onView: UIView){
        let spinnerView = UIView.init(frame: UIScreen.main.bounds)
        spinnerView.backgroundColor = UIColor.white
        let centerX = UIScreen.main.bounds.width/2
        let centerY = UIScreen.main.bounds.height/2
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.startAnimating()
        ai.center = CGPoint(x: centerX, y: centerY)
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            self.navigationController?.view.addSubview(spinnerView)
        }
        vSpinner = spinnerView
    }
    
    func hideSpinner(){
        DispatchQueue.main.async {
            self.vSpinner?.removeFromSuperview()
            self.vSpinner = nil
        }
    }
    func registerForCell(tableView: UITableView){
        let cell = UINib.init(nibName: "SummaryDetailsTableViewCell", bundle: Bundle.main)
        tableView.register(cell, forCellReuseIdentifier: "SummaryDetailsTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        
    }
}

extension ListViewController : UITableViewDelegate ,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryDetailsTableViewCell") as? SummaryDetailsTableViewCell else {return UITableViewCell()}
        cell.accessoryType = .disclosureIndicator
        cell.setupdataCell(launchData: launches[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mainCoordinator?.navigateToDetailsViewController(missionDetails: launches[indexPath.row].details ?? "", missionPatch: launches[indexPath.row].links.missionPatch ?? "")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) ->CGFloat {
        return UITableView.automaticDimension
        
    }
    
    
}

