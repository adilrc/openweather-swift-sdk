//
//  OWSimpleWeatherResponse.swift
//
//
//  Created by Adil Erchouk on 11/3/22.
//

import Foundation

/// Description
///
///
/// - Note: Per OpenWeather documentation, If you do not see some of the parameters in your API response, it means that these weather phenomena just have not happened for the selected location at the time of measurement. Only actually measured or calculated data is displayed in an API response. These values will appear as optinoals in this structure.
public struct OWSimpleWeatherResponse: Codable {

  /// Time of data calculation.
  public let date: Date

  /// Container for the coordinates of the requested location.
  public var coordinates: OWCoordinates?

  /// Container for the weather conditions summaries of the day for the requested location.
  ///
  /// - Note: It is possible to meet more than one weather condition for a requested location. The first weather condition in API respond is primary.
  public let summaries: [OWWeatherConditionSummary]

  /// Container  for the main weather metrics for the location (temperature, humidity, pressure, etc...).
  public let mainMetrics: OWMainMetrics

  /// Visibility. The maximum value of the visibility is 10km
  ///
  /// Unit: meter
  public var visibility: Int?

  /// Container for wind velocity information.
  public var wind: OWWind?

  /// Container for rain falls forecasts.
  public var rain: OWRain?

  /// Container for clouds coverage information.
  public var clouds: OWClouds?

  /// The context of the requested location (country, sunrise, sunset, etc..).
  public var context: OWContext?

  /// The timezone of the requested location.
  public var timeZone: TimeZone?

  /// The response status code.
  ///
  /// - Note: Unlike for the bulk weather response, the Open Weather API provides here an `Int` for the response code instead of a `String`
  var responseCode: Int?

  /// Message used for error descriptions.
  private var message: String?

  enum CodingKeys: String, CodingKey {
    case visibility, wind, rain, clouds, message
    case summaries = "weather"
    case mainMetrics = "main"
    case date = "dt"
    case coordinates = "coord"
    case context = "sys"
    case timeZone = "timezone"
    case responseCode = "cod"
  }

  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    let responseCode = try? values.decode(Int.self, forKey: .responseCode)

    if let responseCode = try? values.decode(Int.self, forKey: .responseCode), responseCode != 200 {
      // If response code is different than 200, it's an error
      let errorMessage = try? values.decode(String.self, forKey: .message)
      throw OWError(errorCode: responseCode, message: errorMessage)
    }

    self.coordinates = try? values.decode(
      OWCoordinates.self,
      forKey: .coordinates)

    // Decoding date
    let timeIntervalSince1970: Double = try values.decode(
      Double.self,
      forKey: .date)
    self.date = Date(timeIntervalSince1970: timeIntervalSince1970)

    do {
      self.summaries = try values.decode(
        [OWWeatherConditionSummary].self,
        forKey: .summaries)
      self.mainMetrics = try values.decode(
        OWMainMetrics.self,
        forKey: .mainMetrics)
    } catch {
      // If the basic weather info is not present throw a no content error (error code 204)
      throw OWError.noContent
    }
    self.visibility = try? values.decode(
      Int.self,
      forKey: .visibility)
    self.wind = try? values.decode(
      OWWind.self,
      forKey: .wind)
    self.rain = try? values.decode(
      OWRain.self,
      forKey: .rain)
    self.clouds = try? values.decode(
      OWClouds.self,
      forKey: .clouds)

    self.context = try? values.decode(
      OWContext.self,
      forKey: .context)

    let timeZoneShift = try? values.decode(
      Int.self,
      forKey: .timeZone)
    self.timeZone = timeZoneShift.flatMap { .init(secondsFromGMT: $0) }

    self.responseCode = responseCode
    self.message = try? values.decode(
      String.self,
      forKey: .message)
  }
}
