//
//  DetailsViewController.h
//  Flixter
//
//  Created by Jocelyn Tseng on 6/15/22.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController

@property (nonatomic, strong) Movie *incomingData;

@end

NS_ASSUME_NONNULL_END
