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
	return nil;
}

@end