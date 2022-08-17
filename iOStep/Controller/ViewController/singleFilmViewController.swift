//
//  singleFilmViewController.swift
//  iOStep
//
//  Created by Bhavya Jain on 15/08/22.
//

import UIKit

class singleFilmViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Films.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = starshipCollectionView.dequeueReusableCell(withReuseIdentifier: "starshipCollectionViewCell", for: indexPath) as! starshipCollectionViewCell
        cell.starshipImage.image = UIImage(named: "starship")
        
        return cell
    }

    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    
    @IBOutlet weak var starshipCollectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        starshipCollectionView.delegate = self
        starshipCollectionView.dataSource = self
        fetchData()
        
        let value = Int(episodeLabel.text!) ?? 0
        image.image = UIImage(named: txt)
        label.text = Film.title
        episodeLabel.text = "Episode Id: "+"\(value)"
        dateLabel.text = "Aired on:"
        dLabel.text = Film.release_date
        }
    var txt = "swimage"
    var Film = films(title: "", episode_id: 0, opening_crawl: "", director: "", producer: "", release_date: "", characters: [], planets: [], starships: [], vehicles: [], species: [], created: "", edited: "", url: "")
    func component(f:films){
        self.Film = f
    }
    
    
    var filmManager = FilmsHandler()
    var filmsTry = FilmsHandler.sharedInstance
    var Films : [films] = []
        
        
    func fetchData(){
        filmsTry.getinfo { filmGet, response in
            switch response {
                case .dataUnavailable:
                    print("data unavilable")
                case .processingFailed:
                    print("Processing failed")
                case .success:
                    self.Films = filmGet.results
                    DispatchQueue.main.async {
                        self.starshipCollectionView.reloadData()
                    }
                }
               print(self.Films)
        }
    }
    
  

}
