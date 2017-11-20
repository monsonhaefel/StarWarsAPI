//
//  Models.swift
//  StarWarsAPI
//
//  Created by RICHARD MONSON-HAEFEL on 10/27/17.
//  Copyright © 2017 RICHARD MONSON-HAEFEL. All rights reserved.
//
//  Each of the model objects below map to JSON data on the StarWarsAPI as
//  returned by the StarWarsAPI REST methods.  Although all of the model objects
//  include the properties url, created, and edited these could not be put into
//  an inherited super class (e.g. Model) becuase the new JSON Codable API
//  does not support inherited properites. Only properties declared in the object
//  to which the encoding is done will be mapped to the JSON.
// swiftlint:disable identifier_name

import Foundation

public class Film: Codable {
    public var url: String?
    public var created: String?
    public var edited: String?

    public var title: String?
    public var episode_id: Int?
    public var producer: String?
    public var release_date: String?
    public var director: String?
    public var opening_crawl: String?

    public var characters: [String]?
    public var species: [String]?
    public var vehicles: [String]?
    public var planets: [String]?
    public var starships: [String]?
}

public class People: Codable {
    public var url: String?
    public var created: String?
    public var edited: String?

    public var name: String?
    public var height: String?
    public var mass: String?
    public var hair_color: String?
    public var skin_color: String?
    public var eye_color: String?
    public var birth_year: String?
    public var gender: String?
    public var homeworld: String?
    public var films: [String]?
    public var species: [String]?
    public var vehicles: [String]?
    public var starships: [String]?
}

public class Species: Codable {
    public var url: String?
    public var created: String?
    public var edited: String?

    public var name: String?
    public var classification: String?
    public var designation: String?
    public var average_height: String?
    public var skin_colors: String?
    public var hair_colors: String?
    public var eye_colors: String?
    public var average_lifespan: String?
    public var homeworld: String?
    public var language: String?
    public var people: [String]?
    public var films: [String]?
}

public class Planet: Codable {

    public var url: String?
    public var created: String?
    public var edited: String?

    public var name: String?
    public var rotation_period: String?
    public var orbital_period: String?
    public var diameter: String?
    public var climate: String?
    public var gravity: String?
    public var terrain: String?
    public var surface_water: String?
    public var population: String?
    public var residents: [String]?
    public var films: [String]?
}

public class Vehicle: Codable {

    public var url: String?
    public var created: String?
    public var edited: String?

    public var name: String?
    public var model: String?
    public var manufacturer: String?
    public var cost_in_credits: String?
    public var length: String?
    public var max_atmosphering_speed: String?
    public var crew: String?
    public var passengers: String?
    public var cargo_capacity: String?
    public var consumables: String?
    public var vehicle_class: String?
    public var pilots: [String]?
    public var films: [String]?
}

public class Starship: Codable {

    public var url: String?
    public var created: String?
    public var edited: String?

    public var name: String?
    public var model: String?
    public var manufacturer: String?
    public var cost_in_credits: String?
    public var length: String?
    public var max_atmosphering_speed: String?
    public var crew: String?
    public var passengers: String?
    public var cargo_capacity: String?
    public var consumables: String?
    public var starship_class: String?
    public var hyperdrive_rating: String?
    public var MGLT: String?
    public var pilots: [String]?
    public var films: [String]?
}
