flutter build apk --debug

pushd android
    ./gradlew app:assembleDebugAndroidTest
    ./gradlew app:assembleDebug -Ptarget=`pwd`/../integration_test/house_integration_test.dart
    #./gradlew app:connectedDebugAndroidTest -Ptarget=integration_test/tests/create_todo_test.dart   #- To Run Test On Local For Verification
popd

gcloud auth activate-service-account --key-file='C:/Users/Nadeera Abeykoon/Sync/Personal/Gcloud/amplified-album-396611-33fa5c3fb63d.json'
gcloud --quiet config set project amplified-album-396611

gcloud firebase test android run --type instrumentation \
    --app build/app/outputs/flutter-apk/app-debug.apk \
    --test build/app/outputs/apk/androidTest/debug/app-debug-androidTest.apk \
    --timeout 45m