//
//  GridViewController.m
//  Flixter
//
//  Created by Jocelyn Tseng on 6/16/22.
//

#import "GridViewController.h"
#import "GridCollectionViewCell.h"
#import "UIImageView+AFNetworking.h"

@interface GridViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray *movies;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation GridViewController

int selectedRow = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    [self fetchData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSUserDefaults *values = [NSUserDefaults standardUserDefaults];
    selectedRow = [values integerForKey:@"which_row"];
    
//    NSLog(@"RETRIEVING: %ld is selected", selectedRow);
    
}

- (void)fetchData {
    
    NSURL *url = [NSURL URLWithString:@"https://api.themoviedb.org/3/movie/now_playing?api_key=afce5775823482bce9ebe26ae2a18553"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
           if (error != nil) {
               NSLog(@"%@", [error localizedDescription]);
           }
           else {
               NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
               
               // Get array of movies and store into property
               self.movies = dataDictionary[@"results"];
               
               // reload your table view data
               [self.collectionView reloadData];
           }
                    
       }];
    [task resume];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    GridCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GridCell" forIndexPath:indexPath];
    
    NSString *baseURL = @"https://image.tmdb.org/t/p/w500";
    NSString *tailURL = self.movies[indexPath.row][@"poster_path"];
    
    NSString *imagePath = [baseURL stringByAppendingString:tailURL];
    NSURL *posterURL = [NSURL URLWithString:imagePath];
        
    [cell.posterImage setImageWithURL:posterURL];
    
    CGRect viewFrame = cell.frame;
    CGRect imageFrame = cell.posterImage.frame;
    
//    NSLog(self.movies[indexPath.row][@"title"]);
//    NSLog(@"selected row = %d", selectedRow);
        
    switch(selectedRow) {
        case 0:
            viewFrame.size = CGSizeMake(190, 260);
            imageFrame.size = CGSizeMake(190, 260);
            break;
        case 1:
            viewFrame.size = CGSizeMake(120, 160);
            imageFrame.size = CGSizeMake(120, 160);
            break;
        case 2:
            viewFrame.size = CGSizeMake(90, 135);
            imageFrame.size = CGSizeMake(90, 135);
            break;
    }
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.movies.count;
}

- (IBAction)pressSettings:(id)sender {
    [self performSegueWithIdentifier:@"SettingsSegue" sender:self];
}


//- (CGFloat)collectionView:

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    GridCollectionViewCell *cell = sender;
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    
    NSDictionary *data = self.movies[indexPath.row];
    GridCollectionViewCell *gridVC = [segue destinationViewController];
    gridVC.incomingData = data;
}

@end
