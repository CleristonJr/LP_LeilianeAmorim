$url = "https://instagram.ffec5-1.fna.fbcdn.net/v/t51.82787-15/651668142_18317853082267180_1879979138470443676_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=106&ig_cache_key=Mzg1MjExMjI1ODIxODk4MDYzNw%3D%3D.3-ccb7-5&ccb=7-5&_nc_sid=58cdad&efg=eyJ2ZW5jb2RlX3RhZyI6InhwaWRzLjEzNjV4MTgyMC5zZHIuQzMifQ%3D%3D&_nc_ohc=-nQ9E5dIsuIQ7kNvwHk-mpy&_nc_oc=AdpqZnrsIj_mTQp8XrtTqKPXF0pygLe9xI-3m8_kWUumrhIx9LJDa7-wk2PV5S3u4TY&_nc_ad=z-m&_nc_cid=0&_nc_zt=23&_nc_ht=instagram.ffec5-1.fna&_nc_gid=-w9-farpYv3ed6rKJYUffw&_nc_ss=7a32e&oh=00_Af3twqw5IJBFW_CF7WZB5jQD47ZYwA_oJByct4Sczu35xQ&oe=69DD963B"
Invoke-WebRequest -Uri $url -OutFile temp.jpg
Add-Type -AssemblyName System.Drawing
$pwd = (Get-Location).Path
$img = [System.Drawing.Image]::FromFile("$pwd\temp.jpg")
$size = 900
$rect = New-Object System.Drawing.Rectangle(0, 90, $size, $size)
$bmp = New-Object System.Drawing.Bitmap($size, $size)
$gfx = [System.Drawing.Graphics]::FromImage($bmp)
$gfx.DrawImage($img, 0, 0, $rect, [System.Drawing.GraphicsUnit]::Pixel)
$bmp.Save("$pwd\hero_image.jpg", [System.Drawing.Imaging.ImageFormat]::Jpeg)
$gfx.Dispose()
$bmp.Dispose()
$img.Dispose()
Write-Output "Cropped to hero_image.jpg"
