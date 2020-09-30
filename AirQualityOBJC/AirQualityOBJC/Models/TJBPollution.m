//
//  TJBPollution.m
//  AirQualityOBJC
//
//  Created by Trevor Bursach on 9/30/20.
//

#import "TJBPollution.h"

@implementation TJBPollution

- (instancetype)initWithInt:(NSInteger)aqi
{
    self = [super init];
    
    if (self)
    {
        _airQualityIndex = aqi;
    }
    
    return self;
}

@end

@implementation TJBPollution (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    
    NSInteger aqius = [dictionary[@"aqius"] integerValue];
    
    return [[TJBPollution alloc] initWithInt:aqius];
}

@end
