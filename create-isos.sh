# /bin/bash

rootuser () {
  if [[ "$EUID" = 0 ]]; then
    continue
  else
    echo "Please Run As Root"
    sleep 2
    exit
  fi
}

rootuser

echo "Cleaning up ISOs"
rm -rf out/
rm -rf GNOME/out
rm -rf XFCE/out

echo "Creating needed files"
mkdir -p out/

echo "Starting build for XFCE"
cd XFCE/
./steps.sh
cd ../
echo "Cleaning up XFCE (Main Edition) build files..."
rm -rf XFCE/work
rm -rf XFCE/ezreleng
mv XFCE/out/* out/
rm -rf XFCE/out

echo "Starting build for GNOME"
cd GNOME/
./steps.sh
cd ../
echo "Cleaning up GNOME Edition build files..."
rm -rf GNOME/work
rm -rf GNOME/ezreleng
mv GNOME/out/* out/
rm -rf GNOME/out

echo "Build finished! Check the out folder to see the ISOS!"
