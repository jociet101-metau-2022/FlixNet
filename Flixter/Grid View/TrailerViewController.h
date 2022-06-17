//
//  TrailerViewController.h
//  Flixter
//
//  Created by Jocelyn Tseng on 6/17/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TrailerViewController : UIViewController

@property (nonatomic, strong) NSDictionary *incomingData;

@end

NS_ASSUME_NONNULL_END


// https://api.themoviedb.org/3/movie/{movie_id}/videos?api_key=<<api_key>>&language=en-US
