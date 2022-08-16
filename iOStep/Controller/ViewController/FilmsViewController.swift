//
//  FilmsViewController.swift
//  iOStep
//
//  Created by shikhar on 14/08/22.
//

import UIKit

class FilmsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        fetchData()
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
                        self.collectionView.reloadData()
                    }
                }
               print(self.Films)
        }
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Films.count
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilmCollectionViewCell", for: indexPath) as! FilmCollectionViewCell
        cell.filmImage.image = UIImage(named: "swimage")
        cell.filmLabel.text = Films[indexPath.row].title
        cell.dateLabel.text = "Date: " + Films[indexPath.row].release_date
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width:188 ,height:235)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "singleFilmViewController") as! singleFilmViewController
        vc.component(f: Films[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
