### Quick ADB Terminal Alternative Commands

# 1. Grant Call Log permissions via ADB shell (bypasses dialog):
adb shell pm grant com.example.callloginjector android.permission.WRITE_CALL_LOG
adb shell pm grant com.example.callloginjector android.permission.READ_CALL_LOG

# 2. Inject a single outgoing call directly via ADB shell content provider:
adb shell content insert --uri content://call_log/calls \
  --bind number:s:"+15550192834" \
  --bind date:l:$(($(date +%s%N)/1000000 - 3600000)) \
  --bind duration:i:45 \
  --bind type:i:2 \
  --bind is_read:i:1

# 3. Query the CallLog table from ADB:
adb shell content query --uri content://call_log/calls --projection number:date:duration:type
