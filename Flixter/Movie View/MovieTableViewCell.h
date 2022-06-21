//
//  MovieTableViewCell.h
//  Flixter
//
//  Created by Jocelyn Tseng on 6/15/22.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterImage;

@property (nonatomic, strong) Movie *movie;

@end

NS_ASSUME_NONNULL_END
