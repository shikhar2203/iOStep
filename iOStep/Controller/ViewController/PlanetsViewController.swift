//
//  PeopleViewController.swift
//  iOStep
//
//  Created by shikhar on 14/08/22.
//

import UIKit

class PlanetsViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      while Next{
            fetchData()
        }
        PlanetsView.delegate = self
        PlanetsView.dataSource = self
        
    }
    @IBOutlet weak var PlanetsView: UITableView!
    
    var APIManage = PlanetsHandler()
    var APITry = PlanetsHandler.sharedInstance
    var plans : [planets] = []
    var page :Int = 1
    var isfetching : Bool = false
    var Next:Bool = true
    
    func fetchData(){
        if isfetching{
            return
        }
        
        self.isfetching = true
        self.page += 1
        APITry.getinfo(page:page){ planetGet, error in
            switch error {
            case .dataUnavailable:
                print("data unavilable")
            case .processingFailed:
                print("processing failed")
                self.Next = false
            case .success:
                self.plans.append(contentsOf: planetGet.results)
                DispatchQueue.main.async {
                    self.PlanetsView.reloadData()
                }
            }
            print(self.plans)
            self.isfetching = false
        }
        
        
        
    }
    
}
    

    extension PlanetsViewController: UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return plans.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = PlanetsView.dequeueReusableCell(withIdentifier: "PlanetViewCell", for: indexPath) as! PlanetTableViewCell
            cell.PlanetName.text = "\(indexPath.row+1)  \(plans[indexPath.row].name)"
            return cell
            
        }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "Planets"
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 106
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //getPlanet(url: peopleArray[indexPath.row].homeworld, index : indexPath.row)
        }
        
    }
    





