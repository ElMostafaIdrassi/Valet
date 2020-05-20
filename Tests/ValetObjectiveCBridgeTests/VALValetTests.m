//  Created by Dan Federman on 1/16/20.
//  Copyright © 2020 Square, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

#import <Valet/Valet.h>
#import <XCTest/XCTest.h>

@interface VALValetTests : XCTestCase
@end

@implementation VALValetTests

- (NSString *)identifier;
{
    return @"identifier";
}

- (NSString *)appIDPrefix;
{
    return @"9XUJ7M53NG";
}

- (NSString *)sharedAccessGroupIdentifier;
{
#if TARGET_OS_IPHONE
    return @"com.squareup.Valet-iOS-Test-Host-App";
#elif TARGET_OS_WATCH
    return @"com.squareup.ValetTouchIDTestApp.watchkitapp.watchkitextension";
#elif TARGET_OS_MAC
    return @"com.squareup.Valet-macOS-Test-Host-App";
#else
    // This will fail
    return @"";
#endif
}

- (BOOL)testEnvironmentIsSigned;
{
    return NSBundle.mainBundle.bundleIdentifier != nil && ![NSBundle.mainBundle.bundleIdentifier isEqualToString:@"com.apple.dt.xctest.tool"];
}

- (void)test_valetWithIdentifier_accessibility_returnsCorrectValet_VALAccessibilityWhenUnlocked;
{
    VALValet *const valet = [VALValet valetWithIdentifier:self.identifier accessibility:VALAccessibilityWhenUnlocked];
    XCTAssertEqual(valet.accessibility, VALAccessibilityWhenUnlocked);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_valetWithIdentifier_accessibility_returnsCorrectValet_VALAccessibilityAfterFirstUnlock;
{
    VALValet *const valet = [VALValet valetWithIdentifier:self.identifier accessibility:VALAccessibilityAfterFirstUnlock];
    XCTAssertEqual(valet.accessibility, VALAccessibilityAfterFirstUnlock);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_valetWithIdentifier_accessibility_returnsCorrectValet_VALAccessibilityWhenPasscodeSetThisDeviceOnly;
{
    VALValet *const valet = [VALValet valetWithIdentifier:self.identifier accessibility:VALAccessibilityWhenPasscodeSetThisDeviceOnly];
    XCTAssertEqual(valet.accessibility, VALAccessibilityWhenPasscodeSetThisDeviceOnly);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_valetWithIdentifier_accessibility_returnsCorrectValet_VALAccessibilityWhenUnlockedThisDeviceOnly;
{
    VALValet *const valet = [VALValet valetWithIdentifier:self.identifier accessibility:VALAccessibilityWhenUnlockedThisDeviceOnly];
    XCTAssertEqual(valet.accessibility, VALAccessibilityWhenUnlockedThisDeviceOnly);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_valetWithIdentifier_accessibility_returnsCorrectValet_VALAccessibilityAfterFirstUnlockThisDeviceOnly;
{
    VALValet *const valet = [VALValet valetWithIdentifier:self.identifier accessibility:VALAccessibilityAfterFirstUnlockThisDeviceOnly];
    XCTAssertEqual(valet.accessibility, VALAccessibilityAfterFirstUnlockThisDeviceOnly);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_valetWithIdentifier_accessibility_returnsNilWhenIdentifierIsEmpty;
{
    VALValet *const valet = [VALValet valetWithIdentifier:@"" accessibility:VALAccessibilityAfterFirstUnlockThisDeviceOnly];
    XCTAssertNil(valet);
}

- (void)test_iCloudValetWithIdentifier_accessibility_returnsCorrectValet_VALCloudAccessibilityWhenUnlocked;
{
    VALValet *const valet = [VALValet iCloudValetWithIdentifier:self.identifier accessibility:VALCloudAccessibilityWhenUnlocked];
    XCTAssertEqual(valet.accessibility, VALAccessibilityWhenUnlocked);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_iCloudValetWithIdentifier_accessibility_returnsCorrectValet_VALCloudAccessibilityAfterFirstUnlock;
{
    VALValet *const valet = [VALValet iCloudValetWithIdentifier:self.identifier accessibility:VALCloudAccessibilityAfterFirstUnlock];
    XCTAssertEqual(valet.accessibility, VALAccessibilityAfterFirstUnlock);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_iCloudValetWithIdentifier_accessibility_returnsNilWhenIdentifierIsEmpty;
{
    VALValet *const valet = [VALValet iCloudValetWithIdentifier:@"" accessibility:VALCloudAccessibilityAfterFirstUnlock];
    XCTAssertNil(valet);
}

- (void)test_valetWithSharedAccessGroupIdentifier_accessibility_returnsCorrectValet_VALAccessibilityWhenUnlocked;
{
    VALValet *const valet = [VALValet sharedAccessGroupValetWithAppIDPrefix:self.appIDPrefix sharedAccessGroupIdentifier:self.sharedAccessGroupIdentifier accessibility:VALAccessibilityWhenUnlocked];
    XCTAssertEqual(valet.accessibility, VALAccessibilityWhenUnlocked);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_valetWithSharedAccessGroupIdentifier_accessibility_returnsCorrectValet_VALAccessibilityAfterFirstUnlock;
{
    VALValet *const valet = [VALValet sharedAccessGroupValetWithAppIDPrefix:self.appIDPrefix sharedAccessGroupIdentifier:self.sharedAccessGroupIdentifier accessibility:VALAccessibilityAfterFirstUnlock];
    XCTAssertEqual(valet.accessibility, VALAccessibilityAfterFirstUnlock);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_valetWithSharedAccessGroupIdentifier_accessibility_returnsCorrectValet_VALAccessibilityWhenPasscodeSetThisDeviceOnly;
{
    VALValet *const valet = [VALValet sharedAccessGroupValetWithAppIDPrefix:self.appIDPrefix sharedAccessGroupIdentifier:self.sharedAccessGroupIdentifier accessibility:VALAccessibilityWhenPasscodeSetThisDeviceOnly];
    XCTAssertEqual(valet.accessibility, VALAccessibilityWhenPasscodeSetThisDeviceOnly);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_valetWithSharedAccessGroupIdentifier_accessibility_returnsCorrectValet_VALAccessibilityWhenUnlockedThisDeviceOnly;
{
    VALValet *const valet = [VALValet sharedAccessGroupValetWithAppIDPrefix:self.appIDPrefix sharedAccessGroupIdentifier:self.sharedAccessGroupIdentifier accessibility:VALAccessibilityWhenUnlockedThisDeviceOnly];
    XCTAssertEqual(valet.accessibility, VALAccessibilityWhenUnlockedThisDeviceOnly);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_valetWithSharedAccessGroupIdentifier_accessibility_returnsCorrectValet_VALAccessibilityAfterFirstUnlockThisDeviceOnly;
{
    VALValet *const valet = [VALValet sharedAccessGroupValetWithAppIDPrefix:self.appIDPrefix sharedAccessGroupIdentifier:self.sharedAccessGroupIdentifier accessibility:VALAccessibilityAfterFirstUnlockThisDeviceOnly];
    XCTAssertEqual(valet.accessibility, VALAccessibilityAfterFirstUnlockThisDeviceOnly);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_valetWithSharedAccessGroupIdentifier_accessibility_returnsNilWhenIdentifierIsEmpty;
{
    VALValet *const valet = [VALValet sharedAccessGroupValetWithAppIDPrefix:self.appIDPrefix sharedAccessGroupIdentifier:@"" accessibility:VALAccessibilityAfterFirstUnlockThisDeviceOnly];
    XCTAssertNil(valet);
}

- (void)test_iCloudValetWithSharedAccessGroupIdentifier_accessibility_returnsCorrectValet_VALCloudAccessibilityWhenUnlocked;
{
    VALValet *const valet = [VALValet iCloudValetWithAppIDPrefix:self.appIDPrefix sharedAccessGroupIdentifier:self.sharedAccessGroupIdentifier accessibility:VALCloudAccessibilityWhenUnlocked];
    XCTAssertEqual(valet.accessibility, VALAccessibilityWhenUnlocked);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_iCloudValetWithSharedAccessGroupIdentifier_accessibility_returnsCorrectValet_VALCloudAccessibilityAfterFirstUnlock;
{
    VALValet *const valet = [VALValet iCloudValetWithAppIDPrefix:self.appIDPrefix sharedAccessGroupIdentifier:self.sharedAccessGroupIdentifier accessibility:VALCloudAccessibilityAfterFirstUnlock];
    XCTAssertEqual(valet.accessibility, VALAccessibilityAfterFirstUnlock);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_iCloudValetWithSharedAccessGroupIdentifier_accessibility_returnsNilWhenIdentifierIsEmpty;
{
    VALValet *const valet = [VALValet iCloudValetWithAppIDPrefix:self.appIDPrefix sharedAccessGroupIdentifier:@"" accessibility:VALCloudAccessibilityAfterFirstUnlock];
    XCTAssertNil(valet);
}

- (void)test_containsObjectForKey_returnsTrueWhenObjectExistsInKeychain;
{
    VALValet *const valet = [VALValet valetWithIdentifier:self.identifier accessibility:VALAccessibilityWhenUnlocked];
    [valet setString:@"password" forKey:NSStringFromSelector(_cmd) error:nil];
    XCTAssertTrue([valet containsObjectForKey:NSStringFromSelector(_cmd)]);

    // Clean up.
    [valet removeObjectForKey:NSStringFromSelector(_cmd) error:nil];
}

- (void)test_containsObjectForKey_returnsFalseWhenObjectDoesNotExistInKeychain;
{
    VALValet *const valet = [VALValet valetWithIdentifier:self.identifier accessibility:VALAccessibilityWhenUnlocked];
    XCTAssertFalse([valet containsObjectForKey:NSStringFromSelector(_cmd)]);

    // Clean up.
    [valet removeObjectForKey:NSStringFromSelector(_cmd) error:nil];
}

- (void)test_migrateObjectsMatching_compactMap_error_successfullyMigratesSingleValue;
{
    if (![self testEnvironmentIsSigned]) {
        return;
    }
    VALValet *const valet = [VALValet valetWithIdentifier:self.identifier accessibility:VALAccessibilityWhenUnlocked];

    [valet setString:@"password" forKey:NSStringFromSelector(_cmd) error:nil];

    VALValet *const otherValet = [VALValet valetWithIdentifier:NSStringFromSelector(_cmd) accessibility:VALAccessibilityWhenUnlocked];
    [otherValet migrateObjectsMatching:@{
        (__bridge id)kSecClass : (__bridge id)kSecClassGenericPassword,
        (__bridge id)kSecAttrService : @"VAL_VALValet_initWithIdentifier:accessibility:_identifier_AccessibleWhenUnlocked",
    } compactMap:^VALMigratableKeyValuePairOutput * _Nullable(VALMigratableKeyValuePairInput * _Nonnull input) {
        return [[VALMigratableKeyValuePairOutput alloc] initWithKey:input.key value:input.value];
    } error:nil];
    XCTAssertEqualObjects([otherValet stringForKey:NSStringFromSelector(_cmd) error:nil], @"password");

    // Clean up.
    [valet removeAllObjectsAndReturnError:nil];
    [otherValet removeAllObjectsAndReturnError:nil];
}

- (void)test_migrateObjectsFrom_compactMap_error_successfullyMigratesSingleValue;
{
    if (![self testEnvironmentIsSigned]) {
        return;
    }
    VALValet *const valet = [VALValet valetWithIdentifier:self.identifier accessibility:VALAccessibilityWhenUnlocked];

    [valet setString:@"password" forKey:NSStringFromSelector(_cmd) error:nil];

    VALValet *const otherValet = [VALValet valetWithIdentifier:NSStringFromSelector(_cmd) accessibility:VALAccessibilityWhenUnlocked];
    [otherValet migrateObjectsFrom:valet compactMap:^VALMigratableKeyValuePairOutput * _Nullable(VALMigratableKeyValuePairInput * _Nonnull input) {
        return [[VALMigratableKeyValuePairOutput alloc] initWithKey:input.key value:input.value];
    } error:nil];
    XCTAssertEqualObjects([otherValet stringForKey:NSStringFromSelector(_cmd) error:nil], @"password");

    // Clean up.
    [valet removeAllObjectsAndReturnError:nil];
    [otherValet removeAllObjectsAndReturnError:nil];
}

- (void)test_migrateObjectsMatching_compactMap_error_successfullyMigratesTransformedValue;
{
    if (![self testEnvironmentIsSigned]) {
        return;
    }
    VALValet *const valet = [VALValet valetWithIdentifier:self.identifier accessibility:VALAccessibilityWhenUnlocked];

    [valet setString:@"password" forKey:NSStringFromSelector(_cmd) error:nil];

    VALValet *const otherValet = [VALValet valetWithIdentifier:NSStringFromSelector(_cmd) accessibility:VALAccessibilityWhenUnlocked];
    [otherValet migrateObjectsMatching:@{
        (__bridge id)kSecClass : (__bridge id)kSecClassGenericPassword,
        (__bridge id)kSecAttrService : @"VAL_VALValet_initWithIdentifier:accessibility:_identifier_AccessibleWhenUnlocked",
    } compactMap:^VALMigratableKeyValuePairOutput * _Nullable(VALMigratableKeyValuePairInput * _Nonnull input) {
        return [[VALMigratableKeyValuePairOutput alloc] initWithKey:input.key value:[@"12345" dataUsingEncoding:NSUTF8StringEncoding]];
    } error:nil];
    XCTAssertEqualObjects([otherValet stringForKey:NSStringFromSelector(_cmd) error:nil], @"12345");

    // Clean up.
    [valet removeAllObjectsAndReturnError:nil];
    [otherValet removeAllObjectsAndReturnError:nil];
}

- (void)test_migrateObjectsFrom_compactMap_error_successfullyMigratesTransformedValue;
{
    if (![self testEnvironmentIsSigned]) {
        return;
    }
    VALValet *const valet = [VALValet valetWithIdentifier:self.identifier accessibility:VALAccessibilityWhenUnlocked];

    [valet setString:@"password" forKey:NSStringFromSelector(_cmd) error:nil];

    VALValet *const otherValet = [VALValet valetWithIdentifier:NSStringFromSelector(_cmd) accessibility:VALAccessibilityWhenUnlocked];
    [otherValet migrateObjectsFrom:valet compactMap:^VALMigratableKeyValuePairOutput * _Nullable(VALMigratableKeyValuePairInput * _Nonnull input) {
        return [[VALMigratableKeyValuePairOutput alloc] initWithKey:input.key value:[@"12345" dataUsingEncoding:NSUTF8StringEncoding]];
    } error:nil];
    XCTAssertEqualObjects([otherValet stringForKey:NSStringFromSelector(_cmd) error:nil], @"12345");

    // Clean up.
    [valet removeAllObjectsAndReturnError:nil];
    [otherValet removeAllObjectsAndReturnError:nil];
}

- (void)test_migrateObjectsMatching_compactMap_error_returningNilDoesNotMigratePair;
{
    if (![self testEnvironmentIsSigned]) {
        return;
    }
    VALValet *const valet = [VALValet valetWithIdentifier:self.identifier accessibility:VALAccessibilityWhenUnlocked];

    NSString *const key1 = [NSString stringWithFormat:@"%@-1", NSStringFromSelector(_cmd)];
    NSString *const key2 = [NSString stringWithFormat:@"%@-2", NSStringFromSelector(_cmd)];
    [valet setString:@"password1" forKey:key1 error:nil];
    [valet setString:@"password2" forKey:key2 error:nil];

    VALValet *const otherValet = [VALValet valetWithIdentifier:NSStringFromSelector(_cmd) accessibility:VALAccessibilityWhenUnlocked];
    [otherValet migrateObjectsMatching:@{
        (__bridge id)kSecClass : (__bridge id)kSecClassGenericPassword,
        (__bridge id)kSecAttrService : @"VAL_VALValet_initWithIdentifier:accessibility:_identifier_AccessibleWhenUnlocked",
    } compactMap:^VALMigratableKeyValuePairOutput * _Nullable(VALMigratableKeyValuePairInput * _Nonnull input) {
        if ([input.key isEqualToString:key1]) {
            return nil;
        } else {
            return [[VALMigratableKeyValuePairOutput alloc] initWithKey:input.key value:input.value];
        }
    } error:nil];
    XCTAssertNil([otherValet stringForKey:key1 error:nil]);
    XCTAssertEqualObjects([otherValet stringForKey:key2 error:nil], @"password2");

    // Clean up.
    [valet removeAllObjectsAndReturnError:nil];
    [otherValet removeAllObjectsAndReturnError:nil];
}

- (void)test_migrateObjectsFrom_compactMap_error_returningNilDoesNotMigratePair;
{
    if (![self testEnvironmentIsSigned]) {
        return;
    }
    VALValet *const valet = [VALValet valetWithIdentifier:self.identifier accessibility:VALAccessibilityWhenUnlocked];

    NSString *const key1 = [NSString stringWithFormat:@"%@-1", NSStringFromSelector(_cmd)];
    NSString *const key2 = [NSString stringWithFormat:@"%@-2", NSStringFromSelector(_cmd)];
    [valet setString:@"password1" forKey:key1 error:nil];
    [valet setString:@"password2" forKey:key2 error:nil];

    VALValet *const otherValet = [VALValet valetWithIdentifier:NSStringFromSelector(_cmd) accessibility:VALAccessibilityWhenUnlocked];
    [otherValet migrateObjectsFrom:valet compactMap:^VALMigratableKeyValuePairOutput * _Nullable(VALMigratableKeyValuePairInput * _Nonnull input) {
        if ([input.key isEqualToString:key1]) {
            return nil;
        } else {
            return [[VALMigratableKeyValuePairOutput alloc] initWithKey:input.key value:input.value];
        }
    } error:nil];
    XCTAssertNil([otherValet stringForKey:key1 error:nil]);
    XCTAssertEqualObjects([otherValet stringForKey:key2 error:nil], @"password2");

    // Clean up.
    [valet removeAllObjectsAndReturnError:nil];
    [otherValet removeAllObjectsAndReturnError:nil];
}

- (void)test_migrateObjectsMatching_compactMap_error_preventingMigrationPreventsAllMigration;
{
    if (![self testEnvironmentIsSigned]) {
        return;
    }
    VALValet *const valet = [VALValet valetWithIdentifier:self.identifier accessibility:VALAccessibilityWhenUnlocked];

    NSString *const key1 = [NSString stringWithFormat:@"%@-1", NSStringFromSelector(_cmd)];
    NSString *const key2 = [NSString stringWithFormat:@"%@-2", NSStringFromSelector(_cmd)];
    [valet setString:@"password1" forKey:key1 error:nil];
    [valet setString:@"password2" forKey:key2 error:nil];

    VALValet *const otherValet = [VALValet valetWithIdentifier:NSStringFromSelector(_cmd) accessibility:VALAccessibilityWhenUnlocked];
    [otherValet migrateObjectsMatching:@{
        (__bridge id)kSecClass : (__bridge id)kSecClassGenericPassword,
        (__bridge id)kSecAttrService : @"VAL_VALValet_initWithIdentifier:accessibility:_identifier_AccessibleWhenUnlocked",
    } compactMap:^VALMigratableKeyValuePairOutput * _Nullable(VALMigratableKeyValuePairInput * _Nonnull input) {
        if ([input.key isEqualToString:key1]) {
            return [[VALMigratableKeyValuePairOutput alloc] initWithKey:input.key value:input.value];;
        } else {
            return VALMigratableKeyValuePairOutput.preventMigration;
        }
    } error:nil];
    XCTAssertNil([otherValet stringForKey:key1 error:nil]);
    XCTAssertNil([otherValet stringForKey:key2 error:nil]);

    // Clean up.
    [valet removeAllObjectsAndReturnError:nil];
    [otherValet removeAllObjectsAndReturnError:nil];
}

- (void)test_migrateObjectsFrom_compactMap_error_preventingMigrationPreventsAllMigration;
{
    if (![self testEnvironmentIsSigned]) {
        return;
    }
    VALValet *const valet = [VALValet valetWithIdentifier:self.identifier accessibility:VALAccessibilityWhenUnlocked];

    NSString *const key1 = [NSString stringWithFormat:@"%@-1", NSStringFromSelector(_cmd)];
    NSString *const key2 = [NSString stringWithFormat:@"%@-2", NSStringFromSelector(_cmd)];
    [valet setString:@"password1" forKey:key1 error:nil];
    [valet setString:@"password2" forKey:key2 error:nil];

    VALValet *const otherValet = [VALValet valetWithIdentifier:NSStringFromSelector(_cmd) accessibility:VALAccessibilityWhenUnlocked];
    [otherValet migrateObjectsFrom:valet compactMap:^VALMigratableKeyValuePairOutput * _Nullable(VALMigratableKeyValuePairInput * _Nonnull input) {
        if ([input.key isEqualToString:key1]) {
            return [[VALMigratableKeyValuePairOutput alloc] initWithKey:input.key value:input.value];;
        } else {
            return VALMigratableKeyValuePairOutput.preventMigration;
        }
    } error:nil];
    XCTAssertNil([otherValet stringForKey:key1 error:nil]);
    XCTAssertNil([otherValet stringForKey:key2 error:nil]);

    // Clean up.
    [valet removeAllObjectsAndReturnError:nil];
}

- (void)test_migrateObjectsMatching_compactMap_error_preventingMigrationReturnsNoError;
{
    if (![self testEnvironmentIsSigned]) {
        return;
    }
    VALValet *const valet = [VALValet valetWithIdentifier:self.identifier accessibility:VALAccessibilityWhenUnlocked];

    [valet setString:@"password" forKey:NSStringFromSelector(_cmd) error:nil];

    VALValet *const otherValet = [VALValet valetWithIdentifier:NSStringFromSelector(_cmd) accessibility:VALAccessibilityWhenUnlocked];
    NSError *error = nil;
    [otherValet migrateObjectsMatching:@{
        (__bridge id)kSecClass : (__bridge id)kSecClassGenericPassword,
        (__bridge id)kSecAttrService : @"VAL_VALValet_initWithIdentifier:accessibility:_identifier_AccessibleWhenUnlocked",
    } compactMap:^VALMigratableKeyValuePairOutput * _Nullable(VALMigratableKeyValuePairInput * _Nonnull input) {
        return VALMigratableKeyValuePairOutput.preventMigration;
    } error:&error];
    XCTAssertNil(error);

    // Clean up.
    [valet removeAllObjectsAndReturnError:nil];
}

- (void)test_migrateObjectsFrom_compactMap_error_preventingMigrationReturnsNoError;
{
    if (![self testEnvironmentIsSigned]) {
        return;
    }
    VALValet *const valet = [VALValet valetWithIdentifier:self.identifier accessibility:VALAccessibilityWhenUnlocked];

    [valet setString:@"password" forKey:NSStringFromSelector(_cmd) error:nil];

    VALValet *const otherValet = [VALValet valetWithIdentifier:NSStringFromSelector(_cmd) accessibility:VALAccessibilityWhenUnlocked];
    NSError *error = nil;
    [otherValet migrateObjectsFrom:valet compactMap:^VALMigratableKeyValuePairOutput * _Nullable(VALMigratableKeyValuePairInput * _Nonnull input) {
        return VALMigratableKeyValuePairOutput.preventMigration;
    } error:&error];
    XCTAssertNil(error);

    // Clean up.
    [valet removeAllObjectsAndReturnError:nil];
}

// MARK: Mac Tests

#if TARGET_OS_OSX

- (void)test_valetWithExplicitlySetIdentifier_accessibility_returnsCorrectValet_VALAccessibilityWhenUnlocked;
{
    VALValet *const valet = [VALValet valetWithExplicitlySetIdentifier:self.identifier accessibility:VALAccessibilityWhenUnlocked];
    XCTAssertEqual(valet.accessibility, VALAccessibilityWhenUnlocked);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_valetWithExplicitlySetIdentifier_accessibility_returnsCorrectValet_VALAccessibilityAfterFirstUnlock;
{
    VALValet *const valet = [VALValet valetWithExplicitlySetIdentifier:self.identifier accessibility:VALAccessibilityAfterFirstUnlock];
    XCTAssertEqual(valet.accessibility, VALAccessibilityAfterFirstUnlock);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_valetWithExplicitlySetIdentifier_accessibility_returnsCorrectValet_VALAccessibilityWhenPasscodeSetThisDeviceOnly;
{
    VALValet *const valet = [VALValet valetWithExplicitlySetIdentifier:self.identifier accessibility:VALAccessibilityWhenPasscodeSetThisDeviceOnly];
    XCTAssertEqual(valet.accessibility, VALAccessibilityWhenPasscodeSetThisDeviceOnly);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_valetWithExplicitlySetIdentifier_accessibility_returnsCorrectValet_VALAccessibilityWhenUnlockedThisDeviceOnly;
{
    VALValet *const valet = [VALValet valetWithExplicitlySetIdentifier:self.identifier accessibility:VALAccessibilityWhenUnlockedThisDeviceOnly];
    XCTAssertEqual(valet.accessibility, VALAccessibilityWhenUnlockedThisDeviceOnly);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_valetWithExplicitlySetIdentifier_accessibility_returnsCorrectValet_VALAccessibilityAfterFirstUnlockThisDeviceOnly;
{
    VALValet *const valet = [VALValet valetWithExplicitlySetIdentifier:self.identifier accessibility:VALAccessibilityAfterFirstUnlockThisDeviceOnly];
    XCTAssertEqual(valet.accessibility, VALAccessibilityAfterFirstUnlockThisDeviceOnly);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_valetWithExplicitlySetIdentifier_accessibility_returnsNilWhenIdentifierIsEmpty;
{
    VALValet *const valet = [VALValet valetWithExplicitlySetIdentifier:@"" accessibility:VALAccessibilityAfterFirstUnlockThisDeviceOnly];
    XCTAssertNil(valet);
}

- (void)test_iCloudValetWithExplicitlySetIdentifier_accessibility_returnsCorrectValet_VALCloudAccessibilityWhenUnlocked;
{
    VALValet *const valet = [VALValet iCloudValetWithExplicitlySetIdentifier:self.identifier accessibility:VALCloudAccessibilityWhenUnlocked];
    XCTAssertEqual(valet.accessibility, VALAccessibilityWhenUnlocked);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_iCloudValetWithExplicitlySetIdentifier_accessibility_returnsCorrectValet_VALCloudAccessibilityAfterFirstUnlock;
{
    VALValet *const valet = [VALValet iCloudValetWithExplicitlySetIdentifier:self.identifier accessibility:VALCloudAccessibilityAfterFirstUnlock];
    XCTAssertEqual(valet.accessibility, VALAccessibilityAfterFirstUnlock);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_iCloudValetWithExplicitlySetIdentifier_accessibility_returnsNilWhenIdentifierIsEmpty;
{
    VALValet *const valet = [VALValet iCloudValetWithExplicitlySetIdentifier:@"" accessibility:VALCloudAccessibilityAfterFirstUnlock];
    XCTAssertNil(valet);
}

- (void)test_valetWithExplicitlySetSharedAccessGroupIdentifier_accessibility_returnsCorrectValet_VALAccessibilityWhenUnlocked;
{
    VALValet *const valet = [VALValet valetWithAppIDPrefix:self.appIDPrefix explicitlySetSharedAccessGroupIdentifier:self.sharedAccessGroupIdentifier accessibility:VALAccessibilityWhenUnlocked];
    XCTAssertEqual(valet.accessibility, VALAccessibilityWhenUnlocked);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_valetWithExplicitlySetSharedAccessGroupIdentifier_accessibility_returnsCorrectValet_VALAccessibilityAfterFirstUnlock;
{
    VALValet *const valet = [VALValet valetWithAppIDPrefix:self.appIDPrefix explicitlySetSharedAccessGroupIdentifier:self.sharedAccessGroupIdentifier accessibility:VALAccessibilityAfterFirstUnlock];
    XCTAssertEqual(valet.accessibility, VALAccessibilityAfterFirstUnlock);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_valetWithExplicitlySetSharedAccessGroupIdentifier_accessibility_returnsCorrectValet_VALAccessibilityWhenPasscodeSetThisDeviceOnly;
{
    VALValet *const valet = [VALValet valetWithAppIDPrefix:self.appIDPrefix explicitlySetSharedAccessGroupIdentifier:self.sharedAccessGroupIdentifier accessibility:VALAccessibilityWhenPasscodeSetThisDeviceOnly];
    XCTAssertEqual(valet.accessibility, VALAccessibilityWhenPasscodeSetThisDeviceOnly);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_valetWithExplicitlySetSharedAccessGroupIdentifier_accessibility_returnsCorrectValet_VALAccessibilityWhenUnlockedThisDeviceOnly;
{
    VALValet *const valet = [VALValet valetWithAppIDPrefix:self.appIDPrefix explicitlySetSharedAccessGroupIdentifier:self.sharedAccessGroupIdentifier accessibility:VALAccessibilityWhenUnlockedThisDeviceOnly];
    XCTAssertEqual(valet.accessibility, VALAccessibilityWhenUnlockedThisDeviceOnly);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_valetWithExplicitlySetSharedAccessGroupIdentifier_accessibility_returnsCorrectValet_VALAccessibilityAfterFirstUnlockThisDeviceOnly;
{
    VALValet *const valet = [VALValet valetWithAppIDPrefix:self.appIDPrefix explicitlySetSharedAccessGroupIdentifier:self.sharedAccessGroupIdentifier accessibility:VALAccessibilityAfterFirstUnlockThisDeviceOnly];
    XCTAssertEqual(valet.accessibility, VALAccessibilityAfterFirstUnlockThisDeviceOnly);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_valetWithExplicitlySetSharedAccessGroupIdentifier_accessibility_returnsNilWhenIdentifierIsEmpty;
{
    VALValet *const valet = [VALValet valetWithAppIDPrefix:self.appIDPrefix explicitlySetSharedAccessGroupIdentifier:@"" accessibility:VALAccessibilityAfterFirstUnlockThisDeviceOnly];
    XCTAssertNil(valet);
}

- (void)test_iCloudValetWithExplicitlySetSharedAccessGroupIdentifier_accessibility_returnsCorrectValet_VALCloudAccessibilityWhenUnlocked;
{
    VALValet *const valet = [VALValet iCloudValetWithAppIDPrefix:self.appIDPrefix explicitlySetSharedAccessGroupIdentifier:self.sharedAccessGroupIdentifier accessibility:VALCloudAccessibilityWhenUnlocked];
    XCTAssertEqual(valet.accessibility, VALAccessibilityWhenUnlocked);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_iCloudValetWithExplicitlySetSharedAccessGroupIdentifier_accessibility_returnsCorrectValet_VALCloudAccessibilityAfterFirstUnlock;
{
    VALValet *const valet = [VALValet iCloudValetWithAppIDPrefix:self.appIDPrefix explicitlySetSharedAccessGroupIdentifier:self.sharedAccessGroupIdentifier accessibility:VALCloudAccessibilityAfterFirstUnlock];
    XCTAssertEqual(valet.accessibility, VALCloudAccessibilityAfterFirstUnlock);
    XCTAssertEqual([valet class], [VALValet class]);
}

- (void)test_iCloudValetWithExplicitlySetSharedAccessGroupIdentifier_accessibility_returnsNilWhenIdentifierIsEmpty;
{
    VALValet *const valet = [VALValet iCloudValetWithAppIDPrefix:self.appIDPrefix explicitlySetSharedAccessGroupIdentifier:@"" accessibility:VALCloudAccessibilityAfterFirstUnlock];
    XCTAssertNil(valet);
}

#endif

@end
