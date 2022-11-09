//
//  OWResponsesMock.swift
//  
//
//  Created by Adil Erchouk on 11/4/22.
//

import Foundation

public enum OWResponsesMock {
    public static let simpleWeatherResponseLondonObject: OWSimpleWeatherResponse = {
        let data = Self.simpleWeatherResponseLondon.data(using: .utf8) ?? { fatalError("JSON string cannot be encoded to Data.") }()
        return try! JSONDecoder().decode(OWSimpleWeatherResponse.self, from: data)
    }()
    
    public static let directGeocodingResponseParisObject: [OWGeocodingResponse] = {
        let data = Self.directGeocodingResponseParis.data(using: .utf8) ?? { fatalError("JSON string cannot be encoded to Data.") }()
        return try! JSONDecoder().decode([OWGeocodingResponse].self, from: data)
    }()
    
    public static let bulkWeatherResponseLondonObject: OWBulkWeatherResponse = {
        let data = Self.bulkWeatherResponseLondon.data(using: .utf8) ?? { fatalError("JSON string cannot be encoded to Data.") }()
        return try! JSONDecoder().decode(OWBulkWeatherResponse.self, from: data)
    }()
    
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
    
    static let simpleWeatherResponseInvalid204: String =
    """
    {
        "cod": 204,
    }
    """
    
    static let simpleWeatherResponseInvalid401: String =
    """
    {
        "cod": 401,
        "message": "Invalid API key. Please see https://openweathermap.org/faq#error401 for more info."
    }
    """
    
    static let simpleWeatherResponseInvalid404: String =
    """
    {
        "cod": 404,
    }
    """
    
    static let simpleWeatherResponseInvalid429: String =
    """
    {
        "cod": 429,
    }
    """
    
