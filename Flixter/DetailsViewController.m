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
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%@", self.incomingData);
    
    self.titleLabel.text = self.incomingData[@"original_title"];
    self.dateLabel.text = self.incomingData[@"release_date"];
//    self.ratingLabel.text = NSLog(self.incomingData[@"vote_average"]);
    self.synopsisLabel.text = self.incomingData[@"overview"];
    
    NSString *baseURL = @"https://image.tmdb.org/t/p/w500";
    
    NSString *posterTailURL = self.incomingData[@"poster_path"];
    NSString *backdropTailURL = self.incomingData[@"backdrop_path"];

    NSString *posterPath = [baseURL stringByAppendingString:posterTailURL];
    NSString *backdropPath = [baseURL stringByAppendingString:backdropTailURL];

    NSURL *posterURL = [NSURL URLWithString:posterPath];
    NSURL *backdropURL = [NSURL URLWithString:backdropPath];

    [self.posterImage setImageWithURL:posterURL];
    [self.backgroundImage setImageWithURL:backdropURL];
    
    
//    NSLog(self.titleLabel.text);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
