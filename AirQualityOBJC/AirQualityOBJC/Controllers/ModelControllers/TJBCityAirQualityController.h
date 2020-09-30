//
//  TJBCityAirQualityController.h
//  AirQualityOBJC
//
//  Created by Trevor Bursach on 9/30/20.
//

#import <Foundation/Foundation.h>
#import "TJBCityAirQuality.h"

NS_ASSUME_NONNULL_BEGIN

@interface TJBCityAirQualityController : NSObject

+(void)fetchSupportedCountries:(void (^) (NSArray<NSString *> *_Nullable))completion;

+ (void)fetchSupportedStatesInCountry:(NSString *)city
                           completion:(void (^) (NSArray<NSString *> * _Nullable))completion;

+ (void)fetchSupportedCitiesInCountry:(NSString *)country
                             state:(NSString *)state
                        completion:(void (^) (NSArray<NSString *> * _Nullable))completion;

+ (void)fetchDataforCity:(NSString *)country
                  state:(NSString *)state
                   city:(NSString *)city
             completion:(void (^) (TJBCityAirQuality * _Nullable))completion;

@end

NS_ASSUME_NONNULL_END
