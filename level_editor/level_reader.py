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

list_of_voids = ""
list_of_skeletons = ""
list_of_walls = ""
list_of_strawberries = ""
list_of_cherries = ""
list_of_players = ""
list_of_apples = ""

im = Image.open(sys.argv[1])
pix = im.load()

for i in range(0, 16):
    for j in range(0, 16):
        if (pix[i, j] == strawberry_rgb): list_of_strawberries += str((i)*8) + "," + str((j)*8) + ","
        if (pix[i, j] == wall_rgb): list_of_walls += str((i)*8) + "," + str((j)*8) + ","
        if (pix[i, j] == cherry_rgb): list_of_cherries += str((i)*8) + "," + str((j)*8) + ","
        if (pix[i, j] == apple_rgb):  list_of_apples += str((i)*8) + "," + str((j)*8) + ","
        if (pix[i, j] == void_rgb): list_of_voids += str((i)*8) + "," + str((j)*8) + ","
        if (pix[i, j] == skeletons_rgb): list_of_skeletons += str((i)*8) + "," + str((j)*8) + ","
        if (pix[i, j] == player_rgb):  list_of_players += str((i)*8) + "," + str((j)*8) + ","

print(f"players:\nget_coordinates_from_string\n\"{list_of_players[:-1]}\"", )
print("\n\n")
print(f"strawberries:\nget_coordinates_from_string\n\"{list_of_strawberries[:-1]}\"", )
print("\n\n")
print(f"cherries:\nget_coordinates_from_string\n\"{list_of_cherries[:-1]}\"", )
print("\n\n")
print(f"apples:\nget_coordinates_from_string\n\"{list_of_apples[:-1]}\"", )
print("\n\n")
print(f"voids:\nget_coordinates_from_string\n\"{list_of_voids[:-1]}\"", )
print("\n\n")
print(f"walls:\nget_coordinates_from_string\n\"{list_of_walls[:-1]}\"", )
print("\n\n")
print(f"skeletons:\nget_coordinates_from_string\n\"{list_of_skeletons[:-1]}\"", )
