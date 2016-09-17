//
//  DetailViewController.m
//  Homepwner
//
//  Created by Princess Sampson on 9/17/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import "DetailViewController.h"
#import "Item.h"
#import "ImageStore.h"

@interface DetailViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *serialField;
@property (strong, nonatomic) IBOutlet UITextField *valueField;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *deleteImageButton;

- (void)enableOrDisableDeleteImageButton;

@end

@implementation DetailViewController


- (IBAction)cameraButtonTapped:(UIBarButtonItem *)sender {
    UIImagePickerController *ipc = [UIImagePickerController new];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:^{
        [self enableOrDisableDeleteImageButton];
    }];
}
- (IBAction)deleteImageButtonTapped:(UIBarButtonItem *)sender {
    
    
    NSString *title = [NSString stringWithFormat:@"Remove %@'s picture?", self.item.name];
    
    UIAlertController *ac =[UIAlertController alertControllerWithTitle:title
                                                               message:@"Are you sure you want to remove this picture?"
                                                        preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    
    UIAlertAction *removeAction = [UIAlertAction actionWithTitle:@"Remove Image"
                                                           style:UIAlertActionStyleDestructive
                                                         handler:^(UIAlertAction *_Nonnull action){
                                                             self.imageView.image = nil;
                                                             [self.imageStore deleteImageForKey:self.item.itemKey];
                                                             [self enableOrDisableDeleteImageButton];
                                                         }];
    [ac addAction:cancelAction];
    [ac addAction:removeAction];
    
    [self presentViewController:ac animated:YES completion:nil];
    
}

- (IBAction)backgroundTapped:(UIGestureRecognizer *)sender {
    [self.view endEditing:YES];
}

- (void)enableOrDisableDeleteImageButton {
    if (self.imageView.image == nil) {
        self.deleteImageButton.enabled = NO;
    } else {
        self.deleteImageButton.enabled = YES;
    }
}

- (NSNumberFormatter*)valueFormatter {
    static NSNumberFormatter *formatter = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        formatter = [NSNumberFormatter new];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        formatter.minimumFractionDigits = 2;
        formatter.maximumFractionDigits = 2;
    });
    
    return formatter;
}

- (NSDateFormatter*)dateFormatter {
    static NSDateFormatter *formatter = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        formatter = [NSDateFormatter new];
        formatter.dateStyle = NSDateFormatterMediumStyle;
        formatter.timeStyle = NSDateFormatterNoStyle;
    });
    
    return formatter;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameField.text = self.item.name;
    self.serialField.text = self.item.serialNumber;
    self.valueField.text = [[self valueFormatter] stringFromNumber:@(self.item.valueInDollars)];
    self.dateLabel.text = [[self dateFormatter] stringFromDate:self.item.dateCreated];
    
    [self enableOrDisableDeleteImageButton];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.imageView.image = [self.imageStore imageForKey:self.item.itemKey];
    
    [self enableOrDisableDeleteImageButton];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
    
    self.item.name = self.nameField.text;
    self.item.serialNumber = self.serialField.text;
    NSNumber *numberInDollars = [[self valueFormatter] numberFromString:self.valueField.text];
    self.item.valueInDollars = numberInDollars.intValue;
}

- (void)setItem:(Item *)item {
    _item = item;
    self.navigationItem.title = item.name;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *image = (UIImage*)info[UIImagePickerControllerOriginalImage];
    
    if(image != nil) {
        [self.imageStore setImage:image forKey:self.item.itemKey];
        self.imageView.image = image;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
