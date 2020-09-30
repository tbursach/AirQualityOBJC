//
//  DVMCityAirQuality.h
//  AirQuality ObjC
//
//  Created by RYAN GREENBURG on 11/20/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DVMWeather;
@class DVMPollution;

NS_ASSUME_NONNULL_BEGIN

@interface DVMCityAirQuality : NSObject

@property (nonatomic, copy, readonly) NSString * city;
@property (nonatomic, copy, readonly) NSString * state;
@property (nonatomic, copy, readonly) NSString * country;
@property (nonatomic, copy, readonly) DVMWeather * weather;
@property (nonatomic, copy, readonly) DVMPollution * pollution;

-(instancetype)initWithCity:(NSString *)city
                      state:(NSString *)state
                    country:(NSString *)country
                    weather:(DVMWeather *)weather
                  pollution:(DVMPollution *)pollution;

@end

@interface DVMCityAirQuality (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
