//
//  SettingsViewController.m
//  Flixter
//
//  Created by Jocelyn Tseng on 6/16/22.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
<UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *numberPicker;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.numberPicker.delegate = self;
    self.numberPicker.dataSource = self;
//    self.numberPicker.showsSelectionIndicator = YES;
//    [self.view addSubview:self.numberPicker];
}

- (void)viewWillAppear:(BOOL)animated {
    
    NSUserDefaults *values = [NSUserDefaults standardUserDefaults];
    int selectedRow = [values integerForKey:@"which_row"];
    [self.numberPicker selectRow:selectedRow inComponent:0 animated:animated];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
     return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 3;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return [NSString stringWithFormat:@"%ld", row+2];
}

- (void)pickerView:(UIPickerView *)thePickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    
//    NSLog(@"SAVING: %ld is selected", row);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:row forKey:@"which_row"];
    [defaults synchronize];
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
