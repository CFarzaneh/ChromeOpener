#import "ChromeOpenerHandler.h"

@implementation ChromeOpenerHandler

- (instancetype)init {
	self = [super init];

	if (self) {
		self.name = @"ChromeOpener";
		self.identifier = @"com.cfarzaneh.chromeopener";
	}

	return self;
}

- (id)openURL:(NSURL *)url sender:(NSString *)sender {

	NSString *linkOpenerPlistPath = @"/var/mobile/Library/Preferences/org.thebigboss.linkopener.plist";

    if ([[NSFileManager defaultManager] fileExistsAtPath:linkOpenerPlistPath]) {

        NSDictionary *myDict = [[NSDictionary alloc] initWithContentsOfFile:linkOpenerPlistPath];
        BOOL isEnabled = [[myDict objectForKey:@"Enabled"] boolValue];
        
        if (isEnabled == true) {
            if (!([url.host isEqualToString:@"twitter.com"] || [url.host isEqualToString:@"mobile.twitter.com"] || 
            	[url.host isEqualToString:@"m.twitter.com"] || [url.host isEqualToString:@"www.facebook.com"] || 
            	[url.host isEqualToString:@"facebook.com"] || [url.host isEqualToString:@"fb.com"] ||
            	[url.host isEqualToString:@"imdb.com"] || [url.host isEqualToString:@"www.imdb.com"] ||
            	[url.host hasPrefix:@"ebay.co"] || [url.host hasPrefix:@"www.ebay.co"] ||
            	[url.host isEqualToString:@"cydia.saurik.com"] || 
            	[url.host isEqualToString:@"github.com"] || [url.host isEqualToString:@"gist.github.com"] || 
            	(([url.host isEqualToString:@"reddit.com"] || [url.host hasSuffix:@".reddit.com"]) && ([url.pathComponents containsObject:@"comments"] || url.pathComponents.count == 3)) || [url.host isEqualToString:@"redd.it"] || 
            	[url.host hasSuffix:@".tumblr.com"] || [url.host isEqualToString:@"vine.co"] || [url.host isEqualToString:@"instagram.com"] || [url.host isEqualToString:@"www.instagram.com"] ||
            	[url.host isEqualToString:@"dict.cc"] || [url.host hasSuffix:@".dict.cc"] || [url.host isEqualToString:@"yelp.com"] || [url.host isEqualToString:@"www.yelp.com"] || 
            	[url.host isEqualToString:@"overcast.fm"])) {

					if ([url.scheme isEqualToString:@"http"]) {
						NSURLComponents *components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
						components.scheme = @"googlechrome";
						return components.URL;
					} 
					else if ([url.scheme isEqualToString:@"https"]) {
						NSURLComponents *components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
						components.scheme = @"googlechromes";
						return components.URL;
					}
            }
        }
        else {
			if ([url.scheme isEqualToString:@"http"]) {
				NSURLComponents *components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
				components.scheme = @"googlechrome";
				return components.URL;
			} 
			else if ([url.scheme isEqualToString:@"https"]) {
				NSURLComponents *components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
				components.scheme = @"googlechromes";
				return components.URL;
			}
        }
    } //LinkOpener has been installed
	else {
		if ([url.scheme isEqualToString:@"http"]) {
			NSURLComponents *components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
			components.scheme = @"googlechrome";
			return components.URL;
		} 
		else if ([url.scheme isEqualToString:@"https"]) {
			NSURLComponents *components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
			components.scheme = @"googlechromes";
			return components.URL;
		}
	} //LinkOpener not installed

	return nil;
}

@end