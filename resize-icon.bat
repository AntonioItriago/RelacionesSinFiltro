@echo off
cd /d "%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
 "Add-Type -AssemblyName System.Drawing;" ^
 "$ref=[System.Drawing.Image]::FromFile((Resolve-Path 'icon - copia (3).png'));" ^
 "$w=$ref.Width; $h=$ref.Height; $ref.Dispose();" ^
 "Write-Host ('Referencia: ' + $w + 'x' + $h);" ^
 "$src=[System.Drawing.Image]::FromFile((Resolve-Path 'icon.jpg'));" ^
 "$bmp=New-Object System.Drawing.Bitmap $w,$h;" ^
 "$g=[System.Drawing.Graphics]::FromImage($bmp);" ^
 "$g.InterpolationMode='HighQualityBicubic';" ^
 "$g.SmoothingMode='HighQuality';" ^
 "$g.PixelOffsetMode='HighQuality';" ^
 "$g.DrawImage($src,0,0,$w,$h);" ^
 "$g.Dispose(); $src.Dispose();" ^
 "$bmp.Save((Join-Path (Get-Location) 'icon.png'),[System.Drawing.Imaging.ImageFormat]::Png);" ^
 "$bmp.Dispose();" ^
 "Write-Host 'OK -> icon.png generado'"
pause