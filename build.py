# 🍣 Maki Client - .mcpack Builder (Python 3)
# Plattformübergreifend (Windows, Mac, Linux)

import os
import shutil
import zipfile
import sys

def build_mcpack():
    print("\n" + "="*50)
    print(" 🍣 Maki Client .mcpack Builder")
    print("="*50 + "\n")
    
    temp_dir = "temp_mcpack"
    output_file = "Maki-Client.mcpack"
    
    if os.path.exists(temp_dir):
        print(f"[1/4] Lösche alten {temp_dir}...")
        shutil.rmtree(temp_dir)
    
    print("[1/4] Erstelle temp_mcpack...")
    os.makedirs(temp_dir, exist_ok=True)
    
    print("[2/4] Kopiere behavior_pack...")
    if os.path.exists("behavior_pack"):
        shutil.copytree("behavior_pack", f"{temp_dir}/behavior_pack")
    
    print("[3/4] Kopiere resource_pack...")
    if os.path.exists("resource_pack"):
        shutil.copytree("resource_pack", f"{temp_dir}/resource_pack")
    
    print(f"[4/4] Erstelle {output_file}...")
    if os.path.exists(output_file):
        os.remove(output_file)
    
    with zipfile.ZipFile(output_file, 'w', zipfile.ZIP_DEFLATED) as zipf:
        for root, dirs, files in os.walk(temp_dir):
            for file in files:
                file_path = os.path.join(root, file)
                arcname = os.path.relpath(file_path, temp_dir)
                zipf.write(file_path, arcname)
    
    print("Bereinige temp Dateien...")
    shutil.rmtree(temp_dir)
    
    print("\n" + "="*50)
    print(" ✓ FERTIG!")
    print("="*50)
    print(f"\nDie Datei '{output_file}' wurde erfolgreich erstellt!\n")

if __name__ == "__main__":
    try:
        build_mcpack()
    except Exception as e:
        print(f"\n✗ Fehler: {e}")
        sys.exit(1)
