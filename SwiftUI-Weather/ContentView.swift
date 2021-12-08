//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Hassan Sohail Dar on 7/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
            VStack {
                CityTextView(cityName: "brisbane. Queensland")
                mainWeatherView(ImageName: "cloud.sun.fill", temperature: 76)
                
                HStack(spacing: 20) {
                    
                    weatherDayView(dayOfWeek: "TUE",
                                   ImageName: "cloud.sun.fill",
                                   temperature: 76)
                    weatherDayView(dayOfWeek: "WED",
                                   ImageName: "sun.max.fill",
                                   temperature: 70)
                    weatherDayView(dayOfWeek: "THU",
                                   ImageName: "wind",
                                   temperature: 66)
                    weatherDayView(dayOfWeek: "FRI",
                                   ImageName: "sunset.fill",
                                   temperature: 60)
                    weatherDayView(dayOfWeek: "SAT",
                                   ImageName: "moon.stars.fill",
                                   temperature: 55)
                    
                 
                }
                Spacer() //basically used to move the text to the top of the frame
                Button {
                    print("tapped")
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)

                }
                Spacer()
            }
                
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct weatherDay {
    var dayOfWeek: String
    var ImageName: String
    var temperature: Int
    
}

struct weatherDayView: View {
    var dayOfWeek: String
    var ImageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 18, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: ImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct mainWeatherView: View {
    var ImageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: ImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°C")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
                .padding(.bottom)
            }
            .padding(.bottom, 40)
    }
}


