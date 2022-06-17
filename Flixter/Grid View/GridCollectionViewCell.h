//
//  GridCollectionViewCell.h
//  Flixter
//
//  Created by Jocelyn Tseng on 6/16/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GridCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *posterImage;
@property (nonatomic, strong) NSDictionary *incomingData;

@end

NS_ASSUME_NONNULL_END
