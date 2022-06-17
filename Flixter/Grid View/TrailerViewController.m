//
//  TrailerViewController.m
//  Flixter
//
//  Created by Jocelyn Tseng on 6/17/22.
//

#import "TrailerViewController.h"
#import <WebKit/WebKit.h>
#import "UIKit+AFNetworking.h"

@interface TrailerViewController ()

@property (weak, nonatomic) IBOutlet WKWebView *trailerView;
@property (nonatomic, strong) NSArray *trailerInfo;
@property (weak, nonatomic) IBOutlet UINavigationItem *trailerNavBar;

@end

@implementation TrailerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.trailerNavBar.title = self.incomingData[@"title"];
    
    [self fetchData];
}

- (void)fetchData {
    
    NSString* urlID = self.incomingData[@"id"];
    
    NSString* rawURL = [NSString stringWithFormat:@"https://api.themoviedb.org/3/movie/%@/videos?api_key=afce5775823482bce9ebe26ae2a18553&language=en-US", urlID];
    NSURL *url = [NSURL URLWithString:rawURL];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
           if (error != nil) {
               NSLog(@"%@", [error localizedDescription]);
           }
           else {

               NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

               // Get array of videos and store into property
               self.trailerInfo = dataDictionary[@"results"];

               for (int i = 0; i < self.trailerInfo.count; i++) {

                   if ([self.trailerInfo[i][@"type"] isEqualToString:@"Trailer"]) {

                       NSString* key = self.trailerInfo[i][@"key"];

                       NSString* youtubeURL = @"https://www.youtube.com/watch?v=";
                       NSString* entireURL = [youtubeURL stringByAppendingString:key];

                       NSURL *mediaURL = [NSURL URLWithString:entireURL];

                       NSURLRequest *request = [NSURLRequest requestWithURL:mediaURL];
                       [self.trailerView loadRequest:request];

                       break;
                   }
               }
           }
    }];
    [task resume];
}

@end
