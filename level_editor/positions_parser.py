# What is this?
"""
Allows to draw an image first and then recognize the sprite used on pico, the title image uses strawberries, cherries and apples, this script parses their positions so we can generate
the title image programmatically at init, without wasting memory on map editor or additional sprites
"""

from PIL import Image
import sys


strawberry_rgb = (95, 87, 79)
apple_rgb = (171, 82, 54)
cherry_rgb = (0, 135, 81)

list_of_strawberries = []
list_of_apples = []
list_of_cherries = []


im = Image.open(sys.argv[1])
pix = im.load()

for i in range(0, 128):
    for j in range(0, 128):
        #print(pix[i, j])
        if (pix[i, j] == strawberry_rgb and pix[i+1, j] == strawberry_rgb and pix[i+2, j] == strawberry_rgb): 
            list_of_strawberries.append("{" + str(i-2) + ", " + str(j) +"}")
        if (pix[i, j] == apple_rgb and pix[i+1, j] == apple_rgb and pix[i+1, j+1] == apple_rgb): 
            list_of_apples.append("{" + str(i-2) + ", " + str(j) +"}")
        if (pix[i, j] == cherry_rgb and pix[i+2, j] == cherry_rgb): 
            list_of_cherries.append("{" + str(i-2) + ", " + str(j-2) +"}")
       


strawberries = f"strawberries =\n{list_of_strawberries}".replace("[", "{\n").replace("]", "\n}").replace("'", "") 
apples = f"apples =\n{list_of_apples}".replace("[", "{\n").replace("]", "\n}").replace("'", "") 
cherries = f"cherries =\n{list_of_cherries}".replace("[", "{\n").replace("]", "\n}").replace("'", "") 

print(strawberries)
print("\n\n")
print(apples)
print("\n\n")
print(cherries)
print("\n\n")