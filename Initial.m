#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property NSString *name;
@property NSString *phone;
@property NSString *email;

- (instancetype)initWithName:(NSString *)name
                        phone:(NSString *)phone
                        email:(NSString *)email;

@end

@implementation Contact

- (instancetype)initWithName:(NSString *)name
                        phone:(NSString *)phone
                        email:(NSString *)email {
    self = [super init];

    if (self) {
        _name = name;
        _phone = phone;
        _email = email;
    }

    return self;
}

@end

@interface ContactManager : NSObject

@property NSMutableArray<Contact *> *contacts;

- (void)addContact:(Contact *)contact;
- (void)search:(NSString *)query;
- (void)showAll;

@end

@implementation ContactManager

- (instancetype)init {
    self = [super init];

    if (self) {
        _contacts = [NSMutableArray array];
    }

    return self;
}

- (void)addContact:(Contact *)contact {
    [self.contacts addObject:contact];
}

- (void)search:(NSString *)query {
    NSLog(@"Search results:");

    for (Contact *contact in self.contacts) {
        if ([contact.name localizedCaseInsensitiveContainsString:query]) {
            NSLog(@"%@ | %@ | %@", contact.name, contact.phone, contact.email);
        }
    }
}

- (void)showAll {
    NSLog(@"Contacts");
    NSLog(@"=========");

    for (Contact *contact in self.contacts) {
        NSLog(@"%@ | %@ | %@", contact.name, contact.phone, contact.email);
    }
}

@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        ContactManager *manager = [[ContactManager alloc] init];

        [manager addContact:[[Contact alloc]
            initWithName:@"Alex Johnson"
            phone:@"+1 555 0101"
            email:@"alex@example.com"]];

        [manager addContact:[[Contact alloc]
            initWithName:@"Sarah Miller"
            phone:@"+1 555 0102"
            email:@"sarah@example.com"]];

        [manager addContact:[[Contact alloc]
            initWithName:@"Michael Brown"
            phone:@"+1 555 0103"
            email:@"michael@example.com"]];

        [manager showAll];
        NSLog(@"");
        [manager search:@"sarah"];
    }

    return 0;
}