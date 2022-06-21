//
//  MovieTableViewCell.m
//  Flixter
//
//  Created by Jocelyn Tseng on 6/15/22.
//

#import "MovieTableViewCell.h"
#import "UIKit+AFNetworking.h"

@implementation MovieTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setMovie:(Movie *)movie {
    
    _movie = movie;
    
    self.titleLabel.text = self.movie.title;
    self.synopsisLabel.text = self.movie.overview;
    
    NSURL *posterURL = self.movie.posterUrl;
    [self.posterImage setImageWithURL:posterURL];
}

@end
