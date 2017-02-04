//
//  ViewController.m
//  PeerReview03
//
//  Created by wangyunwen on 17/2/3.
//  Copyright © 2017年 wangyunwen. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"


@interface ViewController () <CRCurrencyRequestDelegate>
@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *currencyA;
@property (weak, nonatomic) IBOutlet UILabel *currencyB;
@property (weak, nonatomic) IBOutlet UILabel *currencyC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonTapped:(id)sender {
    self.convertButton.enabled = NO;
    
    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];
    
//    self.currencyA.text = @"A";
//    self.currencyB.text = @"B";
//    self.currencyC.text = @"C";
    self.convertButton.enabled = YES;
}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies {
    self.convertButton.enabled = YES;
    
    double inputValue = [self.inputField.text floatValue];
    
    double euroValue = inputValue * currencies.EUR;
    double jpyValue = inputValue * currencies.JPY;
    double gbpValue = inputValue * currencies.GBP;
    
    NSString *eurString = [NSString stringWithFormat:@"%.2f", euroValue];
    NSString *jpyString = [NSString stringWithFormat:@"%.2f", jpyValue];
    NSString *gbpString = [NSString stringWithFormat:@"%.2f", gbpValue];
    
    self.currencyA.text = eurString;
    self.currencyB.text = jpyString;
    self.currencyC.text = gbpString;
}


@end
