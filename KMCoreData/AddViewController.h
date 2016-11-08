//
//  AddViewController.h
//  KMCoreData
//
//  Created by Mrunalini on 07/11/16.
//  Copyright © 2016 Karishma Mahajan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController<UITextFieldDelegate>

{
    UISegmentedControl *localSegment;
    
}
@property (strong, nonatomic) IBOutlet UITextField *firstTextField;
@property (strong, nonatomic) IBOutlet UITextField *secondTextField;
@property (strong, nonatomic) IBOutlet UITextField *thirdTextField;
- (IBAction)segmentSecond:(id)sender;
- (IBAction)actionSave:(id)sender;

- (IBAction)actionCancel:(id)sender;
@end
