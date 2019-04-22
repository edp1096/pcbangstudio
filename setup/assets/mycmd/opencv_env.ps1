# For Powershell only
#$env:CGO_CXXFLAGS="--std=c++11"
#$env:CGO_CPPFLAGS="-I"+$env:opencv+"\build\install\include"
#$env:CGO_LDFLAGS="-L"+$env:opencv+"\build\install\x64\mingw\lib -lopencv_core400 -lopencv_face400 -lopencv_videoio400 -lopencv_imgproc400 -lopencv_highgui400 -lopencv_imgcodecs400 -lopencv_objdetect400 -lopencv_features2d400 -lopencv_video400 -lopencv_dnn400 -lopencv_xfeatures2d400 -lopencv_plot400 -lopencv_tracking400 -lopencv_img_hash400"

$env:CGO_CXXFLAGS="--std=c++11"
$env:CGO_CPPFLAGS="-I"+$env:opencv+"\include"
$env:CGO_LDFLAGS="-L"+$env:opencv+"\x64\mingw\lib -lopencv_core400 -lopencv_face400 -lopencv_videoio400 -lopencv_imgproc400 -lopencv_highgui400 -lopencv_imgcodecs400 -lopencv_objdetect400 -lopencv_features2d400 -lopencv_video400 -lopencv_dnn400 -lopencv_xfeatures2d400 -lopencv_plot400 -lopencv_tracking400 -lopencv_img_hash400"
