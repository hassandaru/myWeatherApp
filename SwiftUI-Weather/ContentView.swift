//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Hassan Sohail Dar on 7/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            let selectedWeather = getWeatherValues()
            // binding basically enforces that the value for the object stays the same
            BackgroundView(isNight: $isNight)
            
            VStack {
                CityTextView(cityName: selectedWeather.getCity())
                
                //                first object
                mainWeatherView(isNight: $isNight, todayWeather:
                                    selectedWeather.getWeatherDayListData()[0])
                
                
                HStack(spacing: 20) {
                    weatherDayView(weatherDays: selectedWeather.getWeatherDayListData())
                }
                
            }
            Spacer() //basically used to move the text to the top of the frame
            Button {
                isNight.toggle()
            } label: {
                WeatherButton(title: "Change Day Time",
                              textColor: .blue,
                              backgroundColor: .white)
                
            }
            Spacer()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





struct BackgroundView: View {
    //binding forces the state to stay the same
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
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
    @Binding var isNight: Bool
    var todayWeather: WeatherDay
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(todayWeather.temperature)°C")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
                .padding(.bottom)
        }
        .padding(.bottom, 40)
    }
}

//struct weatherDayView: View {
//    var todayWeather: WeatherDay
//    var body: some View {
//        VStack {
//            Text(todayWeather.dayOfWeek)
//                .font(.system(size: 18, weight: .medium, design: .default))
//                .foregroundColor(.white)
//            Image(systemName: todayWeather.ImageName)
//                .renderingMode(.original)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 40, height: 40)
//            Text("\(todayWeather.temperature)°")
//                .font(.system(size: 28, weight: .medium))
//                .foregroundColor(.white)
//        }
//    }
//}

struct weatherDayView: View {
    //this is where i get all the errors like
    //closure expression is unused
    //expected { in struct
    //expressions are not allowed at the top level.
    
    @State var weatherDays: [WeatherDay]
    
    var body: some View {
        forEach(weatherDays) { singleDay in
            
            VStack {
                Text(singleDay.dayOfWeek)
                    .font(.system(size: 18, weight: .medium, design: .default))
                    .foregroundColor(.white)
                Image(systemName: singleDay.ImageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text("\(singleDay.temperature)°")
                    .font(.system(size: 28, weight: .medium))
                    .foregroundColor(.white)
            }
        }
    }
}
