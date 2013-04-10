//
//  ccDetailViewController.m
//  Clipboard
//
//  Created by William Cleeton on 4/9/13.
//  Copyright (c) 2013 muit. All rights reserved.
//

#import "ccDetailViewController.h"

@interface ccDetailViewController ()

@property (nonatomic, strong) UIPopoverController *masterPopoverController;
-(void)configureView;


@end

@implementation ccDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
    
    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
    /*
    //Init the GridView
    ccGridView *gridView = [[ccGridView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.gridView = gridView;
    
    //Init the Time Label
    self.gridView.timeLabel = gridView.timeLabel;
    
    gridView.owner = self;
    self.view = gridView;
     */
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self configureView];
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Back", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
    NSLog(@"button on");
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
