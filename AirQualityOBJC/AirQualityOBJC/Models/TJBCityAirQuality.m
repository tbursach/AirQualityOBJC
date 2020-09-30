//
//  TJBCityAirQuality.m
//  AirQualityOBJC
//
//  Created by Trevor Bursach on 9/30/20.
//

#import "TJBCityAirQuality.h"

@implementation TJBCityAirQuality

- (instancetype)initWithCity:(NSString *)city state:(NSString *)state country:(NSString *)country weather:(TJBWeather *)weather pollution:(TJBPollution *)pollution
{
    self = [super init];
    
    if (self)
    {
        _city = city;
        _state = state;
        _country = country;
    }
    return self;
}

@end

@implementation TJBCityAirQuality (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *city = dictionary[@"city"];
    NSString *state = dictionary[@"state"];
    NSString *country = dictionary[@"country"];
    
    NSDictionary *weatherDictionary = dictionary[@"current"][@"weather"];
    
    NSDictionary *pollutionDictionary = dictionary[@"current"][@"pollution"];
    
    TJBWeather *weather = [[TJBWeather alloc] initWithDictionary:weatherDictionary];
    TJBPollution *pollution = [[TJBPollution alloc]initWithDictionary:pollutionDictionary];
    
    return [[TJBCityAirQuality alloc]initWithCity:city state:state country:country weather:weather pollution:pollution];
}

@end
