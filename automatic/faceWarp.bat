@echo off
call C:\Users\chall\anaconda3\Scripts\activate.bat C:\Users\chall\anaconda3
cd /d D:\firstOrder\first-order-model
call conda activate FO2

echo 1. Dame
echo 2. Tunak
echo 3. Soviet
echo 4. Reddit Moment
set /p video="Enter Number Of Video To Warp too: "
echo Loading........
call python demo.py  --config config/vox-adv-256.yaml --driving_video ../automatic/inputCropped/%video%.mp4 --source_image ../automatic/inputImage/image.jpg --checkpoint checkpoints/vox-adv-cpk.pth.tar --relative --adapt_scale
move result.mp4 D:\firstOrder\automatic
cd D:\firstOrder\automatic
ffmpeg -i result.mp4 -i inputCropped/%video%.mp3 -c:v copy -c:a aac finalFile.mp4
del result.mp4
CLS
echo Process Finished, the completed file is named finalFile.mp4
PAUSE