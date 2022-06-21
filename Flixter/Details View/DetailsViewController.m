//
//  DetailsViewController.m
//  Flixter
//
//  Created by Jocelyn Tseng on 6/15/22.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"

@interface DetailsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *posterImage;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set labels to corresponding text
    self.titleLabel.text = self.incomingData.title;
    self.dateLabel.text = self.incomingData.releaseDate;
    self.synopsisLabel.text = self.incomingData.overview;
    
    // Configure the image paths for backdrop and poster
    NSURL *posterURL = self.incomingData.posterUrl;
    NSURL *backdropURL = self.incomingData.backdropUrl;
    
    // Assign the images to the image view object
    [self.posterImage setImageWithURL:posterURL];
    [self.backgroundImage setImageWithURL:backdropURL];
}

@end
