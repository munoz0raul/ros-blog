inherit cmake qmake5_paths
inherit populate_sdk_qt5

EXTRA_OECMAKE = "-DOE_QMAKE_PATH_EXTERNAL_HOST_BINS='${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}'"

ROS_BUILDTOOL_EXPORT_DEPENDS_prepend = " \
    ament-cmake-native \
    rosidl-cmake-native \
"

DEPENDS += "qtbase qtbase-native rosidl-typesupport-fastrtps-cpp-native rosidl-typesupport-fastrtps-c-native"
