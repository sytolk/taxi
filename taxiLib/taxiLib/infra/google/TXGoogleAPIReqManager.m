//
//  TXGoogleAPIReqManager.m
//  taxiLib
//
//  Created by Irakli Vashakidze on 3/19/14.
//  Copyright (c) 2014 99S. All rights reserved.
//

#import "TXGoogleAPIReqManager.h"
#import "TXApp.h"
#import "StrConsts.h"

static NSString* const GOOGLE_API_PLACES_NEARBYSEARCH = @"PlacesNearbySearch";
static NSString* const GOOGLE_API_PLACES_TEXTSEARCH   = @"PlacesTextSearch";
static NSString* const GOOGLE_API_PLACES_RADARSEARCH  = @"PlacesRadarSearch";
static NSString* const GOOGLE_API_PLACES_AUTOCOMPLETE = @"PlacesAutocomplete";

static NSString* const GOOGLE_KEY = @"AIzaSyA-mIDdBQDMjxoQ59UOpYnyqa0ogk9m7-M";

@interface TXGoogleAPIReqManager() {
    TXHttpRequestManager      *httpMgr;
    id<TXHttpRequestListener> listener;
}

@end

@implementation TXGoogleAPIReqManager

-(id)initWithListener:(id<TXHttpRequestListener>) listener_ {
    
    if(self = [super init]) {
        self->httpMgr  = [TXHttpRequestManager instance];
        self->listener = listener_;
    }
    
    return self;
}

-(BOOL) sendPlaceNearbySearchRequest:(NSString *) location radius:(NSString *)radius sensor:(BOOL) sensor rankBy:(NSString *)rankBy optional:(NSString *) parameters {

    if(location.length!=0 && radius.length!=0 && rankBy.length!=0) {
    
        NSMutableString *params = [NSMutableString stringWithFormat:@"key=%@", GOOGLE_KEY];
        [params appendFormat:@"&location=%@", location];
        [params appendFormat:@"&radius=%@", radius];
        [params appendFormat:@"&sensor=%@", (sensor == YES ? @"true" : @"false")];
        [params appendFormat:@"&rankby=%@", rankBy];
        
        if(parameters.length!=0) {
            [params appendFormat:@"&%@", parameters];
        }
        
        TXRequestObj* request = [TXRequestObj create:GOOGLE_API_PLACES_NEARBYSEARCH urlParams:params listener:self->listener];
        return [self sendAsyncRequest:request];
        
    } else {
        
        return NO;
        
    }
    
}

-(BOOL) sendPlaceAutocompleteRequest:(NSString *) input sensor:(BOOL) sensor optional:(NSString *) parameters {
    
    if(input.length!=0) {
        
        NSMutableString *params = [NSMutableString stringWithFormat:@"key=%@", GOOGLE_KEY];
        [params appendFormat:@"&input=%@", input];
        [params appendFormat:@"&sensor=%@", (sensor == YES ? @"true" : @"false")];
        
        if(parameters.length!=0) {
            [params appendFormat:@"&%@", parameters];
        }
        
        TXRequestObj* request = [TXRequestObj create:GOOGLE_API_PLACES_AUTOCOMPLETE urlParams:params listener:self->listener];
        return [self sendAsyncRequest:request];
        
    } else {
        
        return NO;
        
    }
    
}

-(BOOL) sendPlaceTextSearchRequest:(NSString *) query sensor:(BOOL) sensor optional:(NSString *) parameters {
    
    if(query.length!=0) {
        
        NSMutableString *params = [NSMutableString stringWithFormat:@"key=%@", GOOGLE_KEY];
        [params appendFormat:@"&query=%@", query];
        [params appendFormat:@"&sensor=%@", (sensor == YES ? @"true" : @"false")];
        
        if(parameters.length!=0) {
            [params appendFormat:@"&%@", parameters];
        }
        
        TXRequestObj* request = [TXRequestObj create:GOOGLE_API_PLACES_TEXTSEARCH urlParams:params listener:self->listener];
        return [self sendAsyncRequest:request];
        
    } else {
        
        return NO;
        
    }
    
}

-(BOOL) sendPlaceRadarSearchRequest:(NSString *) location radius:(NSString *)radius sensor:(BOOL) sensor optional:(NSString *) parameters {
    
    if(location.length!=0 && radius.length!=0) {
        
        NSMutableString *params = [NSMutableString stringWithFormat:@"key=%@", GOOGLE_KEY];
        [params appendFormat:@"&location=%@", location];
        [params appendFormat:@"&radius=%@", radius];
        [params appendFormat:@"&sensor=%@", (sensor == YES ? @"true" : @"false")];
        
        if(parameters.length!=0) {
            [params appendFormat:@"&%@", parameters];
        }
        
        TXRequestObj* request = [TXRequestObj create:GOOGLE_API_PLACES_RADARSEARCH urlParams:params listener:self->listener];
        return [self sendAsyncRequest:request];
        
    } else {
        
        return NO;
        
    }
    
}

-(BOOL) sendAsyncRequest:(TXRequestObj *) request {
   return [self->httpMgr sendAsyncRequest:request];
}

@end
