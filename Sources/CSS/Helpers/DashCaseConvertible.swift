//
//  DashCaseConvertible.swift
//  
//
//  Created by Carson Katri on 10/11/19.
//

public protocol DashCaseConvertible: RawRepresentable, CustomStringConvertible {}
public extension DashCaseConvertible where RawValue == String {
    var description: String {
        rawValue.dashCase()
    }
}
