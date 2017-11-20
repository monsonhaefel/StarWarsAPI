//
//  StarWarsAPITests.swift
//  StarWarsAPITests
//
//  Created by RICHARD MONSON-HAEFEL on 11/19/17.
//  Copyright © 2017 RICHARD MONSON-HAEFEL. All rights reserved.
//
// swiftlint:disable explicit_top_level_acl

import XCTest
@testable import StarWarsAPI

class StarWarsAPITests: XCTestCase {

    var starWarsAPI: StarWarsAPI?

    override func setUp() {
        super.setUp()

        starWarsAPI = StarWarsAPI.shared

    }

    func encodingDecoding_Vehicle_Helper() -> Vehicle? {

    let jsonString =
    """
    {
        "name": "Sand Crawler",
        "model": "Digger Crawler",
        "manufacturer": "Corellia Mining Corporation",
        "cost_in_credits": "150000",
        "length": "36.8",
        "max_atmosphering_speed": "30",
        "crew": "46",
        "passengers": "30",
        "cargo_capacity": "50000",
        "consumables": "2 months",
        "vehicle_class": "wheeled",
        "pilots": [],
        "films": [
        "https://swapi.co/api/films/5/",
        "https://swapi.co/api/films/1/"
            ],
        "created": "2014-12-22T18:21:15.523587Z",
        "edited": "2014-13-21T18:21:15.523587Z",
        "url": "https://swapi.co/api/vehicles/4/"
    }
    """

        let jsonData = jsonString.data(using: .utf8)!
        let jsonDecoder = JSONDecoder()
        var vehicleObject: Vehicle?
        do {
            vehicleObject = try jsonDecoder.decode(Vehicle.self, from: jsonData)
        } catch {
            XCTFail("The Vehicle object could not be decoded")
        }
        if vehicleObject == nil {
            XCTFail("The Vehicle object is nil")
        }
        return vehicleObject
    }
    /*
     The purpose of this test is to ensure that mapping between the expected JSON and the model object is correct.
     */

    func testEncodingDecoding_Vehicle() {

        let vehicleObject = encodingDecoding_Vehicle_Helper()

        XCTAssert(vehicleObject?.max_atmosphering_speed == "30", "The vehicle.max_atmosphering_speed value is incorrect")
        XCTAssert(vehicleObject?.crew == "46", "The vehicle.crew value is incorrect")
        XCTAssert(vehicleObject?.passengers == "30", "The vehicle.passengers value is incorrect")
        XCTAssert(vehicleObject?.cargo_capacity == "50000", "The vehicle.cargo_capacity value is incorrect")
        XCTAssert(vehicleObject?.consumables == "2 months", "The vehicle.consumables value is incorrect")
        XCTAssert(vehicleObject?.vehicle_class == "wheeled", "The vehicle.vehicle_class value is incorrect")
        XCTAssert(vehicleObject?.pilots?.count == 0, "The vehicle.pilots array value is incorrect. It should be empty.")
        XCTAssert(vehicleObject?.films?.count != 0, "The vehicle.films array value is incorrect. It should not be empty.")
        XCTAssert(vehicleObject?.films?[0] ==  "https://swapi.co/api/films/5/", "The first element of the vehicle.films array value is incorrect.")
        XCTAssert(vehicleObject?.films?[1] ==  "https://swapi.co/api/films/1/", "The first element of the vehicle.films array value is incorrect.")
        XCTAssert(vehicleObject?.created == "2014-12-22T18:21:15.523587Z", "The vehicle.created value is incorrect.")
        XCTAssert(vehicleObject?.edited == "2014-13-21T18:21:15.523587Z", "The vehicle.edited value is incorrect.")
        XCTAssert(vehicleObject?.name == "Sand Crawler", "The vehicle.name value is incorrect")
        XCTAssert(vehicleObject?.model == "Digger Crawler", "The vehicle.model value is incorrect")
        XCTAssert(vehicleObject?.manufacturer == "Corellia Mining Corporation", "The fvehicle.manufacture value is incorrect")
        XCTAssert(vehicleObject?.cost_in_credits == "150000", "The vehicle.cost_in_credits value is incorrect")
        XCTAssert(vehicleObject?.length == "36.8", "The vehicle.length value is incorrect")

    }

}
