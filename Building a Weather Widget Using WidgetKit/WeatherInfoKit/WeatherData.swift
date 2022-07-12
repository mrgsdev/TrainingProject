//
//  WeatherData.swift
//  Building a Weather Widget Using WidgetKit
//
//  Created by MRGS on 12.07.2022.
//

import Foundation
public struct WeatherData {
    public var temperature: Int = 0
    public var weather: String = ""
    public init() {}
    public init(temperature: Int, weather: String) {
        self.temperature = temperature
        self.weather = weather
    }
    
}
