//
//  OWResponsesMock.swift
//  
//
//  Created by Adil Erchouk on 11/4/22.
//

import Foundation

enum OWResponsesMock {
    static let simpleWeatherResponseLondon: String =
"""
{
    "coord": {
        "lon": -0.1056,
        "lat": 51.5026
    },
    "weather": [
        {
            "id": 803,
            "main": "Clouds",
            "description": "broken clouds",
            "icon": "04n"
        }
    ],
    "base": "stations",
    "main": {
        "temp": 8.24,
        "feels_like": 7.6,
        "temp_min": 6.96,
        "temp_max": 9.14,
        "pressure": 1000,
        "humidity": 95
    },
    "visibility": 10000,
    "wind": {
        "speed": 1.54,
        "deg": 10
    },
    "clouds": {
        "all": 75
    },
    "dt": 1667529562,
    "sys": {
        "type": 2,
        "id": 2075535,
        "country": "GB",
        "sunrise": 1667545132,
        "sunset": 1667579343
    },
    "timezone": 0,
    "id": 6545250,
    "name": "Lambeth",
    "cod": 200
}
"""
    
static let simpleWeatherResponseInvalid: String =
    """
    {
        "cod": 401,
        "message": "Invalid API key. Please see https://openweathermap.org/faq#error401 for more info."
    }
    """
    
static let simpleWeatherResponseEmpty: String =
    """
    {
        "coord": {
            "lon": -0.1056,
            "lat": 51.5026
        },
        "dt": 1667529562,
        "cod": 200,
        "weather": [],
        "timezone": 0,
    }
    """
}

