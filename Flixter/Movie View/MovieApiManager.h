//
//  MovieApiManager.h
//  Flixter
//
//  Created by Jocelyn Tseng on 6/21/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieApiManager : NSObject

- (void)fetchNowPlaying:(void(^)(NSArray *movies, NSError *error))completion;
- (void)fetchPopularMovies:(void(^)(NSArray *movies, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
