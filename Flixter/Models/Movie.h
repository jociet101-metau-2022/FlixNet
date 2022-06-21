//
//  Movie.h
//  Flixter
//
//  Created by Jocelyn Tseng on 6/21/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *overview;
@property (nonatomic, strong) NSString *releaseDate;
@property (nonatomic, strong) NSURL *posterUrl;
@property (nonatomic, strong) NSURL *backdropUrl;

- (id)initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)moviesWithDictionaries:(NSArray *)dictionaries;

@end

NS_ASSUME_NONNULL_END
