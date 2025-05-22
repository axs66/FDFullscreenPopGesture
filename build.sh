#!/bin/bash

set -e

# 1. 清理旧构建
rm -rf out
mkdir -p out/DEBIAN
mkdir -p out/Library/MobileSubstrate/DynamicLibraries

# 2. 拷贝 control 文件和 plist
cp DEBIAN/control out/DEBIAN/
cp FDFullscreenPopGesture.plist out/Library/MobileSubstrate/DynamicLibraries/

# 3. 编译为 dylib（假设 Xcode Command Line Tools 已安装）
clang -dynamiclib -arch arm64 \
  -isysroot $(xcrun --sdk iphoneos --show-sdk-path) \
  -framework Foundation -framework UIKit \
  UINavigationController+FDFullscreenPopGesture.m \
  -o out/Library/MobileSubstrate/DynamicLibraries/FDFullscreenPopGesture.dylib

# 4. 打包为 .deb
dpkg-deb --build out FDFullscreenPopGesture.deb
