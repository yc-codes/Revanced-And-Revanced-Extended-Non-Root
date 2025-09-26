#!/bin/bash
# Revanced Extended build
source src/build/utils.sh

# Download requirements
dl_gh "revanced-patches revanced-cli" "inotia00" "prerelease"

# Patch Youtube Arm64-v8a
get_patches_key "youtube-revanced-extended"
get_apk "com.google.android.youtube" "youtube-beta" "youtube" "google-inc/youtube/youtube" "Bundle_extract"
split_editor "youtube-beta" "youtube-beta-arm64-v8a" "exclude" "split_config.armeabi_v7a split_config.x86 split_config.x86_64"
patch "youtube-beta-arm64-v8a" "revanced-extended" "inotia"

# Patch YouTube Music Extended:
# Arm64-v8a
get_patches_key "youtube-music-revanced-extended"
get_apk "com.google.android.apps.youtube.music" "youtube-music-beta-arm64-v8a" "youtube-music" "google-inc/youtube-music/youtube-music" "arm64-v8a"
patch "youtube-music-beta-arm64-v8a" "revanced-extended" "inotia"

# Patch Reddit:
get_patches_key "reddit-rve"
get_apk "com.reddit.frontpage" "reddit-beta" "reddit" "redditinc/reddit/reddit" "Bundle_extract"
# Patch Arm64-v8a:
split_editor "reddit-beta" "reddit-arm64-v8a-beta" "exclude" "split_config.armeabi_v7a split_config.x86_64 split_config.mdpi split_config.ldpi split_config.hdpi split_config.xhdpi split_config.xxhdpi split_config.tvdpi"
get_patches_key "reddit-rve"
patch "reddit-arm64-v8a-beta" "revanced-extended" "inotia"

# Patch YouTube Lite Arm64-v8a:
get_patches_key "youtube-revanced-extended"
split_editor "youtube-beta" "youtube-lite-beta-arm64-v8a" "include" "split_config.arm64_v8a split_config.en split_config.xhdpi split_config.xxxhdpi"
patch "youtube-lite-beta-arm64-v8a" "revanced-extended" "inotia"
