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
print(testString.at(position: -1) ?? "nil")
print(testString.at(position: 0) ?? "nil")
print(testString.at(position: 5) ?? "nil")
print(testString.at(position: 100) ?? "nil")

//substr(from: to:)
print(testString.substr() ?? "nil") // should be whole string
print(testString.substr(from: 3) ?? "nil")
print(testString.substr(to: 7) ?? "nil")
print(testString.substr(from: 3, to: 7) ?? "nil")


//fromRight()
print(testString.fromRight(-1)) // should be ""
print(testString.fromRight(0))
print(testString.fromRight(5))
print(testString.fromRight(15)) // should be ""
