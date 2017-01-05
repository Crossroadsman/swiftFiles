//
//  main.swift
//  StringExtensions
//
//  Created by Alex Koumparos on 05/01/17.
//  Copyright © 2017 Koumparos Software. All rights reserved.
//

import Foundation

let testString = "Hello, World!"

print(testString)

//length
print(testString.length)

//at(position:)
print(testString.at(position: 5))

print(testString.at(position: 100))

print(testString.at(position: -1))

//substr(from: to:)
print(testString.substr()) // should be whole string
print(testString.substr(from: 3))
print(testString.substr(to: 7))
print(testString.substr(from: 3, to: 7))
