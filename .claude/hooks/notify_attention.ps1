param(
  [string]$WavName = "任务需要你的确认.wav"
)

$ErrorActionPreference = "Stop"

$wav = Join-Path $env:USERPROFILE (".claude\hooks\" + $WavName)
if (-not (Test-Path $wav)) { exit 0 }

function Play-QuakeAlertLike {
  # 高低交替
  $pattern = @(
    @{f=1568; d=110}, @{f=1046; d=110},
    @{f=1568; d=110}, @{f=1046; d=110},
    @{f=1568; d=110}, @{f=1046; d=110},
    @{f=0;    d=140},
    @{f=1760; d=140}, @{f=1175; d=140}
  )
  foreach ($n in $pattern) {
    if ($n.f -gt 0) { [console]::Beep($n.f, $n.d) } else { Start-Sleep -Milliseconds $n.d }
    Start-Sleep -Milliseconds 20
  }
}

function Play-Wav($path) {
  $player = New-Object System.Media.SoundPlayer $path
  try { $player.PlaySync() } finally { $player.Dispose() }
}

# ✅ 旋律1次，语音一次，旋律1次，语音一次，旋律1次
Play-QuakeAlertLike
Play-Wav $wav
Play-QuakeAlertLike
Play-Wav $wav
Play-QuakeAlertLike
Play-Wav $wav
Play-QuakeAlertLike