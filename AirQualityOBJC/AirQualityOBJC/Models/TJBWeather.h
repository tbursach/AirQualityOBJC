//
//  TJBWeather.h
//  AirQualityOBJC
//
//  Created by Trevor Bursach on 9/30/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TJBWeather : NSObject

@property (nonatomic, readonly) NSInteger temperature;
@property (nonatomic, readonly) NSInteger humidity;
@property (nonatomic, readonly) NSInteger windSpeed;

-(instancetype)initWithWeatherInfo:(NSInteger)temperature humidity:(NSInteger)humidity windSpeed:(NSInteger)windSpeed;

@end

@interface TJBWeather (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
