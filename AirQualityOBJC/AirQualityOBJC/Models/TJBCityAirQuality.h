//
//  TJBCityAirQuality.h
//  AirQualityOBJC
//
//  Created by Trevor Bursach on 9/30/20.
//

//key: b56ef3c7-a82d-4c9e-b083-39ad8735aabc
//https://api.airvisual.com/v2/nearest_city?key=your_key

#import <Foundation/Foundation.h>
#import "TJBWeather.h"
#import "TJBPollution.h"

NS_ASSUME_NONNULL_BEGIN

@interface TJBCityAirQuality : NSObject

@property (nonatomic, copy, readonly) NSString * city;
@property (nonatomic, copy, readonly) NSString * state;
@property (nonatomic, copy, readonly) NSString * country;
@property (nonatomic, copy, readonly) TJBWeather * weather;
@property (nonatomic, copy, readonly) TJBPollution * pollution;

-(instancetype)initWithCity:(NSString *)city state:(NSString *)state country:(NSString *)country weather:(TJBWeather *)weather pollution:(TJBPollution *)pollution;

@end

@interface TJBCityAirQuality (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
