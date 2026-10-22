# Native Android Call Log Injector (Kotlin + Jetpack Compose)

This project allows developers to inject realistic simulated outgoing call entries directly into the Android system's Telephony Call Log database via `ContentResolver`.

## Features
- **Target Phone Number Input**: Enter any phone number (e.g. `+1 (555) 019-2834`).
- **Time Window**: Specify how far back in hours to disperse the timestamps (e.g. `24` hours).
- **Call Count**: Configure how many records to generate.
- **Runtime Permissions**: Uses `ActivityResultContracts.RequestMultiplePermissions` to safely request `WRITE_CALL_LOG` and `READ_CALL_LOG`.
- **System CallLog Insertion**: Maps:
  - `CallLog.Calls.NUMBER` -> Target phone number
  - `CallLog.Calls.DATE` -> Past timestamp (Current time - random offset up to window)
  - `CallLog.Calls.DURATION` -> Random duration between 10s and 120s
  - `CallLog.Calls.TYPE` -> `CallLog.Calls.OUTGOING_TYPE` (2)
  - `CallLog.Calls.IS_READ` -> 1
- **API 24 to 35 Compatibility**: Gracefully manages deprecated fields and runs on background IO dispatchers.

## How to Run in Android Studio
1. Open **Android Studio** (Ladybug / Koala / Hedgehog or newer).
2. Click **File -> New -> Import Project** (or **Open**).
3. Select this unzipped project directory.
4. Allow Gradle sync to complete.
5. Connect an Android device or start an Android Emulator (API 24+).
6. Click **Run ('app')** (Shift + F10).
7. Grant the **Call Log** permissions dialog when prompted.
8. Open the native **Google Phone / Dialer** app on your device to see the newly injected calls in your Recents list!

## Google Play Sensitive Permissions Warning
Note that `WRITE_CALL_LOG` and `READ_CALL_LOG` are classified by Google Play as **Sensitive & High-Risk Permissions**. Google restricts production Play Store publication to apps that are set as the user's default phone or SMS handler. For local testing, QA, forensics, or internal enterprise apps, it runs freely on any sideloaded APK or debug build.
