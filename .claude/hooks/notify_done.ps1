param(
  [string]$WavName = "任务已完成.wav"
)

$ErrorActionPreference = "Stop"

$wav = Join-Path $env:USERPROFILE (".claude\hooks\" + $WavName)
if (-not (Test-Path $wav)) { exit 0 }

function Play-DoneChime {
  # 轻快叮咚
  $notes = @(
    @{f=880; d=120}, @{f=1046; d=120}, @{f=1318; d=170},
    @{f=0;   d=70 },
    @{f=1046; d=140}
  )
  foreach ($n in $notes) {
    if ($n.f -gt 0) { [console]::Beep($n.f, $n.d) } else { Start-Sleep -Milliseconds $n.d }
    Start-Sleep -Milliseconds 25
  }
}

function Play-Wav($path) {
  $player = New-Object System.Media.SoundPlayer $path
  try { $player.PlaySync() } finally { $player.Dispose() }
}

# ✅ 旋律1次，语音一次，旋律1次，语音一次，旋律1次
Play-DoneChime
Play-Wav $wav
Play-DoneChime
Play-Wav $wav
Play-DoneChime
Play-Wav $wav
Play-DoneChime