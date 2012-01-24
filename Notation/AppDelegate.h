//
//  AppDelegate.h
//  Notation
//
//  Created by Michał Jach on 23.01.2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet NSMenu *statusMenu;
    NSStatusItem *statusItem;
	NSImage *statusImage;
    NSImage *statusImage2;
	IBOutlet NSTextField *newInput;
}
- (IBAction)addNewItem:(id)sender;
- (IBAction)listener:(id)item;
- (IBAction)showNewWindow:(id)sender;
- (IBAction)closeWindow:(id)sender;

@property (assign) IBOutlet NSWindow *window;

@end
