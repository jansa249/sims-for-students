python

# Nástroje k pracování s cestami
import os
desktop = os.path.join(os.path.expanduser("~"), "Desktop")
output_path = os.path.join(desktop, "chignolin_ee_distances.txt")

# Měření vzdálenosti mezi koncemi proteinu automatizované pro každý snímek
distances = []
for frame in range(1, cmd.count_states("chignolin") + 1):

    d = cmd.get_distance("/chignolin//A/GLY`2/CA", "/chignolin//A/GLY`11/CA", state=frame)
    distances.append(d)

# Ukládání do souboru
with open(output_path, "w") as f:
    for d in distances:
        f.write(str(round(d, 2)) + "\n")

print("Saved to:", output_path)
python end
