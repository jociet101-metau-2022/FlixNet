//
//  Movie.m
//  Flixter
//
//  Created by Jocelyn Tseng on 6/21/22.
//

#import "Movie.h"

@implementation Movie

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    self.title = dictionary[@"title"];
    self.overview = dictionary[@"overview"];
    self.releaseDate = dictionary[@"release_date"];
    
    NSString *baseURL = @"https://image.tmdb.org/t/p/w500";
    
    NSString *posterTailURL = dictionary[@"poster_path"];
    NSString *backdropTailURL = dictionary[@"backdrop_path"];

    NSString *posterPath = [baseURL stringByAppendingString:posterTailURL];
    NSString *backdropPath = [baseURL stringByAppendingString:backdropTailURL];

    NSURL *posterURL = [NSURL URLWithString:posterPath];
    NSURL *backdropURL = [NSURL URLWithString:backdropPath];
    
    self.posterUrl = posterURL;
    self.backdropUrl = backdropURL;
    
    return self;
}

+ (NSArray *)moviesWithDictionaries:(NSArray *)dictionaries {
    
    NSMutableArray* movies = [[NSMutableArray alloc] init];
    
    for (NSDictionary* dictionary in dictionaries) {
        Movie* movie = [[Movie alloc] initWithDictionary:dictionary];
        
        [movies addObject:movie];
    }
    
    return (NSArray *)movies;
}

@end