    static let simpleWeatherResponseInvalid500: String =
    """
    {
        "cod": 500,
        "message": "Server returned error."
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
    
    static let bulkWeatherResponseLondon: String =
    """
    {
        "cod": "200",
        "message": 0,
        "cnt": 40,
        "list": [
            {
                "dt": 1667628000,
                "main": {
                    "temp": 279.74,
                    "feels_like": 277.93,
                    "temp_min": 279.74,
                    "temp_max": 281,
                    "pressure": 1017,
                    "sea_level": 1017,
                    "grnd_level": 1014,
                    "humidity": 88,
                    "temp_kf": -1.26
                },
                "weather": [
                    {
                        "id": 803,
                        "main": "Clouds",
                        "description": "broken clouds",
                        "icon": "04n"
                    }
                ],
                "clouds": {
                    "all": 83
                },
                "wind": {
                    "speed": 2.51,
                    "deg": 210,
                    "gust": 8.36
                },
                "visibility": 10000,
                "pop": 0,
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2022-11-05 06:00:00"
            },
            {
                "dt": 1667638800,
                "main": {
                    "temp": 281.61,
                    "feels_like": 279.89,
                    "temp_min": 281.61,
                    "temp_max": 282.86,
                    "pressure": 1016,
                    "sea_level": 1016,
                    "grnd_level": 1013,
                    "humidity": 85,
                    "temp_kf": -1.25
                },
                "weather": [
                    {
                        "id": 500,
                        "main": "Rain",
                        "description": "light rain",
                        "icon": "10d"
                    }
                ],
                "clouds": {
                    "all": 93
                },
                "wind": {
                    "speed": 2.88,
                    "deg": 189,
                    "gust": 10.28
                },
                "visibility": 10000,
                "pop": 0.36,
                "rain": {
                    "3h": 0.11
                },
                "sys": {
                    "pod": "d"
                },
                "dt_txt": "2022-11-05 09:00:00"
            },
            {
                "dt": 1667649600,
                "main": {
                    "temp": 284.01,
                    "feels_like": 283.45,
                    "temp_min": 284.01,
                    "temp_max": 284.01,
                    "pressure": 1013,
                    "sea_level": 1013,
                    "grnd_level": 1012,
                    "humidity": 88,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 500,
                        "main": "Rain",
                        "description": "light rain",
                        "icon": "10d"
                    }
                ],
                "clouds": {
                    "all": 100
                },
                "wind": {
                    "speed": 3.48,
                    "deg": 199,
                    "gust": 12.02
                },
                "visibility": 10000,
                "pop": 1,
                "rain": {
                    "3h": 2.03
                },
                "sys": {
                    "pod": "d"
                },
                "dt_txt": "2022-11-05 12:00:00"
            },
            {
                "dt": 1667660400,
                "main": {
                    "temp": 285.26,
                    "feels_like": 284.88,
                    "temp_min": 285.26,
                    "temp_max": 285.26,
                    "pressure": 1011,
                    "sea_level": 1011,
                    "grnd_level": 1010,
                    "humidity": 90,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 500,
                        "main": "Rain",
                        "description": "light rain",
                        "icon": "10d"
                    }
                ],
                "clouds": {
                    "all": 100
                },
                "wind": {
                    "speed": 5.84,
                    "deg": 210,
                    "gust": 13.47
                },
                "visibility": 10000,
                "pop": 0.46,
                "rain": {
                    "3h": 0.25
                },
                "sys": {
                    "pod": "d"
                },
                "dt_txt": "2022-11-05 15:00:00"
            },
            {
                "dt": 1667671200,
                "main": {
                    "temp": 285.9,
                    "feels_like": 285.63,
                    "temp_min": 285.9,
                    "temp_max": 285.9,
                    "pressure": 1010,
                    "sea_level": 1010,
                    "grnd_level": 1009,
                    "humidity": 92,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 500,
                        "main": "Rain",
                        "description": "light rain",
                        "icon": "10n"
                    }
                ],
                "clouds": {
                    "all": 100
                },
                "wind": {
                    "speed": 6.21,
                    "deg": 212,
                    "gust": 13.38
                },
                "visibility": 10000,
                "pop": 0.7,
                "rain": {
                    "3h": 0.7
                },
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2022-11-05 18:00:00"
            },
            {
                "dt": 1667682000,
                "main": {
                    "temp": 286.48,
                    "feels_like": 286.3,
                    "temp_min": 286.48,
                    "temp_max": 286.48,
                    "pressure": 1010,
                    "sea_level": 1010,
                    "grnd_level": 1008,
                    "humidity": 93,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 500,
                        "main": "Rain",
                        "description": "light rain",
                        "icon": "10n"
                    }
                ],
                "clouds": {
                    "all": 100
                },
                "wind": {
                    "speed": 5.41,
                    "deg": 209,
                    "gust": 12.04
                },
                "visibility": 10000,
                "pop": 0.88,
                "rain": {
                    "3h": 0.78
                },
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2022-11-05 21:00:00"
            },
            {
                "dt": 1667692800,
                "main": {
                    "temp": 286.82,
                    "feels_like": 286.7,
                    "temp_min": 286.82,
                    "temp_max": 286.82,
                    "pressure": 1008,
                    "sea_level": 1008,
                    "grnd_level": 1007,
                    "humidity": 94,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 500,
                        "main": "Rain",
                        "description": "light rain",
                        "icon": "10n"
                    }
                ],
                "clouds": {
                    "all": 100
                },
                "wind": {
                    "speed": 4.96,
                    "deg": 208,
                    "gust": 11.85
                },
                "visibility": 10000,
                "pop": 0.94,
                "rain": {
                    "3h": 0.51
                },
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2022-11-06 00:00:00"
            },
            {
                "dt": 1667703600,
                "main": {
                    "temp": 286.59,
                    "feels_like": 286.47,
                    "temp_min": 286.59,
                    "temp_max": 286.59,
                    "pressure": 1006,
                    "sea_level": 1006,
                    "grnd_level": 1005,
                    "humidity": 95,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 501,
                        "main": "Rain",
                        "description": "moderate rain",
                        "icon": "10n"
                    }
                ],
                "clouds": {
                    "all": 100
                },
                "wind": {
                    "speed": 5.56,
                    "deg": 197,
                    "gust": 13.22
                },
                "visibility": 10000,
                "pop": 1,
                "rain": {
                    "3h": 3.66
                },
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2022-11-06 03:00:00"
            },
            {
                "dt": 1667714400,
                "main": {
                    "temp": 286.44,
                    "feels_like": 286.28,
                    "temp_min": 286.44,
                    "temp_max": 286.44,
                    "pressure": 1004,
                    "sea_level": 1004,
                    "grnd_level": 1003,
                    "humidity": 94,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 501,
                        "main": "Rain",
                        "description": "moderate rain",
                        "icon": "10n"
                    }
                ],
                "clouds": {
                    "all": 100
                },
                "wind": {
                    "speed": 4.82,
                    "deg": 210,
                    "gust": 11.34
                },
                "visibility": 4017,
                "pop": 1,
                "rain": {
                    "3h": 11.48
                },
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2022-11-06 06:00:00"
            },
            {
                "dt": 1667725200,
                "main": {
                    "temp": 284.88,
                    "feels_like": 284.46,
                    "temp_min": 284.88,
                    "temp_max": 284.88,
                    "pressure": 1004,
                    "sea_level": 1004,
                    "grnd_level": 1002,
                    "humidity": 90,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 501,
                        "main": "Rain",
                        "description": "moderate rain",
                        "icon": "10d"
                    }
                ],
                "clouds": {
                    "all": 100
                },
                "wind": {
                    "speed": 4.12,
                    "deg": 214,
                    "gust": 8.37
                },
                "visibility": 10000,
                "pop": 0.97,
                "rain": {
                    "3h": 6.02
                },
                "sys": {
                    "pod": "d"
                },
                "dt_txt": "2022-11-06 09:00:00"
            },
            {
                "dt": 1667736000,
                "main": {
                    "temp": 285.25,
                    "feels_like": 284.79,
                    "temp_min": 285.25,
                    "temp_max": 285.25,
                    "pressure": 1002,
                    "sea_level": 1002,
                    "grnd_level": 1001,
                    "humidity": 87,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 500,
                        "main": "Rain",
                        "description": "light rain",
                        "icon": "10d"
                    }
                ],
                "clouds": {
                    "all": 100
                },
                "wind": {
                    "speed": 3.3,
                    "deg": 229,
                    "gust": 8.66
                },
                "visibility": 10000,
                "pop": 1,
                "rain": {
                    "3h": 0.85
                },
                "sys": {
                    "pod": "d"
                },
                "dt_txt": "2022-11-06 12:00:00"
            },
            {
                "dt": 1667746800,
                "main": {
                    "temp": 285.04,
                    "feels_like": 284.4,
                    "temp_min": 285.04,
                    "temp_max": 285.04,
                    "pressure": 1002,
                    "sea_level": 1002,
                    "grnd_level": 1001,
                    "humidity": 81,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 500,
                        "main": "Rain",
                        "description": "light rain",
                        "icon": "10d"
                    }
                ],
                "clouds": {
                    "all": 100
                },
                "wind": {
                    "speed": 4.56,
                    "deg": 238,
                    "gust": 10.47
                },
                "visibility": 10000,
                "pop": 1,
                "rain": {
                    "3h": 2.81
                },
                "sys": {
                    "pod": "d"
                },
                "dt_txt": "2022-11-06 15:00:00"
            },
            {
                "dt": 1667757600,
                "main": {
                    "temp": 284.08,
                    "feels_like": 283.32,
                    "temp_min": 284.08,
                    "temp_max": 284.08,
                    "pressure": 1003,
                    "sea_level": 1003,
                    "grnd_level": 1002,
                    "humidity": 80,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 804,
                        "main": "Clouds",
                        "description": "overcast clouds",
                        "icon": "04n"
                    }
                ],
                "clouds": {
                    "all": 88
                },
                "wind": {
                    "speed": 5.75,
                    "deg": 228,
                    "gust": 13.05
                },
                "visibility": 10000,
                "pop": 0.8,
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2022-11-06 18:00:00"
            },
            {
                "dt": 1667768400,
                "main": {
                    "temp": 283.82,
                    "feels_like": 282.98,
                    "temp_min": 283.82,
                    "temp_max": 283.82,
                    "pressure": 1004,
                    "sea_level": 1004,
                    "grnd_level": 1003,
                    "humidity": 78,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 803,
                        "main": "Clouds",
                        "description": "broken clouds",
                        "icon": "04n"
                    }
                ],
                "clouds": {
                    "all": 58
                },
                "wind": {
                    "speed": 5.75,
                    "deg": 229,
                    "gust": 13.84
                },
                "visibility": 10000,
                "pop": 0.14,
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2022-11-06 21:00:00"
            },
            {
                "dt": 1667779200,
                "main": {
                    "temp": 283.75,
                    "feels_like": 282.93,
                    "temp_min": 283.75,
                    "temp_max": 283.75,
                    "pressure": 1005,
                    "sea_level": 1005,
                    "grnd_level": 1004,
                    "humidity": 79,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 803,
                        "main": "Clouds",
                        "description": "broken clouds",
                        "icon": "04n"
                    }
                ],
                "clouds": {
                    "all": 65
                },
                "wind": {
                    "speed": 5.74,
                    "deg": 230,
                    "gust": 13.42
                },
                "visibility": 10000,
                "pop": 0.04,
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2022-11-07 00:00:00"
            },
            {
                "dt": 1667790000,
                "main": {
                    "temp": 284.7,
                    "feels_like": 284.05,
                    "temp_min": 284.7,
                    "temp_max": 284.7,
                    "pressure": 1005,
                    "sea_level": 1005,
                    "grnd_level": 1004,
                    "humidity": 82,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 804,
                        "main": "Clouds",
                        "description": "overcast clouds",
                        "icon": "04n"
                    }
                ],
                "clouds": {
                    "all": 100
                },
                "wind": {
                    "speed": 5.37,
                    "deg": 221,
                    "gust": 12.39
                },
                "visibility": 10000,
                "pop": 0.2,
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2022-11-07 03:00:00"
            },
            {
                "dt": 1667800800,
                "main": {
                    "temp": 285.1,
                    "feels_like": 284.6,
                    "temp_min": 285.1,
                    "temp_max": 285.1,
                    "pressure": 1005,
                    "sea_level": 1005,
                    "grnd_level": 1003,
                    "humidity": 86,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 804,
                        "main": "Clouds",
                        "description": "overcast clouds",
                        "icon": "04n"
                    }
                ],
                "clouds": {
                    "all": 100
                },
                "wind": {
                    "speed": 5.12,
                    "deg": 215,
                    "gust": 12.82
                },
                "visibility": 10000,
                "pop": 0.2,
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2022-11-07 06:00:00"
            },
            {
                "dt": 1667811600,
                "main": {
                    "temp": 285.96,
                    "feels_like": 285.65,
                    "temp_min": 285.96,
                    "temp_max": 285.96,
                    "pressure": 1005,
                    "sea_level": 1005,
                    "grnd_level": 1004,
                    "humidity": 90,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 500,
                        "main": "Rain",
                        "description": "light rain",
                        "icon": "10d"
                    }
                ],
                "clouds": {
                    "all": 100
                },
                "wind": {
                    "speed": 5.66,
                    "deg": 213,
                    "gust": 13.34
                },
                "visibility": 10000,
                "pop": 0.6,
                "rain": {
                    "3h": 0.51
                },
                "sys": {
                    "pod": "d"
                },
                "dt_txt": "2022-11-07 09:00:00"
            },
            {
                "dt": 1667822400,
                "main": {
                    "temp": 287.63,
                    "feels_like": 287.22,
                    "temp_min": 287.63,
                    "temp_max": 287.63,
                    "pressure": 1006,
                    "sea_level": 1006,
                    "grnd_level": 1004,
                    "humidity": 80,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 500,
                        "main": "Rain",
                        "description": "light rain",
                        "icon": "10d"
                    }
                ],
                "clouds": {
                    "all": 100
                },
                "wind": {
                    "speed": 6.94,
                    "deg": 212,
                    "gust": 13.88
                },
                "visibility": 10000,
                "pop": 0.6,
                "rain": {
                    "3h": 0.41
                },
                "sys": {
                    "pod": "d"
                },
                "dt_txt": "2022-11-07 12:00:00"
            },
            {
                "dt": 1667833200,
                "main": {
                    "temp": 287.63,
                    "feels_like": 287.09,
                    "temp_min": 287.63,
                    "temp_max": 287.63,
                    "pressure": 1005,
                    "sea_level": 1005,
                    "grnd_level": 1004,
                    "humidity": 75,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 500,
                        "main": "Rain",
                        "description": "light rain",
                        "icon": "10d"
                    }
                ],
                "clouds": {
                    "all": 100
                },
                "wind": {
                    "speed": 7.29,
                    "deg": 210,
                    "gust": 15.16
                },
                "visibility": 10000,
                "pop": 0.22,
                "rain": {
                    "3h": 0.21
                },
                "sys": {
                    "pod": "d"
                },
                "dt_txt": "2022-11-07 15:00:00"
            },
            {
                "dt": 1667844000,
                "main": {
                    "temp": 287.34,
                    "feels_like": 286.77,
                    "temp_min": 287.34,
                    "temp_max": 287.34,
                    "pressure": 1004,
                    "sea_level": 1004,
                    "grnd_level": 1003,
                    "humidity": 75,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 804,
                        "main": "Clouds",
                        "description": "overcast clouds",
                        "icon": "04n"
                    }
                ],
                "clouds": {
                    "all": 100
                },
                "wind": {
                    "speed": 7.37,
                    "deg": 204,
                    "gust": 17.52
                },
                "visibility": 10000,
                "pop": 0.04,
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2022-11-07 18:00:00"
            },
            {
                "dt": 1667854800,
                "main": {
                    "temp": 287.67,
                    "feels_like": 287.11,
                    "temp_min": 287.67,
                    "temp_max": 287.67,
                    "pressure": 1003,
                    "sea_level": 1003,
                    "grnd_level": 1001,
                    "humidity": 74,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 500,
                        "main": "Rain",
                        "description": "light rain",
                        "icon": "10n"
                    }
                ],
                "clouds": {
                    "all": 100
                },
                "wind": {
                    "speed": 8.77,
                    "deg": 196,
                    "gust": 17.28
                },
                "visibility": 10000,
                "pop": 0.26,
                "rain": {
                    "3h": 0.13
                },
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2022-11-07 21:00:00"
            },
            {
                "dt": 1667865600,
                "main": {
                    "temp": 287.12,
                    "feels_like": 286.56,
                    "temp_min": 287.12,
                    "temp_max": 287.12,
                    "pressure": 1000,
                    "sea_level": 1000,
                    "grnd_level": 999,
                    "humidity": 76,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 804,
                        "main": "Clouds",
                        "description": "overcast clouds",
                        "icon": "04n"
                    }
                ],
                "clouds": {
                    "all": 100
                },
                "wind": {
                    "speed": 8.28,
                    "deg": 186,
                    "gust": 18.7
                },
                "visibility": 10000,
                "pop": 0.02,
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2022-11-08 00:00:00"
            },
            {
                "dt": 1667876400,
                "main": {
                    "temp": 287.23,
                    "feels_like": 286.63,
                    "temp_min": 287.23,
                    "temp_max": 287.23,
                    "pressure": 997,
                    "sea_level": 997,
                    "grnd_level": 996,
                    "humidity": 74,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 804,
                        "main": "Clouds",
                        "description": "overcast clouds",
                        "icon": "04n"
                    }
                ],
                "clouds": {
                    "all": 100
                },
                "wind": {
                    "speed": 8.35,
                    "deg": 191,
                    "gust": 19.67
                },
                "visibility": 10000,
                "pop": 0.2,
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2022-11-08 03:00:00"
            },
            {
                "dt": 1667887200,
                "main": {
                    "temp": 285.51,
                    "feels_like": 285.1,
                    "temp_min": 285.51,
                    "temp_max": 285.51,
                    "pressure": 997,
                    "sea_level": 997,
                    "grnd_level": 996,
                    "humidity": 88,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 501,
                        "main": "Rain",
                        "description": "moderate rain",
                        "icon": "10n"
                    }
                ],
                "clouds": {
                    "all": 100
                },
                "wind": {
                    "speed": 6.77,
                    "deg": 209,
                    "gust": 13.01
                },
                "visibility": 9998,
                "pop": 1,
                "rain": {
                    "3h": 5.45
                },
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2022-11-08 06:00:00"
            },
            {
                "dt": 1667898000,
                "main": {
                    "temp": 285.88,
                    "feels_like": 285.3,
                    "temp_min": 285.88,
                    "temp_max": 285.88,
                    "pressure": 998,
                    "sea_level": 998,
                    "grnd_level": 997,
                    "humidity": 80,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 500,
                        "main": "Rain",
                        "description": "light rain",
                        "icon": "10d"
                    }
                ],
                "clouds": {
                    "all": 80
                },
                "wind": {
                    "speed": 6.76,
                    "deg": 211,
                    "gust": 15.04
                },
                "visibility": 10000,
                "pop": 1,
                "rain": {
                    "3h": 1.16
                },
                "sys": {
                    "pod": "d"
                },
                "dt_txt": "2022-11-08 09:00:00"
            },
            {
                "dt": 1667908800,
                "main": {
                    "temp": 287.03,
                    "feels_like": 286.35,
                    "temp_min": 287.03,
                    "temp_max": 287.03,
                    "pressure": 999,
                    "sea_level": 999,
                    "grnd_level": 998,
                    "humidity": 72,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 500,
                        "main": "Rain",
                        "description": "light rain",
                        "icon": "10d"
                    }
                ],
                "clouds": {
                    "all": 77
                },
                "wind": {
                    "speed": 7.85,
                    "deg": 217,
                    "gust": 16.57
                },
                "visibility": 10000,
                "pop": 1,
                "rain": {
                    "3h": 0.42
                },
                "sys": {
                    "pod": "d"
                },
                "dt_txt": "2022-11-08 12:00:00"
            },
            {
                "dt": 1667919600,
                "main": {
                    "temp": 286.27,
                    "feels_like": 285.6,
                    "temp_min": 286.27,
                    "temp_max": 286.27,
                    "pressure": 999,
                    "sea_level": 999,
                    "grnd_level": 998,
                    "humidity": 75,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 500,
                        "main": "Rain",
                        "description": "light rain",
                        "icon": "10d"
                    }
                ],
                "clouds": {
                    "all": 55
                },
                "wind": {
                    "speed": 8.38,
                    "deg": 219,
                    "gust": 16.83
                },
                "visibility": 10000,
                "pop": 0.49,
                "rain": {
                    "3h": 0.35
                },
                "sys": {
                    "pod": "d"
                },
                "dt_txt": "2022-11-08 15:00:00"
            },
            {
                "dt": 1667930400,
                "main": {
                    "temp": 285.16,
                    "feels_like": 284.48,
                    "temp_min": 285.16,
                    "temp_max": 285.16,
                    "pressure": 1002,
                    "sea_level": 1002,
                    "grnd_level": 1000,
                    "humidity": 79,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 803,
                        "main": "Clouds",
                        "description": "broken clouds",
                        "icon": "04n"
                    }
                ],
                "clouds": {
                    "all": 66
                },
                "wind": {
                    "speed": 6.84,
                    "deg": 222,
                    "gust": 14.51
                },
                "visibility": 10000,
                "pop": 0.4,
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2022-11-08 18:00:00"
            },
            {
                "dt": 1667941200,
                "main": {
                    "temp": 284.83,
                    "feels_like": 284.19,
                    "temp_min": 284.83,
                    "temp_max": 284.83,
                    "pressure": 1003,
                    "sea_level": 1003,
                    "grnd_level": 1002,
                    "humidity": 82,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 800,
                        "main": "Clear",
                        "description": "clear sky",
                        "icon": "01n"
                    }
                ],
                "clouds": {
                    "all": 9
                },
                "wind": {
                    "speed": 6.29,
                    "deg": 219,
                    "gust": 13.75
                },
                "visibility": 10000,
                "pop": 0.12,
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2022-11-08 21:00:00"
            },
            {
                "dt": 1667952000,
                "main": {
                    "temp": 285.04,
                    "feels_like": 284.37,
                    "temp_min": 285.04,
                    "temp_max": 285.04,
                    "pressure": 1004,
                    "sea_level": 1004,
                    "grnd_level": 1003,
                    "humidity": 80,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 802,
                        "main": "Clouds",
                        "description": "scattered clouds",
                        "icon": "03n"
                    }
                ],
                "clouds": {
                    "all": 32
                },
                "wind": {
                    "speed": 6.43,
                    "deg": 226,
                    "gust": 13.12
                },
                "visibility": 10000,
                "pop": 0.2,
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2022-11-09 00:00:00"
            },
            {
                "dt": 1667962800,
                "main": {
                    "temp": 284.08,
                    "feels_like": 283.34,
                    "temp_min": 284.08,
                    "temp_max": 284.08,
                    "pressure": 1007,
                    "sea_level": 1007,
                    "grnd_level": 1005,
                    "humidity": 81,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 802,
                        "main": "Clouds",
                        "description": "scattered clouds",
                        "icon": "03n"
                    }
                ],
                "clouds": {
                    "all": 37
                },
                "wind": {
                    "speed": 5.14,
                    "deg": 236,
                    "gust": 12.36
                },
                "visibility": 10000,
                "pop": 0.12,
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2022-11-09 03:00:00"
            },
            {
                "dt": 1667973600,
                "main": {
                    "temp": 283.76,
                    "feels_like": 282.97,
                    "temp_min": 283.76,
                    "temp_max": 283.76,
                    "pressure": 1008,
                    "sea_level": 1008,
                    "grnd_level": 1007,
                    "humidity": 80,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 803,
                        "main": "Clouds",
                        "description": "broken clouds",
                        "icon": "04n"
                    }
                ],
                "clouds": {
                    "all": 54
                },
                "wind": {
                    "speed": 4.56,
                    "deg": 236,
                    "gust": 12.01
                },
                "visibility": 10000,
                "pop": 0,
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2022-11-09 06:00:00"
            },
            {
                "dt": 1667984400,
                "main": {
                    "temp": 284.39,
                    "feels_like": 283.58,
                    "temp_min": 284.39,
                    "temp_max": 284.39,
                    "pressure": 1011,
                    "sea_level": 1011,
                    "grnd_level": 1010,
                    "humidity": 77,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 802,
                        "main": "Clouds",
                        "description": "scattered clouds",
                        "icon": "03d"
                    }
                ],
                "clouds": {
                    "all": 44
                },
                "wind": {
                    "speed": 3.57,
                    "deg": 235,
                    "gust": 10.1
                },
                "visibility": 10000,
                "pop": 0,
                "sys": {
                    "pod": "d"
                },
                "dt_txt": "2022-11-09 09:00:00"
            },
            {
                "dt": 1667995200,
                "main": {
                    "temp": 286.78,
                    "feels_like": 285.84,
                    "temp_min": 286.78,
                    "temp_max": 286.78,
                    "pressure": 1013,
                    "sea_level": 1013,
                    "grnd_level": 1012,
                    "humidity": 63,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 803,
                        "main": "Clouds",
                        "description": "broken clouds",
                        "icon": "04d"
                    }
                ],
                "clouds": {
                    "all": 66
                },
                "wind": {
                    "speed": 4.47,
                    "deg": 245,
                    "gust": 8.12
                },
                "visibility": 10000,
                "pop": 0,
                "sys": {
                    "pod": "d"
                },
                "dt_txt": "2022-11-09 12:00:00"
            },
            {
                "dt": 1668006000,
                "main": {
                    "temp": 286.83,
                    "feels_like": 285.92,
                    "temp_min": 286.83,
                    "temp_max": 286.83,
                    "pressure": 1014,
                    "sea_level": 1014,
                    "grnd_level": 1013,
                    "humidity": 64,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 800,
                        "main": "Clear",
                        "description": "clear sky",
                        "icon": "01d"
                    }
                ],
                "clouds": {
                    "all": 5
                },
                "wind": {
                    "speed": 3.61,
                    "deg": 245,
                    "gust": 7.02
                },
                "visibility": 10000,
                "pop": 0,
                "sys": {
                    "pod": "d"
                },
                "dt_txt": "2022-11-09 15:00:00"
            },
            {
                "dt": 1668016800,
                "main": {
                    "temp": 284.78,
                    "feels_like": 284.01,
                    "temp_min": 284.78,
                    "temp_max": 284.78,
                    "pressure": 1017,
                    "sea_level": 1017,
                    "grnd_level": 1016,
                    "humidity": 77,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 800,
                        "main": "Clear",
                        "description": "clear sky",
                        "icon": "01n"
                    }
                ],
                "clouds": {
                    "all": 5
                },
                "wind": {
                    "speed": 2.76,
                    "deg": 227,
                    "gust": 7.83
                },
                "visibility": 10000,
                "pop": 0,
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2022-11-09 18:00:00"
            },
            {
                "dt": 1668027600,
                "main": {
                    "temp": 283.91,
                    "feels_like": 283.16,
                    "temp_min": 283.91,
                    "temp_max": 283.91,
                    "pressure": 1019,
                    "sea_level": 1019,
                    "grnd_level": 1017,
                    "humidity": 81,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 804,
                        "main": "Clouds",
                        "description": "overcast clouds",
                        "icon": "04n"
                    }
                ],
                "clouds": {
                    "all": 94
                },
                "wind": {
                    "speed": 2.69,
                    "deg": 221,
                    "gust": 8.3
                },
                "visibility": 10000,
                "pop": 0,
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2022-11-09 21:00:00"
            },
            {
                "dt": 1668038400,
                "main": {
                    "temp": 283.56,
                    "feels_like": 282.85,
                    "temp_min": 283.56,
                    "temp_max": 283.56,
                    "pressure": 1020,
                    "sea_level": 1020,
                    "grnd_level": 1018,
                    "humidity": 84,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 804,
                        "main": "Clouds",
                        "description": "overcast clouds",
                        "icon": "04n"
                    }
                ],
                "clouds": {
                    "all": 94
                },
                "wind": {
                    "speed": 2.86,
                    "deg": 215,
                    "gust": 9.76
                },
                "visibility": 10000,
                "pop": 0,
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2022-11-10 00:00:00"
            },
            {
                "dt": 1668049200,
                "main": {
                    "temp": 283.35,
                    "feels_like": 282.72,
                    "temp_min": 283.35,
                    "temp_max": 283.35,
                    "pressure": 1020,
                    "sea_level": 1020,
                    "grnd_level": 1019,
                    "humidity": 88,
                    "temp_kf": 0
                },
                "weather": [
                    {
                        "id": 803,
                        "main": "Clouds",
                        "description": "broken clouds",
                        "icon": "04n"
                    }
                ],
                "clouds": {
                    "all": 83
                },
                "wind": {
                    "speed": 2.18,
                    "deg": 203,
                    "gust": 9.69
                },
                "visibility": 10000,
                "pop": 0,
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2022-11-10 03:00:00"
            }
        ],
        "city": {
            "id": 6545250,
            "name": "Lambeth",
            "coord": {
                "lat": 51.5026,
                "lon": -0.1056
            },
            "country": "GB",
            "population": 6000,
            "timezone": 0,
            "sunrise": 1667631639,
            "sunset": 1667665640
        }
    }
    """
    
    static let directGeocodingResponseParis: String = """
[
    {
        "name": "Paris",
        "lat": 48.8588897,
        "lon": 2.3200410217200766,
        "country": "FR",
        "state": "Ile-de-France"
    },
    {
        "name": "Paris",
        "lat": 48.8534951,
        "lon": 2.3483915,
        "country": "FR",
        "state": "Ile-de-France"
    },
    {
        "name": "Paris",
        "lat": 33.6617962,
        "lon": -95.555513,
        "country": "US",
        "state": "Texas"
    },
    {
        "name": "Paris",
        "lat": 38.2097987,
        "lon": -84.2529869,
        "country": "US",
        "state": "Kentucky"
    },
    {
        "name": "Paris",
        "lat": 48.8588897,
        "lon": 2.3200410217200766,
        "country": "FR",
        "state": "Ile-de-France"
    }
]
"""
}

