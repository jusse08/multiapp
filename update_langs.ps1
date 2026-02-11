$filePath = "d:\repos\multiapp\multiapp.json"
$lines = Get-Content -Path $filePath
$newContent = @'
            {
              "title": {
                "en": "Connect and use",
                "fa": "متصل شوید и استفاده کنید",
                "fr": "Se connecter et utiliser",
                "ru": "Подключение и использование",
                "zh": "连接并使用"
              },
              "buttons": [],
              "svgIconKey": "Check",
              "description": {
                "en": "On the main page, opposite the \"Disconnected\" label, click the VPN power button and use it.",
                "fa": "در صفحه اصلی، روبروی عبارت «Disconnected»، روی دکمه روشن کردن VPN کلیک کنید و استفاده کنید.",
                "fr": "Sur la page d'accueil, en face de la mention « Disconnected », cliquez sur le bouton d'activation du VPN pour l'utiliser.",
                "ru": "На главной странице напротив надписи \"Отключено\" нажмите на кнопку включения VPN и пользуйтесь.",
                "zh": "在主页面上，点击“Disconnected”标签对面的 VPN 开启按钮即可开始使用。"
              },
              "svgIconColor": "teal"
            }
'@ -split "`n" | ForEach-Object { $_.TrimEnd("`r") }

# We want to replace the block for Clash Mi "Connect and use"
# Lines 2132 to 2150 (1-indexed) in view_file were the block
# 0-indexed: 2131 to 2149
$pre = $lines[0..2130]
$post = $lines[2150..($lines.Count - 1)]

$result = $pre + $newContent + $post
$result | Set-Content -Path $filePath -Encoding UTF8
