//
//  DetailViewController.m
//  CKPageGuider
//
//  Created by 仇弘扬 on 16/3/16.
//  Copyright © 2016年 仇弘扬. All rights reserved.
//

#import "DetailViewController.h"
#import "CKPageGuider.h"
#import "CKBracketView.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet CKBracketView *bracketView;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self showPageGuider];
}

- (void)showPageGuider
{
    CKPageGuider *guider = [CKPageGuider guiderWithIdentifier:@"DetailViewController2" oldIdentifier:nil];
    
    CKPageScene *scene = [CKPageScene new];
    CKNormalAction *action = [CKNormalAction actionWithFocusView:self.detailDescriptionLabel direction:CKPageActionDirectionDown description:@"Test\nHello World!"];
    action.leftOffset = 20;
    action.cornerRadius = 3;
    action.lineLength = 10;
    action.margin = UIEdgeInsetsMake(5, 5, 10, 5);
    [scene addAction:action];
    [guider addScene:scene];
    
    CKPageScene *frameScene = [CKPageScene new];
    CKNormalAction *action1 = [CKNormalAction actionWithFocusRect:CGRectMake(40, 40, 80, 80) direction:CKPageActionDirectionRight description:@"Hello iOS!"];
    action1.topOffset = 5;
    action1.lineLength = 100;
    [frameScene addAction:action1];
    
    [frameScene addAction:[CKNormalAction actionWithFocusView:self.detailDescriptionLabel direction:CKPageActionDirectionDown description:@"Test\nHello World!"]];
    
    
    
    [frameScene addAction:[CKToastAction actionWithImage:[UIImage imageNamed:@"pic_shoushishangxiahuadong"] description:@"上下翻动" center:CGPointMake([UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height - 80 - 100)]];
    
    [guider addScene:frameScene];
    
    CKPageScene *customViewScene = [CKPageScene new];
    CKNormalAction *action2 = [CKNormalAction actionWithFocusRect:CGRectMake(300, 40, 80, 80) direction:CKPageActionDirectionLeft description:@"Hello iOS!"];
    action2.lineLength = 100;
    CKNormalAction *action3 = [CKNormalAction actionWithFocusView:self.bracketView direction:CKPageActionDirectionUp description:@"Test"];
    action3.lineLength = 10;
    [customViewScene addAction:action3];
    [customViewScene addAction:action2];
    
    [customViewScene addAction:[CKToastAction actionWithImage:[UIImage imageNamed:@"pic_shoushipingyi"] description:@"左右切换" center:CGPointMake([UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height - 80 - 50)]];
    
    [guider addScene:customViewScene];
    
    [guider show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
