//
//  Model.swift
//  iOStep
//
//  Created by shikhar on 14/08/22.
//

import UIKit

struct people:Codable{
    let name : String
    let height : String
    let mass: String
    let hair_color:String
    let skin_color:String
    let eye_color:String
    let birth_year:String
    let gender:String
    let homeworld:String
    let films:[String]
    let species: [String]
    let vehicles: [String]
    let starships: [String]
    let created: String
    let edited: String
    let url:String
}

struct getPeople:Codable{
    let count: Int
    let next: String?
    let previous: String?
    let results:[people]
}


struct films:Codable{
    let title: String
    let episode_id: Int
    let opening_crawl: String
    let director: String
    let producer: String
    let release_date: String
    let characters: [String]
    let planets: [String]
    let starships: [String]
    let vehicles: [String]
    let species: [String]
    let created: String
    let edited: String
    let url: String
}

struct getFilms:Codable{
    let count: Int
    let next: String?
    let previous: String?
    let results:[films]
}


struct planets:Codable{
    let name: String
    let rotation_period: String
    let orbital_period: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surface_water: String
    let population: String
    let residents: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
}

struct getPlanets:Codable{
    let count: Int
    let next: String?
    let previous: String?
    let results:[planets]
}

struct peopleHandle:Codable{
    let count:Int
    let next:String?
    let previous:String?
    let results:[people]
}





