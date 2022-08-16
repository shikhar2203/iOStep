//
//  Handler.swift
//  iOStep
//
//  Created by shikhar on 14/08/22.
//

import UIKit


enum responseError{
    case dataUnavailable, processingFailed, success
}

class PeopleHandler:NSObject{
    static let sharedInstance = PeopleHandler()
    private var urlfr = Constants.peopleUrl
    var isPaging = false
    
      

    func getinfo(page:Int ,completion: @escaping ((getPeople,responseError) -> ())){
        let url = urlfr+"\(page)"
        
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            guard let data = data else {
                completion(getPeople(count: 0, next: "", previous: "", results: []),.dataUnavailable)
                return
            }

            do{
                let decoder = JSONDecoder()
                let APIResponse = try decoder.decode(getPeople.self, from: data)
                completion(APIResponse, .success)
                print(APIResponse.count)

            }catch{
                completion(getPeople(count: 0, next: "", previous: "", results: []),.processingFailed)
                print(error)
            }
            
        }
        task.resume()
    }
}

class FilmsHandler:NSObject{
    static let sharedInstance = FilmsHandler()
    
    private var url = Constants.filmsUrl

    func getinfo(completion: @escaping ((getFilms,responseError) -> ())){
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            guard let data = data else {
                completion(getFilms(count: 0, next: "", previous: "", results: []),.dataUnavailable)
                return
            }

            do{
                let decoder = JSONDecoder()
                let APIResponse = try decoder.decode(getFilms.self, from: data)
                completion(APIResponse,.success)
                print(APIResponse.count)

            }catch{
                completion(getFilms(count: 0, next: "", previous: "", results: []),.processingFailed)
                print(error)
            }
            
        }
        task.resume()
    }
}

class PlanetsHandler:NSObject{
    static let sharedInstance = PlanetsHandler()
    
    private var urlfr = Constants.planetsUrl

    func getinfo(page: Int, completion: @escaping ((getPlanets,responseError) -> ())){
        let url = urlfr+"\(page)"
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            guard let data = data else {
                completion(getPlanets(count: 0, next: "", previous: "", results: []),.dataUnavailable)
                return
            }

            do{
                let decoder = JSONDecoder()
                let APIResponse = try decoder.decode(getPlanets.self, from: data)
                completion(APIResponse,.success)
                print(APIResponse.count)

            }catch{
                completion(getPlanets(count: 0, next: "", previous: "", results: []),.processingFailed)
                print(error)
            }
            
        }
        task.resume()
    }
    
}

   /* class APIHandler:NSObject{
    static let sharedInstance = APIHandler()
    private var urlfr = Constants.peopleUrl
    var isPaging = false
    
    func getinfo(page:Int,completion: @escaping ((peopleHandle,responseError) -> ())){
        let url = urlfr+"\(page)"
        
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                completion(peopleHandle(count: 0, next: "", previous: "", results: []),.dataUnavailable)
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let APIResponse = try decoder.decode(peopleHandle.self, from: data)
                completion(APIResponse,.success)
                
            }catch{
                completion(peopleHandle(count: 0, next: "", previous: "", results: []),.processingFailed)
                print(error)
            }
            
        }
        task.resume()
    }
}*/


