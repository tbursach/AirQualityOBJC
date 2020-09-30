//
//  TJBCityAirQualityController.m
//  AirQualityOBJC
//
//  Created by Trevor Bursach on 9/30/20.
//

#import "TJBCityAirQualityController.h"

static NSString * const baseURLString = @"https://api.airvisual.com/v2";

static NSString * const countryComponent = @"countries";
static NSString * const stateComponent = @"states";
static NSString * const cityComponent = @"cities";
static NSString * const cityDetailsComponent = @"city";
static NSString * const keyCompontent = @"key";
static NSString * const apiKey = @"b56ef3c7-a82d-4c9e-b083-39ad8735aabc";

@implementation TJBCityAirQualityController

+ (void)fetchSupportedCountries:(void (^)(NSArray<NSString *> * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *countryURL = [baseURL URLByAppendingPathComponent:countryComponent];
    NSMutableArray <NSURLQueryItem *> *queryItems = [NSMutableArray new];
    
    NSURLQueryItem *apiKeyQuery = [[NSURLQueryItem alloc] initWithName:@"key" value:apiKey];
    
    [queryItems addObject:apiKeyQuery];
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithURL:countryURL resolvingAgainstBaseURL:true];
    
    [urlComponents setQueryItems:queryItems];
    
    NSURL *finalURL = [urlComponents URL];
   
    NSLog(@"%@", finalURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                if (error)
                {
                    NSLog(@"There was an error %@, %@", error, error.localizedDescription);
                    return completion(nil);
                }
        
        if (!data)
        {
            NSLog(@"There appears to be no data.");
            return completion(nil);
        }
        
        NSDictionary *toplevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSDictionary *dataDictionary = toplevelDictionary[@"data"];
        NSMutableArray *countries = [NSMutableArray new];
        for (NSDictionary *countryDictionary in dataDictionary)
        {
            NSString *country = [[NSString alloc] initWithString:countryDictionary[@"country"]];
            [countries addObject:country];
        }
        completion(countries);
        
    }] resume];
}

+ (void)fetchSupportedStatesInCountry:(NSString *)city completion:(void (^)(NSArray<NSString *> * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *stateURL = [baseURL URLByAppendingPathComponent:stateComponent];
    NSMutableArray <NSURLQueryItem *> *queryItems = [NSMutableArray new];
    
    NSURLQueryItem *countryQuery = [[NSURLQueryItem alloc] initWithName:@"country" value:countryComponent];
    
    NSURLQueryItem *apiKeyQuery = [[NSURLQueryItem alloc] initWithName:@"key" value:apiKey];
    
    [queryItems addObject:countryQuery];
    [queryItems addObject:apiKeyQuery];
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithURL:stateURL resolvingAgainstBaseURL:true];
    
    [urlComponents setQueryItems:queryItems];
    
    NSURL *finalURL = [urlComponents URL];
   
    NSLog(@"%@", finalURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                if (error)
                {
                    NSLog(@"There was an error %@, %@", error, error.localizedDescription);
                    return completion(nil);
                }
        
        if (!data)
        {
            NSLog(@"There appears to be no data.");
            return completion(nil);
        }
        
        NSDictionary *toplevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSDictionary *dataDictionary = toplevelDictionary[@"data"];
        NSMutableArray *states = [NSMutableArray new];
        for (NSDictionary *stateDictionary in dataDictionary)
        {
            NSString *state = [[NSString alloc] initWithString:stateDictionary[@"state"]];
            [states addObject:state];
        }
        completion(states);
        
    }] resume];
}

+ (void)fetchSupportedCitiesInCountry:(NSString *)country state:(NSString *)state completion:(void (^)(NSArray<NSString *> * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *cityURL = [baseURL URLByAppendingPathComponent:cityComponent];
    NSMutableArray <NSURLQueryItem *> *queryItems = [NSMutableArray new];
    
    NSURLQueryItem *stateQuery = [[NSURLQueryItem alloc] initWithName:@"state" value:stateComponent];
    
    NSURLQueryItem *countryQuery = [[NSURLQueryItem alloc] initWithName:@"country" value:countryComponent];
    
    NSURLQueryItem *apiKeyQuery = [[NSURLQueryItem alloc] initWithName:@"key" value:apiKey];
    
    [queryItems addObject:stateQuery];
    [queryItems addObject:countryQuery];
    [queryItems addObject:apiKeyQuery];
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithURL:cityURL resolvingAgainstBaseURL:true];
    
    [urlComponents setQueryItems:queryItems];
    
    NSURL *finalURL = [urlComponents URL];
   
    NSLog(@"%@", finalURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                if (error)
                {
                    NSLog(@"There was an error %@, %@", error, error.localizedDescription);
                    return completion(nil);
                }
        
        if (!data)
        {
            NSLog(@"There appears to be no data.");
            return completion(nil);
        }
        
        NSDictionary *toplevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSDictionary *dataDictionary = toplevelDictionary[@"data"];
        NSMutableArray *cities = [NSMutableArray new];
        for (NSDictionary *cityDictionary in dataDictionary)
        {
            NSString *city = [[NSString alloc] initWithString:cityDictionary[@"city"]];
            [cities addObject:city];
        }
        completion(cities);
        
    }] resume];
}

+ (void)fetchDataforCity:(NSString *)country state:(NSString *)state city:(NSString *)city completion:(void (^)(TJBCityAirQuality * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *cityDetailsURL = [baseURL URLByAppendingPathComponent:cityDetailsComponent];
    NSMutableArray <NSURLQueryItem *> *queryItems = [NSMutableArray new];
    
    NSURLQueryItem *cityQuery = [[NSURLQueryItem alloc] initWithName:@"city" value:cityComponent];
    
    NSURLQueryItem *stateQuery = [[NSURLQueryItem alloc] initWithName:@"state" value:stateComponent];
    
    NSURLQueryItem *countryQuery = [[NSURLQueryItem alloc] initWithName:@"country" value:countryComponent];
    
    NSURLQueryItem *apiKeyQuery = [[NSURLQueryItem alloc] initWithName:@"key" value:apiKey];
    
    [queryItems addObject:cityQuery];
    [queryItems addObject:stateQuery];
    [queryItems addObject:countryQuery];
    [queryItems addObject:apiKeyQuery];
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithURL:cityDetailsURL resolvingAgainstBaseURL:true];
    
    [urlComponents setQueryItems:queryItems];
    
    NSURL *finalURL = [urlComponents URL];
   
    NSLog(@"%@", finalURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                if (error)
                {
                    NSLog(@"There was an error %@, %@", error, error.localizedDescription);
                    return completion(nil);
                }
        
        if (!data)
        {
            NSLog(@"There appears to be no data.");
            return completion(nil);
        }
        
        NSDictionary *toplevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSDictionary *dataDictionary = toplevelDictionary[@"data"];
        
        TJBCityAirQuality *cityAQI = [[TJBCityAirQuality alloc] initWithDictionary:dataDictionary];
        completion(cityAQI);
        
    }] resume];
}

@end
