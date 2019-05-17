#####################################################################
#
# first part with walkuers
#
#####################################################################

# compile
pdflatex walkuere_rep
pdflatex walkuere_rep

# clean up old video
rm walkuere_rep.mp4

# convert to png images
convert -density 160 walkuere_rep.pdf walkuere_rep.png

# convert to video
ffmpeg -ss 00:00:00 -i walkuere_rep-%d.png -ss 00:00:26 -i Ride_of_the_Valkyries.m4a -shortest walkuere_rep_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i walkuere_rep_raw.mp4 -o walkuere_rep.mp4

# clean up
rm walkuere_rep-*.png
rm walkuere_rep_raw.mp4

#####################################################################
#
# second part with applause
#
#####################################################################

# compile
pdflatex applaus
pdflatex applaus

# clean up old video
rm applaus.mp4

# convert to png images
convert -density 160 applaus.pdf applaus.png

# convert to video
ffmpeg  -ss 00:00:00 -i applaus-%d.png -ss 00:00:00 -i Applause_after_a_concert.mp3 -shortest applaus_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i applaus_raw.mp4 -o applaus.mp4

# clean up
rm applaus-*.png
rm applaus_raw.mp4
