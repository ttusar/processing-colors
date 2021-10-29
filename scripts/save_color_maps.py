import matplotlib.pyplot as plt
from matplotlib.colors import ListedColormap, LinearSegmentedColormap
import pandas as pd
import numpy as np
import os

sequential_uniform = ['viridis', 'plasma', 'inferno', 'magma', 'cividis']
sequential = ['Greys', 'Purples', 'Blues', 'Greens', 'Oranges', 'Reds', 'YlOrBr', 'YlOrRd', 'OrRd',
              'PuRd', 'RdPu', 'BuPu', 'GnBu', 'PuBu', 'YlGnBu', 'PuBuGn', 'BuGn', 'YlGn']
diverging = ['PiYG', 'PRGn', 'BrBG', 'PuOr', 'RdGy', 'RdBu', 'RdYlBu', 'RdYlGn', 'Spectral',
             'coolwarm', 'bwr', 'seismic']


def save_color_map(map_name, output_path):
    """
    Gets 256 colors from the color map and saves the [0, 1] RGB values of those colors to the
    corresponding tab-separated file in the output_path.
    """
    file_name = os.path.join(output_path, f'ColorMap-{map_name}.tsv')
    cmap = plt.get_cmap(map_name)
    colors = None
    if isinstance(cmap, LinearSegmentedColormap):
        if cmap.N == 256:
            colors = cmap(np.arange(0, 256))[:, :3]
    elif isinstance(cmap, ListedColormap):
        colors = cmap.colors
    if colors is not None:
        df = pd.DataFrame(columns=['R', 'G', 'B'], data=colors)
        df.to_csv(file_name, sep='\t', index=False)


if __name__ == '__main__':
    out_folder = os.path.join('..', 'ColorMapExample', 'ColorMaps')
    all_color_maps = sequential_uniform + sequential + diverging
    for color_map in all_color_maps:
        print(f'Working on {color_map}')
        save_color_map(color_map, out_folder)
