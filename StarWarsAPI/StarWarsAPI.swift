//
//  StarWarsAPI.swift
//  StarWarsAPI
//
//  Created by RICHARD MONSON-HAEFEL on 10/26/17.
//  Copyright © 2017 RICHARD MONSON-HAEFEL. All rights reserved.
//

import Foundation

// MARK: - StarWarsAPI Manager

/**
 This class defines the API for making calls to the [StarWarsAPI](https://swapi.co/).
 As this is a test and not intended to be fully funtional the API is incomplete;
 defined only those methods needed to complete the test.
 */
public class StarWarsAPI {

    // MARK: - Singleton
    public static let shared: StarWarsAPI = StarWarsAPI()

    // MARK: - Service URL Properties
    var filmsUrl: URL
    var peopleUrl: URL
    var planetsUrl: URL
    var speciesUrl: URL
    var starshipsUrl: URL
    var vehiclesUrl: URL

    // MARK: - Initialization

    /**
    The `init()` method sets the proper URLs for each type of REST call.
    */
    init() {

        let rootUrlStringPath = "https://swapi.co/api/"

        let rootUrl = URL(string: rootUrlStringPath)!

        self.filmsUrl = (rootUrl.appendingPathComponent("films"))
        self.peopleUrl = (rootUrl.appendingPathComponent("people"))
        self.planetsUrl = (rootUrl.appendingPathComponent("planets"))
        self.speciesUrl = (rootUrl.appendingPathComponent("species"))
        self.starshipsUrl = (rootUrl.appendingPathComponent("starships"))
        self.vehiclesUrl = (rootUrl.appendingPathComponent("vehicles"))

    }

}

// MARK: - StarWarsAPI Extension
public extension StarWarsAPI { // API Calls

    // MARK: - API Methods
    /** This call maps to the StarWarsAPI Films REST call documented
    [here](https://swapi.co/documentation#films) at the swapi.co web site
    */
    public func films(completion: @escaping (_ films: [Film]?,
                                             _ error: StarWarsError?) -> Void) {
        restCall(fetchUrl: filmsUrl, modelType: FilmsResult()) { (filmResults, error ) in
            completion(filmResults?.results, error)
        }
    }

    /** This call maps to the StarWarsAPI People REST call documented
     [here](https://swapi.co/documentation#people) at the swapi.co web site
     */
    public func people(completion: @escaping (_ people: [People]?, _ error: StarWarsError?) -> Void) {

        restCall(fetchUrl: peopleUrl, modelType: PeopleResult()) { (peopleResults, error ) in
            completion(peopleResults?.results, error)
        }
    }

    /** This call maps to the StarWarsAPI Species REST call documented
     [here](https://swapi.co/documentation#species) at the swapi.co web site
     */
    public func species(completion: @escaping (_ species: [Species]?, _ error: StarWarsError?) -> Void) {

        restCall(fetchUrl: speciesUrl, modelType: SpeciesResult()) { (speciesResults, error ) in
            completion(speciesResults?.results, error)
        }
    }

    /** This call maps to the StarWarsAPI Planets REST call documented
     [here](https://swapi.co/documentation#planets) at the swapi.co web site
     */
    public func planets(completion: @escaping (_ planets: [Planet]?, _ error: StarWarsError?) -> Void) {

        restCall(fetchUrl: planetsUrl, modelType: PlanetsResult()) { (planetResults, error ) in
            completion(planetResults?.results, error)
        }
    }

    /** This call maps to the StarWarsAPI Vehicles REST call documented
     [here](https://swapi.co/documentation#vehicles) at the swapi.co web site
     */
    public func vehicles(completion: @escaping (_ vehicles: [Vehicle]?, _ error: StarWarsError?) -> Void) {

        restCall(fetchUrl: vehiclesUrl, modelType: VehiclesResult()) { (vehicleResults, error ) in
            completion(vehicleResults?.results, error)
        }
    }

    /** This call maps to the StarWarsAPI Films REST call documented
     [here](https://swapi.co/documentation#starships) at the swapi.co web site
     */
    public func starships(completion: @escaping (_ starshpips: [Starship]?, _ error: StarWarsError?) -> Void) {

        restCall(fetchUrl: starshipsUrl, modelType: StarshipsResult()) { (starshipResults, error ) in
            completion(starshipResults?.results, error)
        }
    }

}

/**
 The following classes are mapped the the return calls of the StarWarsAPI REST
 service when returning paged collecitons.  Using a base type for the results
 types (e.g. FilmResult, PeopleResult, VehicelResult) would have been preferable
 but at the time of this writing Swift 4 doesn't support inheritance of Codable
 fields - every Codable field has to be delcared in the target class and nots
 its superclass.
 */

// MARK: - Result Objects

public protocol ResultAble: Codable {
    func nextUrlString() -> String?
    func resultsArray() -> [AnyObject]?
    func appendResults(resultsToAppend: [AnyObject])
}

public class FilmsResult: ResultAble {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [Film]?

    public func nextUrlString() -> String? {
        return next
    }

    public func resultsArray() -> [AnyObject]? {
        return results
    }

