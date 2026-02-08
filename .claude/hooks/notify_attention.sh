#!/bin/bash

# 参数: 音频文件名
WAV_NAME=${1:-"任务需要你的确认.wav"}
WAV_PATH="$HOME/.claude/hooks/$WAV_NAME"

# 播放 WAV 文件的函数
play_wav() {
    if [ -f "$1" ]; then
        if command -v afplay >/dev/null 2>&1; then
            afplay "$1"
        elif command -v paplay >/dev/null 2>&1; then
            paplay "$1"
        elif command -v aplay >/dev/null 2>&1; then
            aplay "$1"
        elif command -v ffplay >/dev/null 2>&1; then
            ffplay -nodisp -autoexit "$1" >/dev/null 2>&1
        fi
    fi
}

# 播放提示音的函数 (高低交替)
play_attention_chime() {
    # 如果有 ffplay，可以使用频率生成
    if command -v ffplay >/dev/null 2>&1; then
        for i in {1..3}; do
            ffplay -f lavfi -i "sine=frequency=1568:duration=0.1" -nodisp -autoexit >/dev/null 2>&1
            ffplay -f lavfi -i "sine=frequency=1046:duration=0.1" -nodisp -autoexit >/dev/null 2>&1
        done
    else
        # 否则使用系统铃声
        for i in {1..6}; do
            printf '\a'
            sleep 0.1
        done
    fi
}

# 旋律1次，语音一次，交替进行
for i in {1..4}; do
    play_attention_chime
    play_wav "$WAV_PATH"
done
