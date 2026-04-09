$pwd = (Get-Location).Path
Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Image]::FromFile("$pwd\temp.jpg")
$width = 650
$height = 1820
$rect = New-Object System.Drawing.Rectangle(0, 0, $width, $height)
$bmp = New-Object System.Drawing.Bitmap($width, $height)
$gfx = [System.Drawing.Graphics]::FromImage($bmp)
$gfx.DrawImage($img, 0, 0, $rect, [System.Drawing.GraphicsUnit]::Pixel)
$bmp.Save("$pwd\hero_image.jpg", [System.Drawing.Imaging.ImageFormat]::Jpeg)
$gfx.Dispose()
$bmp.Dispose()
$img.Dispose()
Write-Output "Recropped perfectly to portrait without text."
