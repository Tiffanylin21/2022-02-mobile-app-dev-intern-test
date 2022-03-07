//
//  CPP-Wrapper.metal
//  tasked
//
//  Created by Tiffany Lin on 7/3/22.
//

#import "CPP-Wrapper.h"
#include "daily_quote.hpp"
@implementation CPP_Wrapper
- (NSString *)hello_cpp_wrapped {
    DailyQuote dailyquote;
    std::string str = dailyquote.Get();
    NSString *stringinObjC = [NSString stringWithCString:str.c_str()
                                encoding:[NSString defaultCStringEncoding]];
    return stringinObjC;
}
@end


