#!/bin/bash
# 🍣 Maki Client - .mcpack Builder (Mac/Linux)
# Erstellt automatisch die fertige .mcpack Datei

echo ""
echo "========================================"
echo " 🍣 Maki Client .mcpack Builder"
echo "========================================"
echo ""

# Temp-Ordner erstellen
rm -rf temp_mcpack
mkdir -p temp_mcpack

echo "[1/4] Kopiere behavior_pack..."
cp -r behavior_pack temp_mcpack/behavior_pack

echo "[2/4] Kopiere resource_pack..."
cp -r resource_pack temp_mcpack/resource_pack

echo "[3/4] Erstelle .mcpack (ZIP)..."
cd temp_mcpack
zip -r ../Maki-Client.mcpack . -q
cd ..

echo "[4/4] Bereinige temp Dateien..."
rm -rf temp_mcpack

echo ""
echo "✓ FERTIG!"
echo ""
echo "Die Datei 'Maki-Client.mcpack' wurde erstellt!"
echo ""
