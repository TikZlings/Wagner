# clean up old video
rm applaus.mp4

# convert to png images
convert -density 160 applaus.pdf applaus.png

# convert to video
#ffmpeg -ss 00:00:00 -i applaus-%d.png -ss 00:00:00 -i Applause_after_a_concert.mp3 -shortest applaus_raw.mp4

ffmpeg  -ss 00:00:00 -i applaus-%d.png -ss 00:00:26 -i Ride_of_the_Valkyries.m4a -ss 00:00:00 -itsoffset 21 -i Applause_after_a_concert.mp3 -shortest applaus_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i applaus_raw.mp4 -o applaus.mp4

# clean up
rm applaus-*.png
rm applaus_raw.mp4

# view :)
#open applaus.mp4
