#import "MessageBuilder.h"
#import "SwiftExample-Swift.h"

@implementation MessageBuilder

-(NSString *)getPersonalizedMessageForName:(NSString*)name {
    Messages *messages = [[Messages alloc] init];
    
    NSString *retString = [NSString stringWithFormat:@"To: %@, %@",name, [messages getMessage]];
    return retString;
}
@end
