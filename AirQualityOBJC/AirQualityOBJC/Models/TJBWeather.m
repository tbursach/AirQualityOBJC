//
//  TJBWeather.m
//  AirQualityOBJC
//
//  Created by Trevor Bursach on 9/30/20.
//

#import "TJBWeather.h"

@implementation TJBWeather

- (instancetype)initWithWeatherInfo:(NSInteger)temperature humidity:(NSInteger)humidity windSpeed:(NSInteger)windSpeed
{
    self = [super init];
    
    if (self) {
        _temperature = temperature;
        _humidity = humidity;
        _windSpeed = windSpeed;
    }
    return self;
}

@end

@implementation TJBWeather (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSInteger temperature = [dictionary[@"tp"]integerValue];
    NSInteger humidity = [dictionary[@"hu"]integerValue];
    NSInteger windSpeed = [dictionary[@"ws"]integerValue];
    
    return [[TJBWeather alloc] initWithWeatherInfo:temperature humidity:humidity windSpeed:windSpeed];
}

@end
