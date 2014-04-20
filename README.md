CCLabelTTF with Line Height (Spacing) for Cocos2D 2.1
====================


This is a `CCLayer` subclass that basicly serves one purpouse: defining the line height for CCLabelTTF Fields.

The first Version was kindly created by [Hardschool](http://stackoverflow.com/users/1040805/hardschool) on stackoverflow.

Here is a Code Example:

	CCLabelTTFLineSpaced * myText = [CCLabelTTFLineSpaced labelWithString:@"Hello" dimensions:CGSizeMake(230,70) hAlignment:kCCTextAlignmentLeft fontName:@"Helvetica" fontSize:9 lineSpace:11];
	 
	[myText setColor:ccBLACK];	
	myText.opacity = 255 * 0.5;
	 
	 
	 
I also added a method that allows you to fade the opacity like this:

	[myText fadeTo:255*0.8 withDuration:0.8 withDelay:0.8];


I was testing this on iOS 7.1 and iOS 6.1 and it works great ;)

It's written without ARC so dont forget to set the `-fno-objc-arc` flag.

Feel free to send me any merge requests if you have some improvements.

thanks

