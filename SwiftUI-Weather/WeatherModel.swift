//
//  WeatherModel.swift
//  SwiftUI-Weather
//
//  Created by Hassan Sohail Dar on 8/12/21.
//
//
import Foundation
import SwiftUI

struct WeatherDay : Hashable {
    var dayOfWeek: String
    var ImageName: String
    var temperature: Int
    
    init(dayOfWeek: String, ImageName: String, temperature: Int)
    {
        self.dayOfWeek = dayOfWeek
        self.ImageName = ImageName
        self.temperature = temperature
        
    }
}

class Weather {
    var city: String
    var myWeatherDay = [WeatherDay]()
    
    init(mycity: String)
    {
        self.city = mycity
        
    }
    func getCity() -> String {
        return self.city
    }
    
    func setCityName(cityName: String)
    {
        self.city = cityName
    }
    func addDayData(weatherDayData: WeatherDay)
    {
        self.myWeatherDay.append(weatherDayData)
    }
    func getWeatherDayListData() -> Array<WeatherDay> {
        return self.myWeatherDay
    }
   
    
}

func getWeatherValues() -> Weather {
    //fetch data here and then fill weather struct. Done manually first time
    let selectedWeatherObject = Weather(mycity: "Brisbane, Queensland")
    selectedWeatherObject.addDayData(weatherDayData: WeatherDay(dayOfWeek: "TUE", ImageName: "cloud.sun.fill", temperature: 76))
    selectedWeatherObject.addDayData(weatherDayData: WeatherDay(dayOfWeek: "WED", ImageName: "sun.max.fill", temperature: 70))
    selectedWeatherObject.addDayData(weatherDayData: WeatherDay(dayOfWeek: "THU", ImageName: "wind", temperature: 66))
    selectedWeatherObject.addDayData(weatherDayData: WeatherDay(dayOfWeek: "FRI", ImageName: "sunset.fill", temperature: 60))
    selectedWeatherObject.addDayData(weatherDayData: WeatherDay(dayOfWeek: "SAT", ImageName: "moon.stars.fill", temperature: 55))

    print(selectedWeatherObject)
    return selectedWeatherObject
}

