//
//  AddViewController.m
//  KMCoreData
//
//  Created by Mrunalini on 07/11/16.
//  Copyright © 2016 Karishma Mahajan. All rights reserved.
//

#import "AddViewController.h"
#import "AppDelegate.h"

@interface AddViewController ()

@end

@implementation AddViewController

-(NSManagedObjectContext *)managedObjectContext {
    
    NSManagedObjectContext *context = nil;
    
    id delegate = [[UIApplication sharedApplication]delegate];
    
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        
        context = [delegate managedObjectContext];
    }
    return context;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    if (textField == self.firstTextField) {
        [self.firstTextField resignFirstResponder];
        
    }
    else if (textField == self.thirdTextField) {
        
        [self.thirdTextField resignFirstResponder];
    }
    
    
    return YES;
    
}


- (IBAction)segmentSecond:(id)sender {
    localSegment = sender;
    
    if (localSegment.selectedSegmentIndex == 0) {
        
        [self.thirdTextField setHidden:NO];
        
        [_firstTextField setPlaceholder:@"Enter Model:"];
        
        [_secondTextField setPlaceholder:@"Enter Price:"];
        
        [_thirdTextField setPlaceholder:@"Enter Year:"];
        
        
        [self actionSave:sender];
    }
    else if (localSegment.selectedSegmentIndex == 1) {
        
        [self.thirdTextField setHidden:NO];
        
        [_firstTextField setPlaceholder:@"Enter Name:"];
        
        [_secondTextField setPlaceholder:@"Enter Company:"];
        
        [_thirdTextField setPlaceholder:@"Enter Price:"];
        
        [self actionSave:sender];
    }
    else if (localSegment.selectedSegmentIndex == 2) {
        
        [self.thirdTextField setHidden:YES];
        
        
        [_firstTextField setPlaceholder:@"Enter Model:"];
        
        [_secondTextField setPlaceholder:@"Enter Price:"];
        
        
        [self actionSave:sender];
    }
}

- (IBAction)actionSave:(id)sender {
    
    NSString *firstField = self.firstTextField.text;
    
    NSString *secondField = self.secondTextField.text;
    
    NSString *thirdField = self.thirdTextField.text;
    
    if (localSegment.selectedSegmentIndex == 0) {
        
        if (firstField.length > 0) {
            
            if (secondField.length >0) {
                
                if (thirdField.length>0) {
                    
                    
                    NSManagedObjectContext *context = [self managedObjectContext];
                    
                    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"TV" inManagedObjectContext:context];
                    
                    [newDevice setValue:firstField forKey:@"model"];
                    
                    [newDevice setValue:secondField forKey:@"price"];
                    
                    [newDevice setValue:thirdField forKey:@"year"];
                    
                    
                    NSError *error;
                    
                    if ([context save:&error]) {
                        
                        NSLog(@"Saved");
                        
                        //   [self alertWithTitle:@"Saved!" message:@""];
                        
                        [self.navigationController popViewControllerAnimated:YES];
                    }
                    else{
                        NSLog(@"Unable to save : %@",error.localizedDescription);
                        
                        // [self alertWithTitle:@"Unable to Save!" message:@"Please Try Again"];
                        
                        
                    }
                }
            }
        }
    }
    if (localSegment.selectedSegmentIndex == 1) {
        
        if (firstField.length > 0) {
            
            if (secondField.length >0) {
                
                if (thirdField.length>0) {
                    
                    
                    NSManagedObjectContext *context = [self managedObjectContext];
                    
                    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"SmartPhone" inManagedObjectContext:context];
                    
                    [newDevice setValue:firstField forKey:@"name"];
                    
                    [newDevice setValue:secondField forKey:@"company"];
                    
                    [newDevice setValue:thirdField forKey:@"price"];
                    
                    NSError *error;
                    
                    if ([context save:&error]) {
                        
                        NSLog(@"Saved");
                        
                        //  [self alertWithTitle:@"Saved!" message:@""];
                        
                        [self.navigationController popViewControllerAnimated:YES];
                    }
                    else{
                        NSLog(@"Unable to save : %@",error.localizedDescription);
                        
                        // [self alertWithTitle:@"Unable to Save!" message:@"Please Try Again"];
                        
                        
                    }
                }
            }
        }
    }
    if (localSegment.selectedSegmentIndex == 2) {
        
        if (firstField.length > 0) {
            
            if (secondField.length >0) {
                
                
                NSManagedObjectContext *context = [self managedObjectContext];
                
                NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"AC" inManagedObjectContext:context];
                
                [newDevice setValue:firstField forKey:@"model"];
                
                [newDevice setValue:secondField forKey:@"price"];
                
                
                
                NSError *error;
                
                if ([context save:&error]) {
                    
                    NSLog(@"Saved");
                    
                    //         [self alertWithTitle:@"Saved!" message:@""];
                    
                    
                    [self.navigationController popViewControllerAnimated:YES];
                }
                else{
                    NSLog(@"Unable to save : %@",error.localizedDescription);
                    
                    // [self alertWithTitle:@"Unable to Save!" message:@"Please Try Again"];
                    
                    
                }
            }
        }
    }

}

- (IBAction)actionCancel:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

-(void)alertWithTitle: (NSString *)title message:(NSString *)message {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *OK =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        [self dismissViewControllerAnimated:YES completion:nil];
        [self viewDidLoad];
    }];
    
    [alert addAction:OK];
    
    
    [self presentViewController:alert animated:YES completion:nil];
    
}
@end
