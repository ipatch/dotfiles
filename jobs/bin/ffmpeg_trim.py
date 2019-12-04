import os

def runBash(command):
    os.system(command)

def crop(start,end,input,output):
    str = "ffmpeg -i " + input + " -ss " + start + " -to " + end + " -c copy " + output
    print str
    runBash(str)

####
# FORMAT for `crop` function, 
##
# 1) specify the beginning of sequence, 
# 2) end of sequence 
# 3) the input file to crop,
# 4) the output to save the cropped sequence to

## Example
# crop("00:00:00,"00:00:10","input.mkv","output-crop00.mkv")
##
# the above crop cmd will extract and save the first ten seconds of the 
# `input.mkv` file
