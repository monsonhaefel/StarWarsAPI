//
//  StarWarsAPIIntegrationTests.swift
//  StarWarsAPIIntegrationTests
//
//  Created by RICHARD MONSON-HAEFEL on 11/1/17.
//  Copyright © 2017 RICHARD MONSON-HAEFEL. All rights reserved.
//
// swiftlint:disable explicit_top_level_acl explicit_type_interface

import XCTest
@testable import StarWarsAPI

class StarWarsAPIIntegrationTests: XCTestCase {

    static var characterIds = Set<String>()
    let allowedWaitTime: TimeInterval = 12000.0 // seconds
    var starWarsAPI: StarWarsAPI?
    override func setUp() {
        super.setUp()
        self.starWarsAPI = StarWarsAPI.shared
    }

    func testFilmsAPI() {

        let expectation = self.expectation(description: "The method will return a collection of all the Film obects")

        self.starWarsAPI?.films { (films, error) in

            expectation.fulfill()

            XCTAssertTrue(error == nil, "The SWAPI remote service (e.g. swapi.co) for films() returned an error.")
            XCTAssertTrue(films != nil, "The SWAPI remote service (e.g. swapi.co) for films() returned a nil value for films.")

            if let films = films {
                XCTAssert(films.count > 0, "The SWAPI remote service (e.g. swapi.co) for films() (e.g. swapi.co) returned a film count of zero.")

                for film in films {
                    XCTAssert(film.episode_id != nil, "The SWAPI remote service (e.g. swapi.co) for films() (e.g. swapi.co) returned a film with no title.")
                }
                print(StarWarsAPIIntegrationTests.characterIds)
            }

        }
        waitForExpectations(timeout: allowedWaitTime, handler: nil)
    }

    override func tearDown() {
        super.tearDown()
        print("Test Case Completed")
    }

    func testPeopleAPI() {

        let expectation = self.expectation(description: "The method will return a collection of all the People objects")

        self.starWarsAPI?.people { (people, error) in

            expectation.fulfill()

            XCTAssertTrue(error == nil, "The SWAPI remote service (e.g. swapi.co) for people() returned an error.")
            XCTAssertTrue(people != nil, "The SWAPI remote service (e.g. swapi.co) for people() returned a nil value for people.")

            if let people = people {
                XCTAssert(people.count > 0, "The SWAPI remote service (e.g. swapi.co) for people() (e.g. swapi.co) returned a people count of zero.")

                for person in people {
                    XCTAssert(person.name != nil, "The SWAPI remote service (e.g. swapi.co) for people() (e.g. swapi.co) returned a person with no name.")
                }
            }

        }
        waitForExpectations(timeout: allowedWaitTime, handler: nil)

    }

    func testSpeciesAPI() {

        let expectation = self.expectation(description: "The method will return a collection of all the Species objects")

        self.starWarsAPI?.species { (species, error) in

            expectation.fulfill()

            XCTAssertTrue(error == nil, "The SWAPI remote service (e.g. swapi.co) for species() returned an error.")
            XCTAssertTrue(species != nil, "The SWAPI remote service (e.g. swapi.co) for species() returned a nil value for species.")

            if let species = species {
                XCTAssert(species.count > 0, "The SWAPI remote service (e.g. swapi.co) for species() (e.g. swapi.co) returned a species count of zero.")

                for specie in species {
                    XCTAssert(specie.name != nil, "The SWAPI remote service (e.g. swapi.co) for species() (e.g. swapi.co) returned a specie with no name.")
                }
            }

        }
        waitForExpectations(timeout: allowedWaitTime, handler: nil)

    }

    func testPlanetsAPI() {

        let expectation = self.expectation(description: "The method will return a collection of all the Planets objects")

        self.starWarsAPI?.planets { (planets, error) in

            expectation.fulfill()

            XCTAssertTrue(error == nil, "The SWAPI remote service (e.g. swapi.co) for planets() returned an error.")
            XCTAssertTrue(planets != nil, "The SWAPI remote service (e.g. swapi.co) for planets() returned a nil value for planets.")

            if let planets = planets {
                XCTAssert(planets.count > 0, "The SWAPI remote service (e.g. swapi.co) for planets() (e.g. swapi.co) returned a planets count of zero.")

                for planet in planets {
                    XCTAssert(planet.name != nil, "The SWAPI remote service (e.g. swapi.co) for planets() (e.g. swapi.co) returned a planet with no name.")
                }
            }

        }
        waitForExpectations(timeout: allowedWaitTime, handler: nil)

    }

    func testStarshipsAPI() {

        let expectation = self.expectation(description: "The method will return a collection of all the Starship objects")

        self.starWarsAPI?.starships { (starships, error) in

            expectation.fulfill()

            XCTAssertTrue(error == nil, "The SWAPI remote service (e.g. swapi.co) for starships() returned an error.")
            XCTAssertTrue(starships != nil, "The SWAPI remote service (e.g. swapi.co) for starships() returned a nil value for starships.")

            if let starships = starships {
                XCTAssert(starships.count > 0, "The SWAPI remote service (e.g. swapi.co) for starships() (e.g. swapi.co) returned a starships count of zero.")

                for starship in starships {
                    XCTAssert(starship.name != nil, "The SWAPI remote service (e.g. swapi.co) for starships() (e.g. swapi.co) returned a starship with no name.")
                }
            }

        }
        waitForExpectations(timeout: allowedWaitTime, handler: nil)

    }

    func testVehicelAPI() {

        let expectation = self.expectation(description: "The method will return a collection of all the Vehicel objects")

        self.starWarsAPI?.vehicles { (vehicles, error) in

            expectation.fulfill()

            XCTAssertTrue(error == nil, "The SWAPI remote service (e.g. swapi.co) for vehicles() returned an error.")
            XCTAssertTrue(vehicles != nil, "The SWAPI remote service (e.g. swapi.co) for vehicles() returned a nil value for vehicles.")

            if let vehicles = vehicles {
                XCTAssert(vehicles.count > 0, "The SWAPI remote service (e.g. swapi.co) for starships() (e.g. swapi.co) returned a starships count of zero.")

                for vehicle in vehicles {
                    XCTAssert(vehicle.name != nil, "The SWAPI remote service (e.g. swapi.co) for starships() (e.g. swapi.co) returned a starship with no name.")
                }
            }

        }
        waitForExpectations(timeout: allowedWaitTime, handler: nil)

    }

}
