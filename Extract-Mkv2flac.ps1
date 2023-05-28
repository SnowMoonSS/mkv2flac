#获取当前文件夹下所有m2ts格式文件的文件名，并存入mkvlist
[array]$mkvlist = (Get-Item .\*.mkv).BaseName
#获取当前文件夹的绝对路径，并存入location
$location = Get-Location

#将数组mkvlist中对象的数量存入i
$i = $mkvlist.Count
#当i大于0时
while ($i -gt 0){
    #i-1；数组中对象的编号是从0开始的
    $i --
    #将数组mkvlist中第(i+1)个对象存入filename
    $filename = $script:mkvlist[$i]
    #调用ffmpeg，将*.mkv中的音频提取为*.flac
    eac3to "$location\$filename.mkv" 2: "$location\$filename.flac"
}

Pause
