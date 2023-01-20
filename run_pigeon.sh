#!/bin/sh
# shellcheck disable=SC2164
cd pigeons

# shellcheck disable=SC2045
# shellcheck disable=SC2006
for file in `ls`;do
  # shellcheck disable=SC2034
  filename=${file%.*}
    flutter pub run pigeon --input pigeons/"${file%.*}".dart \
      --dart_out lib/api/"${file%.*}"_api.dart \
      --experimental_kotlin_out android/src/main/kotlin/top/w2gd/meui/apis/"${file%.*}"Api.kt \
      --objc_header_out ios/Classes/apis/pigeon.h \
      --objc_source_out ios/Classes/apis/pigeon.m \
      --experimental_swift_out ios/Classes/apis/Pigeon.swift
done