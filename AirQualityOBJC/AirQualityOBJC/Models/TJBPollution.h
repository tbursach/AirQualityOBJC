//
//  TJBPollution.h
//  AirQualityOBJC
//
//  Created by Trevor Bursach on 9/30/20.
//

#import <Foundation/Foundation.h>


@interface TJBPollution : NSObject

@property (nonatomic, readonly) NSInteger airQualityIndex;

-(instancetype)initWithInt:(NSInteger) aqi;

@end

@interface TJBPollution (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end
