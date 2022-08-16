//
//  PeopleViewController.swift
//  iOStep
//
//  Created by shikhar on 14/08/22.
//

import UIKit

class PeopleViewController: UIViewController {

    @IBOutlet weak var PeopleView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        while Next{
            fetchData()
        }
        
        PeopleView.delegate = self
        PeopleView.dataSource = self
    }
    
    var APIManage = PeopleHandler()
    var APITry = PeopleHandler.sharedInstance
    var peps : [people] = []
    var page :Int = 1
    var isfetching : Bool = false
    var Next:Bool = true
  
    
    func fetchData(){
        if isfetching{
            return
        }
        
        self.isfetching = true
        self.page += 1
        APITry.getinfo(page:page){ peopleGet, error in
            switch error {
            case .dataUnavailable:
                print("data unavilable")
                self.Next = false
            case .processingFailed:
                print("processing failed")
                self.Next = false
            case .success:
                self.peps.append(contentsOf: peopleGet.results)
            }
            DispatchQueue.main.async {
                self.PeopleView.reloadData()
            }
            print(self.peps)
            self.isfetching = false
        }
        
    }
        
    }
    
    

    extension PeopleViewController: UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return peps.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = PeopleView.dequeueReusableCell(withIdentifier: "PeopleTableViewCell", for: indexPath) as! PeopleTableViewCell
            cell.Title.text = "\(indexPath.row+1)  \(peps[indexPath.row].name)"
            return cell
        }
        

        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "People"
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 106
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //getPlanet(url: peopleArray[indexPath.row].homeworld, index : indexPath.row)
        }
        
    }

    




