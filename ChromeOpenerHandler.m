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
	// if ([url.scheme isEqualToString:@"http"]) {
	// 	NSURLComponents *components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
	// 	components.scheme = inUseSecure ? @"http" : @"googlechrome";
	// 	return components.URL;
	// }

	if ([url.host isEqualToString:@"hbang.ws"]) {
		return [NSURL URLWithString:[NSString stringWithFormat:@"hbang://open%@", url.path]];
	}

	return nil;
}

@end