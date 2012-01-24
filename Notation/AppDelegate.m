//
//  AppDelegate.m
//  Notation
//
//  Created by Michał Jach on 23.01.2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
NSInteger numberNotes = 0;

@synthesize window = _window;

-(void)applicationDidFinishLaunching:(NSNotification *)aNotification{
    // Insert code here to initialize your application
}
-(void)awakeFromNib{
	NSString* numberNotes_str = [NSString stringWithFormat:@"%d", numberNotes];
	NSBundle *bundle = [NSBundle mainBundle];
	statusImage = [[NSImage alloc] initWithContentsOfFile: [bundle pathForResource: @"statusimg" ofType: @"png"]];
	statusImage2 = [[NSImage alloc] initWithContentsOfFile: [bundle pathForResource: @"statusimg2" ofType: @"png"]];
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [statusItem setMenu:statusMenu];
	[statusItem setTitle:numberNotes_str];
	[statusItem setImage:statusImage];
    [statusItem setAlternateImage: statusImage2];
	[statusItem setHighlightMode:YES];
}

-(IBAction)addNewItem:(id)sender{
    NSMenuItem *newItem = [[NSMenuItem alloc] initWithTitle:[newInput stringValue] action:@selector(listener:) keyEquivalent:@""];
	[newItem setImage:statusImage];
	[newItem setState:NSOffState];
	[newItem setEnabled:YES];
	if([statusMenu numberOfItems]==4){
		[statusMenu insertItem:[NSMenuItem separatorItem] atIndex:2];
	}
	[statusMenu insertItem:newItem atIndex:numberNotes+2];
    numberNotes++;
    NSString* conv1 = [NSString stringWithFormat:@"%d", numberNotes];
	[statusItem setTitle:conv1];
	[newInput setStringValue:@""];
	[_window orderOut:sender];

}
-(IBAction) listener:(id)item{
	NSInteger myIndex = [statusMenu indexOfItem:item];
	if([[statusMenu itemAtIndex:myIndex] state]==NSOnState){
		[[statusMenu itemAtIndex:myIndex] setState:NSOffState];
		numberNotes++;
		NSString* myNewString3 = [NSString stringWithFormat:@"%d", numberNotes];
		[statusItem setTitle:myNewString3];
	}
	else
	{
		numberNotes--;
		[[statusMenu itemAtIndex:myIndex] setState:NSOnState];
		NSString* myNewString3 = [NSString stringWithFormat:@"%d", numberNotes];
		[statusItem setTitle:myNewString3];
	}
}
-(IBAction) showNewWindow:(id)sender{
	[_window orderFront:sender];
	[_window makeKeyWindow];
	[_window setLevel:NSFloatingWindowLevel];
    [newInput setTarget:self];
    [newInput setAction:@selector(addNewItem:)];
}

-(IBAction)closeWindow:(id)sender{
    [_window orderOut:sender];
}
@end
