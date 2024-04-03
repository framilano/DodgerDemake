# What is this?
"""
To simplify the map building based 16x16 tiles, this script reads and translates to in-game entity positions given the pixel rgb of a png image
Below you can find the rgb value to use while drawing for some entities
"""



from PIL import Image
import sys

background_rgb = (0, 0, 0, 255)
void_rgb = (84, 84, 84, 255)
wall_rgb = (255, 255, 255, 255)
strawberry_rgb = (255, 0, 0, 255)
cherry_rgb = (225, 0, 255, 255)
apple_rgb = (140, 255, 0, 255)
skeletons_rgb = (255, 140, 0, 255)
player_rgb = (255, 200, 0, 255)

list_of_voids = []
list_of_skeletons = []
list_of_walls = []
list_of_strawberries = []
list_of_cherries = []
list_of_players = []
list_of_apples = []

im = Image.open(sys.argv[1])
pix = im.load()

for i in range(0, 16):
    for j in range(0, 16):
        if (pix[i, j] == strawberry_rgb): list_of_strawberries.append("{" + str((i)*8) + ", " + str((j)*8) +"}")
        if (pix[i, j] == wall_rgb): list_of_walls.append("{" + str((i)*8) + ", " + str((j)*8) +"}")
        if (pix[i, j] == cherry_rgb): list_of_cherries.append("{" + str((i)*8) + ", " + str((j)*8) +"}")
        if (pix[i, j] == apple_rgb):  list_of_apples.append("{" + str((i)*8) + ", " + str((j)*8) +"}")
        if (pix[i, j] == void_rgb): list_of_voids.append("{" + str((i)*8) + ", " + str((j)*8) +"}")
        if (pix[i, j] == skeletons_rgb): list_of_skeletons.append("{" + str((i)*8) + ", " + str((j)*8) +"}")
        if (pix[i, j] == player_rgb):  list_of_players.append("{" + str((i)*8) + ", " + str((j)*8) +"}")

voids = f"voids =\n{list_of_voids}".replace("[", "{\n").replace("]", "\n}").replace("'", "") 
strawberries = f"strawberries =\n{list_of_strawberries}".replace("[", "{\n").replace("]", "\n}").replace("'", "") 
walls = f"walls =\n{list_of_walls}".replace("[", "{\n").replace("]", "\n}").replace("'", "") 
cherries = f"cherries =\n{list_of_cherries}".replace("[", "{\n").replace("]", "\n}").replace("'", "") 
apples = f"apples =\n{list_of_apples}".replace("[", "{\n").replace("]", "\n}").replace("'", "") 
skeletons = f"skeletons =\n{list_of_skeletons}".replace("[", "{\n").replace("]", "\n}").replace("'", "") 
players = f"players =\n{list_of_players}".replace("[", "{\n").replace("]", "\n}").replace("'", "") 

print(players)
print("\n\n")
print(strawberries)
print("\n\n")
print(cherries)
print("\n\n")
print(apples)
print("\n\n")
print(voids)
print("\n\n")
print(walls)
print("\n\n")
print(skeletons)