//
//  ViewController.m
//  AlghoWebviewIOS
//
//  Created by QuestIT on 10/06/22.
//

#import "ViewController.h"
#import "Commons.h"

@interface ViewController ()

@end

@implementation ViewController

NSString *currentUrl;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    currentUrl = URL_FE_N_TEXT;
    self.productURL = currentUrl;
    NSURL *url = [NSURL URLWithString:self.productURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    self.webView.navigationDelegate = (id <WKNavigationDelegate>)self;
    [self.webView loadRequest:request];
}

- (IBAction)showMenu:(id)sender {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil
                                   message:nil
                                   preferredStyle:UIAlertControllerStyleActionSheet];
     
    UIAlertAction* firstAction = [UIAlertAction actionWithTitle:@"1. Algho text" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {
        
        if(currentUrl != URL_FE_N_TEXT) {
            currentUrl = URL_FE_N_TEXT;
            self.productURL = currentUrl;
            NSURL *url = [NSURL URLWithString:self.productURL];
            NSURLRequest *request = [NSURLRequest requestWithURL:url];
            
            [self.webView loadRequest:request];
        }
        else {
            [self showToast:0];
        }
    }];
    
    UIAlertAction* secondAction = [UIAlertAction actionWithTitle:@"2. Algho voice" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {
        
        if(currentUrl != URL_FE_N_VOICE) {
            currentUrl = URL_FE_N_VOICE;
            self.productURL = currentUrl;
            NSURL *url = [NSURL URLWithString:self.productURL];
            NSURLRequest *request = [NSURLRequest requestWithURL:url];
            
            [self.webView loadRequest:request];
        }
        else {
            [self showToast:1];
        }
    }];
    
    UIAlertAction* thirdAction = [UIAlertAction actionWithTitle:@"3. Algho DHI" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {
        
        if(currentUrl != URL_FE_N_DHI) {
            currentUrl = URL_FE_N_DHI;
            self.productURL = currentUrl;
            NSURL *url = [NSURL URLWithString:self.productURL];
            NSURLRequest *request = [NSURLRequest requestWithURL:url];
            
            [self.webView loadRequest:request];
        }
        else {
            [self showToast:2];
        }
    }];
    
    UIAlertAction* infoAction = [UIAlertAction actionWithTitle:@"Info" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {
        
        [self showInfo];
    }];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive
       handler:nil];
     
    [alert addAction:firstAction];
    [alert addAction:secondAction];
    [alert addAction:thirdAction];
    [alert addAction:infoAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void) showToast:(int)param {
    
    NSString *message;
    if(param == 0) {
        message = @"You are already viewing Algho text";
    }
    else if(param == 1) {
        message = @"You are already viewing Algho voice";
    }
    else if(param == 2) {
        message = @"You are already viewing Algho DHI";
    }

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];

    [self presentViewController:alert animated:YES completion:nil];
    int duration = 2; // duration in seconds

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [alert dismissViewControllerAnimated:YES completion:nil];
    });
}

- (void) showInfo {
    
    NSString *message = @"Algho is powered by QuestIT.\nVisit www.quest-it.com";
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"Visit website" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {
        
        UIApplication *application = [UIApplication sharedApplication];
        NSURL *URL = [NSURL URLWithString:@"https://www.quest-it.com"];
        [application openURL:URL options:@{} completionHandler:^(BOOL success) {
            if (success) {
                 NSLog(@"Opened url");
            }
        }];
    }];
    [alert addAction:action];
    		
    [self presentViewController:alert animated:YES completion:nil];
}

@end
