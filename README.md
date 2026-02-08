# Claude Code 通知提醒

为 Claude Code 添加声音通知，当任务完成或需要你的注意时提醒你。

## 功能

- **任务完成提示**：当 Claude Code 完成任务时，播放清脆的叮咚声 + 语音提醒
- **需要确认提示**：当需要你确认某些操作时，播放高低交替的提示音 + 语音提醒

## 快速开始

### 1. 安装声音文件

将声音文件放到你的用户目录下的 `.claude/hooks/` 文件夹中：

- `任务已完成.wav` - 任务完成时播放的语音
- `任务需要你的确认.wav` - 需要确认时播放的语音

**路径参考**：
- Windows: `C:\Users\你的用户名\.claude\hooks\`
- Linux/macOS: `~/.claude/hooks/`

### 2. 安装钩子脚本

将项目中的脚本复制到 `.claude/hooks/` 文件夹：

**Windows 用户**:
- `notify_done.ps1`
- `notify_attention.ps1`

**Linux/macOS 用户**:
- `notify_done.sh`
- `notify_attention.sh`
- 并确保脚本具有执行权限：`chmod +x ~/.claude/hooks/*.sh`

### 3. 配置 Claude Code

打开 `add.tu.your.settings.json`，根据你的操作系统选择相应的 `command` 配置部分，粘贴到你的 Claude Code 设置文件中。

**设置文件位置**：
- Windows: `C:\Users\你的用户名\.claude\settings.json`
- Linux/macOS: `~/.claude/settings.json`

## 声音说明

### 任务完成提示音
- 一段轻快的叮咚旋律（880Hz → 1046Hz → 1318Hz）
- 旋律循环 4 次，中间穿插语音提醒

### 需要确认提示音
- 高低交替的警报式提示音（1568Hz ↔ 1046Hz）
- 循环播放 4 次，每次后播放语音提醒

## 自定义声音

如果你不想使用语音文件，可以：
1. 直接删除 `.wav` 文件，脚本会自动跳过语音播放
2. 替换为你喜欢的任何 `.wav` 格式声音文件

## 兼容性

- **Windows**：支持 PowerShell。
- **Linux/macOS**：支持 Bash。
  - 依赖：优先使用 `afplay` (macOS), `aplay`/`paplay` (Linux) 播放声音。
  - 提示音增强：如果安装了 `ffmpeg` (含有 `ffplay`)，将获得更精确的频率提示音。

## 故障排查

如果声音没有播放：
1. 确认 `.wav` 文件存在且格式正确
2. 确认脚本有执行权限
3. 检查 Claude Code 设置中的 `hooks` 配置是否正确
4. Linux 用户确保已安装 `alsa-utils` (提供 `aplay`) 或 `pulseaudio-utils` (提供 `paplay`)

---

<全文由AI生成>
