# Intel&reg; RealSense&trade; のROS2ラッパー（升谷研バージョン）

[オリジナルのREADME.md](README-original.md)

## 前提

- [Intel® RealSense™ SDK 2.0 (v2.45.0)](https://github.com/IntelRealSense/librealsense/releases/tag/v2.45.0)
  - Intel.RealSense.SDK-WIN10-2.45.0.3212.exe でインストール
- [Chocolateyを使ってインストールしたROS2 Foxy](https://ms-iot.github.io/ROSOnWindows/GettingStarted/SetupRos2.html)

## 手順

    mkdir \ros_realsense_ws
    cd \ros_realsense_ws
    mkdir src
    cd src
    git clone --branch ros2-odens https://github.com/MasutaniLab/realsense-ros
    cd \ros_realsense_ws
    colcon build
    install\setup.bat
    ros2 run realsense2_camera realsense2_camera_node --ros-args -p enable_pointcloud:=true -p device_type:=d435

別端末

    rviz2

RGB画像，深度画像，点群を確認