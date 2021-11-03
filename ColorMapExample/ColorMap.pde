// A class to ease work with sequential and diverging color maps within the 
// Processing environment.
//
// The color maps were retrieved/copied from Python's library matplotlib
// https://matplotlib.org/stable/tutorials/colors/colormaps.html
//
// The color maps (using RGB specification) are stored in files named 
// [color-map-name].tsv that should be in the subfolder colormaps (relative to
// the placement of this script).
// 
// Currently supporeted names are:
// - sequential perceptually uniform color maps:  
// "viridis", "plasma", "inferno", "magma", "cividis"
// - other sequential color maps:
// "Greys", "Purples", "Blues", "Greens", "Oranges", "Reds", "YlOrBr", "YlOrRd", 
// "OrRd", "PuRd", "RdPu", "BuPu", "GnBu", "PuBu", "YlGnBu", "PuBuGn", "BuGn", "YlGn"
// - diverging color maps:
// "PiYG", "PRGn", "BrBG", "PuOr", "RdGy", "RdBu", "RdYlBu", "RdYlGn", 
// "Spectral", "coolwarm", "bwr", "seismic"};
//

class ColorMap {
  String name;
  color[] colors;
  
  ColorMap(String mapName) {
    int colorCount = 256;
    name = mapName;
    colors = new color[colorCount];  
    Table table = loadTable("colormaps/" + name + ".tsv", "header");
    colorMode(RGB, 1);
    for (int i = 0; i < colorCount; i++) {
      TableRow row = table.getRow(i);
      colors[i] = color(row.getFloat("R"), row.getFloat("G"), row.getFloat("B"));
    }
  }
  
  color getColorIndex(int index) {
    return colors[index];
  }
  
  color getColor(float value) {
    int index = int(value * 256);
    return getColorIndex(index);
  }
}
