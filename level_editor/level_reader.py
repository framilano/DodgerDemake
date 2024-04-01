from PIL import Image
import sys

background = (0, 0, 0)
void = (84, 84, 84)
wall = (255, 255, 255)
strawberry = (255, 0, 0)
cherry = (225, 0, 255)

list_of_voids = []
list_of_walls = []
list_of_strawberries = []
list_of_cherries = []

im = Image.open(sys.argv[1])
pix = im.load()

for i in range(0, 14):
    for j in range(0, 14):
        #print(pix[i, j])
        if (pix[i, j] == strawberry): list_of_strawberries.append("{" + str((i + 1)*8) + ", " + str((j + 1)*8) +"}")
        if (pix[i, j] == wall): list_of_walls.append("{" + str((i + 1)*8) + ", " + str((j + 1)*8) +"}")
        if (pix[i, j] == cherry): list_of_cherries.append("{" + str((i + 1)*8) + ", " + str((j + 1)*8) +"}")
        if (pix[i, j] == void): list_of_voids.append("{" + str((i + 1)*8) + ", " + str((j + 1)*8) +"}")

voids = f"voids =\n{list_of_voids}".replace("[", "{").replace("]", "}").replace("'", "") 
strawberries = f"strawberries =\n{list_of_strawberries}".replace("[", "{").replace("]", "}").replace("'", "") 
walls = f"walls =\n{list_of_walls}".replace("[", "{").replace("]", "}").replace("'", "") 
cherries = f"cherries =\n{list_of_cherries}".replace("[", "{").replace("]", "}").replace("'", "") 
print(voids)
print("\n\n")
print(strawberries)
print("\n\n")
print(walls)
print("\n\n")
print(cherries)