# Enhanced Native Call Style Notification

This implementation adds support for Android's native `Notification.CallStyle` (API 31+) which provides better system integration and a more modern call interface.

## How it Works

When `isCustomNotification` is set to `true`, the system will now use the native `Notification.CallStyle` for Android 12+ devices (API 31+), providing:

- Modern system-integrated call UI
- Better user experience with native call actions
- Automatic fallback for older Android versions
- Avatar support with dynamic loading

## Implementation Details

The enhanced notification uses:

```kotlin
val builder = Notification.Builder(context, channelId)
    .apply {
        try {
            style = Notification.CallStyle.forIncomingCall(
                person,  // Caller information with avatar
                declineIntent, // Decline action
                answerIntent   // Answer action
            ).setIsVideo(typeCall > 0) // Video call support
        } catch (iae: IllegalArgumentException) {
            // Automatic fallback to regular notification
            Log.e("CallkitNotificationManager", "Can't use notification call style: $iae")
            // Falls back to standard notification with actions
        }
        
        setSmallIcon(R.drawable.ic_answer_transparent)
        setCategory(Notification.CATEGORY_CALL)
        setVisibility(Notification.VISIBILITY_PUBLIC)
        setWhen(System.currentTimeMillis())
        setAutoCancel(false)
        setShowWhen(true)
        setOngoing(true)
        setFullScreenIntent(pendingIntent, true)
    }
```

## Features

1. **Native Call Style**: Uses Android's native call notification style for better integration
2. **Avatar Support**: Dynamically loads and displays caller avatars
3. **Video Call Support**: Automatically detects and displays video call indicators
4. **Automatic Fallback**: Falls back to regular notifications if call style fails
5. **Error Handling**: Robust error handling with logging
6. **Backward Compatibility**: Maintains compatibility with older Android versions

## Usage

Simply set `isCustomNotification: true` in your Flutter call configuration:

```dart
FlutterCallkitIncoming.showCallkitIncoming(
  CallKitParams(
    id: 'unique-call-id',
    nameCaller: 'John Doe',
    handle: '+1234567890',
    type: 0, // 0 for audio, 1 for video
    avatar: 'https://example.com/avatar.jpg',
    isCustomNotification: true, // This enables the native call style
    extra: <String, dynamic>{},
  ),
);
```

## Android Version Support

- **Android 12+ (API 31+)**: Native `Notification.CallStyle`
- **Android 11 and below**: Falls back to existing notification implementation
- **Error Cases**: Automatically falls back to standard notifications if native style fails

## Benefits

1. **Better UX**: Native system integration provides familiar call interface
2. **System Consistency**: Matches the look and feel of native phone calls
3. **Accessibility**: Better accessibility support through native Android APIs
4. **Performance**: More efficient than custom notification layouts
5. **Future-Proof**: Uses the latest Android notification APIs

The implementation maintains full backward compatibility while providing enhanced functionality on supported devices.