    public func appendResults(resultsToAppend: [AnyObject]) {

        if let filmsToAppend = resultsToAppend as? [Film] {
            results! += filmsToAppend
        }
    }

}

public class PeopleResult: ResultAble {

    var count: Int?
    var next: String?
    var previous: String?
    var results: [People]?

    public func nextUrlString() -> String? {
        return next
    }

    public func resultsArray() -> [AnyObject]? {
        return results
    }

    public func appendResults(resultsToAppend: [AnyObject]) {

        if let peopleToAppend = resultsToAppend as? [People] {
            results! += peopleToAppend
        }
    }
}

public class PlanetsResult: ResultAble {

    var count: Int?
    var next: String?
    var previous: String?
    var results: [Planet]?

    public func nextUrlString() -> String? {
        return next
    }

    public func resultsArray() -> [AnyObject]? {
        return results
    }

    public func appendResults(resultsToAppend: [AnyObject]) {

        if let planetsToAppend = resultsToAppend as? [Planet] {
            results! += planetsToAppend
        }
    }
}

public class SpeciesResult: ResultAble {

    var count: Int?
    var next: String?
    var previous: String?
    var results: [Species]?

    public func nextUrlString() -> String? {
        return next
    }

    public func resultsArray() -> [AnyObject]? {
        return results
    }

    public func appendResults(resultsToAppend: [AnyObject]) {

        if let filmsToAppend = resultsToAppend as? [Species] {
            results! += filmsToAppend
        }
    }
}

public class VehiclesResult: ResultAble {

    var count: Int?
    var next: String?
    var previous: String?
    var results: [Vehicle]?

    public func nextUrlString() -> String? {
        return next
    }

    public func resultsArray() -> [AnyObject]? {
        return results
    }

    public func appendResults(resultsToAppend: [AnyObject]) {

        if let vehiclesToAppend = resultsToAppend as? [Vehicle] {
            results! += vehiclesToAppend
        }
    }
}

public class StarshipsResult: ResultAble {

    var count: Int?
    var next: String?
    var previous: String?
    var results: [Starship]?

    public func nextUrlString() -> String? {
        return next
    }

    public func resultsArray() -> [AnyObject]? {
        return results
    }

    public func appendResults(resultsToAppend: [AnyObject]) {

        if let starshipsToAppend = resultsToAppend as? [Starship] {
            results! += starshipsToAppend
        }
    }
}

// MARK: - Error Type
public enum StarWarsError: Error {
    case starWarsAPINotOperational
    case decodingModelError(error:NSError?) // this is thrown when the JSONDecoder fails because of a missmatch between the model and the JSON
    case invalidUrl
    case invalidId
    case noDataFound
    case urlResponseError(error: Error?)
    case nilUrlResponseError()
    case httpErrorCode(code: Int)
}

// MARK: - StarWarsAPI Extension
public extension StarWarsAPI {  //

    // MARK: - Generic REST Service Call
    func restCall<T: Codable>(fetchUrl: URL, modelType: T, completion: @escaping (_ modelObject: T?, _ error: StarWarsError?) -> Void) {

         var fetchRequest = URLRequest(url: fetchUrl, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)

        fetchRequest.httpMethod = "GET"
        fetchRequest.allHTTPHeaderFields = [
            "content-type": "application/json",
            "cache-control": "no-cache"
        ]

        let session = URLSession.shared
        let fetchDataTask = session.dataTask(with: fetchRequest) { (data, response, error) in

            DispatchQueue.main.async { // return to main thread

                guard error == nil else {
                    completion(nil, StarWarsError.urlResponseError(error: error))
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(nil, StarWarsError.nilUrlResponseError())
                    return
                }
                guard let data = data else {
                    return  completion(nil, StarWarsError.noDataFound)
                }
                guard httpResponse.statusCode > 199 && httpResponse.statusCode < 300 else {
                    return  completion(nil, StarWarsError.httpErrorCode(code: httpResponse.statusCode))
                }
                var modelObject: T?
                do {

                    let jsonDecoder = JSONDecoder()
                    modelObject = try jsonDecoder.decode(T.self, from: data)

                    if let resultObject = modelObject as? ResultAble, let nextUrlString = resultObject.nextUrlString() {

                        guard let nextUrl = URL(string: nextUrlString) else {
                            return completion(nil, StarWarsError.invalidUrl)
                        }

                        self.restCall(fetchUrl: nextUrl, modelType: modelType) { (resultRecursive, error) in

                            guard error == nil else {
                                return completion(nil, error)
                            }

                            if let resultRecursive = resultRecursive as? ResultAble {
                                resultObject.appendResults(resultsToAppend: resultRecursive.resultsArray()!)
                                return completion(resultObject as? T, nil)
                            } else {
                                return completion(nil, StarWarsError.decodingModelError(error: nil))
                            }

                        }

                    } else {
                        return completion(modelObject, nil)
                    }

                } catch let error as NSError {
                    completion(nil, StarWarsError.decodingModelError(error: error))
                }
            }
        }

        fetchDataTask.resume()
    }

}
