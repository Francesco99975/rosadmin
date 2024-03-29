import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

class AppTheme {
  late ThemeData current;
  late bool isDark;

  AppTheme({required this.current, required this.isDark});

  static ThemeData dark = ThemeDecoder.decodeThemeData({
    "applyElevationOverlayColor": true,
    "brightness": "dark",
    "buttonTheme": {
      "alignedDropdown": false,
      "colorScheme": {
        "background": "#ff25002a",
        "brightness": "dark",
        "error": "#ffffb4ab",
        "errorContainer": "#ff93000a",
        "inversePrimary": "#ff006a60",
        "inverseSurface": "#ffe0e3e1",
        "onBackground": "#fffff7fb",
        "onError": "#ff690005",
        "onErrorContainer": "#ffffb4ab",
        "onInverseSurface": "#ff2d3130",
        "onPrimary": "#ff003731",
        "onPrimaryContainer": "#ff92f4e5",
        "onSecondary": "#ff1c3531",
        "onSecondaryContainer": "#ffcce8e2",
        "onSurface": "#fffff7f9",
        "onSurfaceVariant": "#ffbec9c6",
        "onTertiary": "#ff153349",
        "onTertiaryContainer": "#ffcce5ff",
        "outline": "#ff899390",
        "outlineVariant": "#ff3f4947",
        "primary": "#ff53dbc9",
        "primaryContainer": "#ff005048",
        "scrim": "#ff000000",
        "secondary": "#ffb1ccc6",
        "secondaryContainer": "#ff334b47",
        "shadow": "#ff000000",
        "surface": "#ff390036",
        "surfaceTint": "#ff53dbc9",
        "surfaceVariant": "#ff3f4947",
        "tertiary": "#ffadcae6",
        "tertiaryContainer": "#ff2d4961"
      },
      "height": 36,
      "layoutBehavior": "padded",
      "minWidth": 88,
      "padding": {"bottom": 0, "left": 16, "right": 16, "top": 0},
      "shape": {
        "borderRadius": {
          "bottomLeft": {"type": "elliptical", "x": 2, "y": 2},
          "bottomRight": {"type": "elliptical", "x": 2, "y": 2},
          "topLeft": {"type": "elliptical", "x": 2, "y": 2},
          "topRight": {"type": "elliptical", "x": 2, "y": 2},
          "type": "only"
        },
        "side": {
          "color": "#ff000000",
          "strokeAlign": -1,
          "style": "none",
          "width": 0
        },
        "type": "rounded"
      },
      "textTheme": "normal"
    },
    "canvasColor": "#ff25002a",
    "cardColor": "#ff390036",
    "colorScheme": {
      "background": "#ff25002a",
      "brightness": "dark",
      "error": "#ffffb4ab",
      "errorContainer": "#ff93000a",
      "inversePrimary": "#ff006a60",
      "inverseSurface": "#ffe0e3e1",
      "onBackground": "#fffff7fb",
      "onError": "#ff690005",
      "onErrorContainer": "#ffffb4ab",
      "onInverseSurface": "#ff2d3130",
      "onPrimary": "#ff003731",
      "onPrimaryContainer": "#ff92f4e5",
      "onSecondary": "#ff1c3531",
      "onSecondaryContainer": "#ffcce8e2",
      "onSurface": "#fffff7f9",
      "onSurfaceVariant": "#ffbec9c6",
      "onTertiary": "#ff153349",
      "onTertiaryContainer": "#ffcce5ff",
      "outline": "#ff899390",
      "outlineVariant": "#ff3f4947",
      "primary": "#ff53dbc9",
      "primaryContainer": "#ff005048",
      "scrim": "#ff000000",
      "secondary": "#ffb1ccc6",
      "secondaryContainer": "#ff334b47",
      "shadow": "#ff000000",
      "surface": "#ff390036",
      "surfaceTint": "#ff53dbc9",
      "surfaceVariant": "#ff3f4947",
      "tertiary": "#ffadcae6",
      "tertiaryContainer": "#ff2d4961"
    },
    "dialogBackgroundColor": "#ff25002a",
    "disabledColor": "#62ffffff",
    "dividerColor": "#1ffff7f9",
    "focusColor": "#1fffffff",
    "highlightColor": "#40cccccc",
    "hintColor": "#99ffffff",
    "hoverColor": "#0affffff",
    "iconTheme": {"color": "#ffffffff"},
    "indicatorColor": "#fffff7f9",
    "inputDecorationTheme": {
      "alignLabelWithHint": false,
      "filled": false,
      "floatingLabelAlignment": "start",
      "floatingLabelBehavior": "auto",
      "isCollapsed": false,
      "isDense": false
    },
    "materialTapTargetSize": "shrinkWrap",
    "platform": "linux",
    "primaryColor": "#ff390036",
    "primaryColorDark": "#ff000000",
    "primaryColorLight": "#ff9e9e9e",
    "primaryIconTheme": {"color": "#ffffffff"},
    "primaryTextTheme": {
      "bodyLarge": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 16,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0.5,
        "textBaseline": "alphabetic"
      },
      "bodyMedium": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 14,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0.25,
        "textBaseline": "alphabetic"
      },
      "bodySmall": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 12,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0.4,
        "textBaseline": "alphabetic"
      },
      "displayLarge": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 96,
        "fontWeight": "w300",
        "inherit": false,
        "letterSpacing": -1.5,
        "textBaseline": "alphabetic"
      },
      "displayMedium": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 60,
        "fontWeight": "w300",
        "inherit": false,
        "letterSpacing": -0.5,
        "textBaseline": "alphabetic"
      },
      "displaySmall": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 48,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0,
        "textBaseline": "alphabetic"
      },
      "headlineLarge": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 40,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0.25,
        "textBaseline": "alphabetic"
      },
      "headlineMedium": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 34,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0.25,
        "textBaseline": "alphabetic"
      },
      "headlineSmall": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 24,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0,
        "textBaseline": "alphabetic"
      },
      "labelLarge": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 14,
        "fontWeight": "w500",
        "inherit": false,
        "letterSpacing": 1.25,
        "textBaseline": "alphabetic"
      },
      "labelMedium": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 11,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 1.5,
        "textBaseline": "alphabetic"
      },
      "labelSmall": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 10,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 1.5,
        "textBaseline": "alphabetic"
      },
      "titleLarge": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 20,
        "fontWeight": "w500",
        "inherit": false,
        "letterSpacing": 0.15,
        "textBaseline": "alphabetic"
      },
      "titleMedium": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 16,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0.15,
        "textBaseline": "alphabetic"
      },
      "titleSmall": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 14,
        "fontWeight": "w500",
        "inherit": false,
        "letterSpacing": 0.1,
        "textBaseline": "alphabetic"
      }
    },
    "scaffoldBackgroundColor": "#ff25002a",
    "secondaryHeaderColor": "#ff616161",
    "shadowColor": "#ff000000",
    "splashColor": "#40cccccc",
    "splashFactory": "ripple",
    "textTheme": {
      "bodyLarge": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 16,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0.5,
        "textBaseline": "alphabetic"
      },
      "bodyMedium": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 14,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0.25,
        "textBaseline": "alphabetic"
      },
      "bodySmall": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 12,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0.4,
        "textBaseline": "alphabetic"
      },
      "displayLarge": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 96,
        "fontWeight": "w300",
        "inherit": false,
        "letterSpacing": -1.5,
        "textBaseline": "alphabetic"
      },
      "displayMedium": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 60,
        "fontWeight": "w300",
        "inherit": false,
        "letterSpacing": -0.5,
        "textBaseline": "alphabetic"
      },
      "displaySmall": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 48,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0,
        "textBaseline": "alphabetic"
      },
      "headlineLarge": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 40,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0.25,
        "textBaseline": "alphabetic"
      },
      "headlineMedium": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 34,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0.25,
        "textBaseline": "alphabetic"
      },
      "headlineSmall": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 24,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0,
        "textBaseline": "alphabetic"
      },
      "labelLarge": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 14,
        "fontWeight": "w500",
        "inherit": false,
        "letterSpacing": 1.25,
        "textBaseline": "alphabetic"
      },
      "labelMedium": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 11,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 1.5,
        "textBaseline": "alphabetic"
      },
      "labelSmall": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 10,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 1.5,
        "textBaseline": "alphabetic"
      },
      "titleLarge": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 20,
        "fontWeight": "w500",
        "inherit": false,
        "letterSpacing": 0.15,
        "textBaseline": "alphabetic"
      },
      "titleMedium": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 16,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0.15,
        "textBaseline": "alphabetic"
      },
      "titleSmall": {
        "color": "#fffff7f9",
        "decoration": "none",
        "decorationColor": "#fffff7f9",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 14,
        "fontWeight": "w500",
        "inherit": false,
        "letterSpacing": 0.1,
        "textBaseline": "alphabetic"
      }
    },
    "typography": {
      "black": {
        "bodyLarge": {
          "color": "#ff390036",
          "decoration": "none",
          "decorationColor": "#ff390036",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "bodyMedium": {
          "color": "#ff390036",
          "decoration": "none",
          "decorationColor": "#ff390036",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "bodySmall": {
          "color": "#ff390036",
          "decoration": "none",
          "decorationColor": "#ff390036",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "displayLarge": {
          "color": "#ff390036",
          "decoration": "none",
          "decorationColor": "#ff390036",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "displayMedium": {
          "color": "#ff390036",
          "decoration": "none",
          "decorationColor": "#ff390036",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "displaySmall": {
          "color": "#ff390036",
          "decoration": "none",
          "decorationColor": "#ff390036",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "headlineLarge": {
          "color": "#ff390036",
          "decoration": "none",
          "decorationColor": "#ff390036",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "headlineMedium": {
          "color": "#ff390036",
          "decoration": "none",
          "decorationColor": "#ff390036",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "headlineSmall": {
          "color": "#ff390036",
          "decoration": "none",
          "decorationColor": "#ff390036",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "labelLarge": {
          "color": "#ff390036",
          "decoration": "none",
          "decorationColor": "#ff390036",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "labelMedium": {
          "color": "#ff390036",
          "decoration": "none",
          "decorationColor": "#ff390036",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "labelSmall": {
          "color": "#ff390036",
          "decoration": "none",
          "decorationColor": "#ff390036",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "titleLarge": {
          "color": "#ff390036",
          "decoration": "none",
          "decorationColor": "#ff390036",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "titleMedium": {
          "color": "#ff390036",
          "decoration": "none",
          "decorationColor": "#ff390036",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "titleSmall": {
          "color": "#ff390036",
          "decoration": "none",
          "decorationColor": "#ff390036",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        }
      },
      "dense": {
        "bodyLarge": {
          "fontSize": 16,
          "fontWeight": "w400",
          "height": 1.5,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.5,
          "textBaseline": "ideographic"
        },
        "bodyMedium": {
          "fontSize": 14,
          "fontWeight": "w400",
          "height": 1.43,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.25,
          "textBaseline": "ideographic"
        },
        "bodySmall": {
          "fontSize": 12,
          "fontWeight": "w400",
          "height": 1.33,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.4,
          "textBaseline": "ideographic"
        },
        "displayLarge": {
          "fontSize": 57,
          "fontWeight": "w400",
          "height": 1.12,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": -0.25,
          "textBaseline": "ideographic"
        },
        "displayMedium": {
          "fontSize": 45,
          "fontWeight": "w400",
          "height": 1.16,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "ideographic"
        },
        "displaySmall": {
          "fontSize": 36,
          "fontWeight": "w400",
          "height": 1.22,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "ideographic"
        },
        "headlineLarge": {
          "fontSize": 32,
          "fontWeight": "w400",
          "height": 1.25,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "ideographic"
        },
        "headlineMedium": {
          "fontSize": 28,
          "fontWeight": "w400",
          "height": 1.29,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "ideographic"
        },
        "headlineSmall": {
          "fontSize": 24,
          "fontWeight": "w400",
          "height": 1.33,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "ideographic"
        },
        "labelLarge": {
          "fontSize": 14,
          "fontWeight": "w500",
          "height": 1.43,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.1,
          "textBaseline": "ideographic"
        },
        "labelMedium": {
          "fontSize": 12,
          "fontWeight": "w500",
          "height": 1.33,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.5,
          "textBaseline": "ideographic"
        },
        "labelSmall": {
          "fontSize": 11,
          "fontWeight": "w500",
          "height": 1.45,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.5,
          "textBaseline": "ideographic"
        },
        "titleLarge": {
          "fontSize": 22,
          "fontWeight": "w400",
          "height": 1.27,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "ideographic"
        },
        "titleMedium": {
          "fontSize": 16,
          "fontWeight": "w500",
          "height": 1.5,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.15,
          "textBaseline": "ideographic"
        },
        "titleSmall": {
          "fontSize": 14,
          "fontWeight": "w500",
          "height": 1.43,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.1,
          "textBaseline": "ideographic"
        }
      },
      "englishLike": {
        "bodyLarge": {
          "fontSize": 16,
          "fontWeight": "w400",
          "height": 1.5,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.5,
          "textBaseline": "alphabetic"
        },
        "bodyMedium": {
          "fontSize": 14,
          "fontWeight": "w400",
          "height": 1.43,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.25,
          "textBaseline": "alphabetic"
        },
        "bodySmall": {
          "fontSize": 12,
          "fontWeight": "w400",
          "height": 1.33,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.4,
          "textBaseline": "alphabetic"
        },
        "displayLarge": {
          "fontSize": 57,
          "fontWeight": "w400",
          "height": 1.12,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": -0.25,
          "textBaseline": "alphabetic"
        },
        "displayMedium": {
          "fontSize": 45,
          "fontWeight": "w400",
          "height": 1.16,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "displaySmall": {
          "fontSize": 36,
          "fontWeight": "w400",
          "height": 1.22,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "headlineLarge": {
          "fontSize": 32,
          "fontWeight": "w400",
          "height": 1.25,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "headlineMedium": {
          "fontSize": 28,
          "fontWeight": "w400",
          "height": 1.29,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "headlineSmall": {
          "fontSize": 24,
          "fontWeight": "w400",
          "height": 1.33,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "labelLarge": {
          "fontSize": 14,
          "fontWeight": "w500",
          "height": 1.43,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.1,
          "textBaseline": "alphabetic"
        },
        "labelMedium": {
          "fontSize": 12,
          "fontWeight": "w500",
          "height": 1.33,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.5,
          "textBaseline": "alphabetic"
        },
        "labelSmall": {
          "fontSize": 11,
          "fontWeight": "w500",
          "height": 1.45,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.5,
          "textBaseline": "alphabetic"
        },
        "titleLarge": {
          "fontSize": 22,
          "fontWeight": "w400",
          "height": 1.27,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "titleMedium": {
          "fontSize": 16,
          "fontWeight": "w500",
          "height": 1.5,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.15,
          "textBaseline": "alphabetic"
        },
        "titleSmall": {
          "fontSize": 14,
          "fontWeight": "w500",
          "height": 1.43,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.1,
          "textBaseline": "alphabetic"
        }
      },
      "tall": {
        "bodyLarge": {
          "fontSize": 16,
          "fontWeight": "w400",
          "height": 1.5,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.5,
          "textBaseline": "alphabetic"
        },
        "bodyMedium": {
          "fontSize": 14,
          "fontWeight": "w400",
          "height": 1.43,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.25,
          "textBaseline": "alphabetic"
        },
        "bodySmall": {
          "fontSize": 12,
          "fontWeight": "w400",
          "height": 1.33,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.4,
          "textBaseline": "alphabetic"
        },
        "displayLarge": {
          "fontSize": 57,
          "fontWeight": "w400",
          "height": 1.12,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": -0.25,
          "textBaseline": "alphabetic"
        },
        "displayMedium": {
          "fontSize": 45,
          "fontWeight": "w400",
          "height": 1.16,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "displaySmall": {
          "fontSize": 36,
          "fontWeight": "w400",
          "height": 1.22,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "headlineLarge": {
          "fontSize": 32,
          "fontWeight": "w400",
          "height": 1.25,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "headlineMedium": {
          "fontSize": 28,
          "fontWeight": "w400",
          "height": 1.29,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "headlineSmall": {
          "fontSize": 24,
          "fontWeight": "w400",
          "height": 1.33,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "labelLarge": {
          "fontSize": 14,
          "fontWeight": "w500",
          "height": 1.43,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.1,
          "textBaseline": "alphabetic"
        },
        "labelMedium": {
          "fontSize": 12,
          "fontWeight": "w500",
          "height": 1.33,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.5,
          "textBaseline": "alphabetic"
        },
        "labelSmall": {
          "fontSize": 11,
          "fontWeight": "w500",
          "height": 1.45,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.5,
          "textBaseline": "alphabetic"
        },
        "titleLarge": {
          "fontSize": 22,
          "fontWeight": "w400",
          "height": 1.27,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "titleMedium": {
          "fontSize": 16,
          "fontWeight": "w500",
          "height": 1.5,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.15,
          "textBaseline": "alphabetic"
        },
        "titleSmall": {
          "fontSize": 14,
          "fontWeight": "w500",
          "height": 1.43,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.1,
          "textBaseline": "alphabetic"
        }
      },
      "white": {
        "bodyLarge": {
          "color": "#fffff7f9",
          "decoration": "none",
          "decorationColor": "#fffff7f9",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "bodyMedium": {
          "color": "#fffff7f9",
          "decoration": "none",
          "decorationColor": "#fffff7f9",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "bodySmall": {
          "color": "#fffff7f9",
          "decoration": "none",
          "decorationColor": "#fffff7f9",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "displayLarge": {
          "color": "#fffff7f9",
          "decoration": "none",
          "decorationColor": "#fffff7f9",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "displayMedium": {
          "color": "#fffff7f9",
          "decoration": "none",
          "decorationColor": "#fffff7f9",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "displaySmall": {
          "color": "#fffff7f9",
          "decoration": "none",
          "decorationColor": "#fffff7f9",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "headlineLarge": {
          "color": "#fffff7f9",
          "decoration": "none",
          "decorationColor": "#fffff7f9",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "headlineMedium": {
          "color": "#fffff7f9",
          "decoration": "none",
          "decorationColor": "#fffff7f9",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "headlineSmall": {
          "color": "#fffff7f9",
          "decoration": "none",
          "decorationColor": "#fffff7f9",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "labelLarge": {
          "color": "#fffff7f9",
          "decoration": "none",
          "decorationColor": "#fffff7f9",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "labelMedium": {
          "color": "#fffff7f9",
          "decoration": "none",
          "decorationColor": "#fffff7f9",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "labelSmall": {
          "color": "#fffff7f9",
          "decoration": "none",
          "decorationColor": "#fffff7f9",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "titleLarge": {
          "color": "#fffff7f9",
          "decoration": "none",
          "decorationColor": "#fffff7f9",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "titleMedium": {
          "color": "#fffff7f9",
          "decoration": "none",
          "decorationColor": "#fffff7f9",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "titleSmall": {
          "color": "#fffff7f9",
          "decoration": "none",
          "decorationColor": "#fffff7f9",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        }
      }
    },
    "unselectedWidgetColor": "#b3ffffff",
    "useMaterial3": true,
    "visualDensity": "compact"
  })!;

  static ThemeData light = ThemeDecoder.decodeThemeData({
    "applyElevationOverlayColor": false,
    "brightness": "light",
    "buttonTheme": {
      "alignedDropdown": false,
      "colorScheme": {
        "background": "#fffdfcff",
        "brightness": "light",
        "error": "#ffba1a1a",
        "errorContainer": "#ffffdad6",
        "inversePrimary": "#ff53dbc9",
        "inverseSurface": "#ff2d3130",
        "onBackground": "#ff260026",
        "onError": "#ffffffff",
        "onErrorContainer": "#ff410002",
        "onInverseSurface": "#ffeff1ef",
        "onPrimary": "#ffffffff",
        "onPrimaryContainer": "#ff00201c",
        "onSecondary": "#ffffffff",
        "onSecondaryContainer": "#ff05201c",
        "onSurface": "#ff58124b",
        "onSurfaceVariant": "#ff3f4947",
        "onTertiary": "#ffffffff",
        "onTertiaryContainer": "#ff001e31",
        "outline": "#ff6f7977",
        "outlineVariant": "#ffbec9c6",
        "primary": "#ff006a60",
        "primaryContainer": "#ff92f4e5",
        "scrim": "#ff000000",
        "secondary": "#ff4a635f",
        "secondaryContainer": "#ffcce8e2",
        "shadow": "#ff000000",
        "surface": "#fffdfbff",
        "surfaceTint": "#ff006a60",
        "surfaceVariant": "#ffdae5e1",
        "tertiary": "#ff456179",
        "tertiaryContainer": "#ffcce5ff"
      },
      "height": 36,
      "layoutBehavior": "padded",
      "minWidth": 88,
      "padding": {"bottom": 0, "left": 16, "right": 16, "top": 0},
      "shape": {
        "borderRadius": {
          "bottomLeft": {"type": "elliptical", "x": 2, "y": 2},
          "bottomRight": {"type": "elliptical", "x": 2, "y": 2},
          "topLeft": {"type": "elliptical", "x": 2, "y": 2},
          "topRight": {"type": "elliptical", "x": 2, "y": 2},
          "type": "only"
        },
        "side": {
          "color": "#ff000000",
          "strokeAlign": -1,
          "style": "none",
          "width": 0
        },
        "type": "rounded"
      },
      "textTheme": "normal"
    },
    "canvasColor": "#fffdfcff",
    "cardColor": "#fffdfbff",
    "colorScheme": {
      "background": "#fffdfcff",
      "brightness": "light",
      "error": "#ffba1a1a",
      "errorContainer": "#ffffdad6",
      "inversePrimary": "#ff53dbc9",
      "inverseSurface": "#ff2d3130",
      "onBackground": "#ff260026",
      "onError": "#ffffffff",
      "onErrorContainer": "#ff410002",
      "onInverseSurface": "#ffeff1ef",
      "onPrimary": "#ffffffff",
      "onPrimaryContainer": "#ff00201c",
      "onSecondary": "#ffffffff",
      "onSecondaryContainer": "#ff05201c",
      "onSurface": "#ff58124b",
      "onSurfaceVariant": "#ff3f4947",
      "onTertiary": "#ffffffff",
      "onTertiaryContainer": "#ff001e31",
      "outline": "#ff6f7977",
      "outlineVariant": "#ffbec9c6",
      "primary": "#ff006a60",
      "primaryContainer": "#ff92f4e5",
      "scrim": "#ff000000",
      "secondary": "#ff4a635f",
      "secondaryContainer": "#ffcce8e2",
      "shadow": "#ff000000",
      "surface": "#fffdfbff",
      "surfaceTint": "#ff006a60",
      "surfaceVariant": "#ffdae5e1",
      "tertiary": "#ff456179",
      "tertiaryContainer": "#ffcce5ff"
    },
    "dialogBackgroundColor": "#fffdfcff",
    "disabledColor": "#61000000",
    "dividerColor": "#1f58124b",
    "focusColor": "#1f000000",
    "highlightColor": "#66bcbcbc",
    "hintColor": "#99000000",
    "hoverColor": "#0a000000",
    "iconTheme": {"color": "#dd000000"},
    "indicatorColor": "#ffffffff",
    "inputDecorationTheme": {
      "alignLabelWithHint": false,
      "filled": false,
      "floatingLabelAlignment": "start",
      "floatingLabelBehavior": "auto",
      "isCollapsed": false,
      "isDense": false
    },
    "materialTapTargetSize": "shrinkWrap",
    "platform": "linux",
    "primaryColor": "#ff006a60",
    "primaryColorDark": "#ff1976d2",
    "primaryColorLight": "#ffbbdefb",
    "primaryIconTheme": {"color": "#ffffffff"},
    "primaryTextTheme": {
      "bodyLarge": {
        "color": "#fffdfbff",
        "decoration": "none",
        "decorationColor": "#fffdfbff",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 16,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0.5,
        "textBaseline": "alphabetic"
      },
      "bodyMedium": {
        "color": "#fffdfbff",
        "decoration": "none",
        "decorationColor": "#fffdfbff",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 14,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0.25,
        "textBaseline": "alphabetic"
      },
      "bodySmall": {
        "color": "#fffdfbff",
        "decoration": "none",
        "decorationColor": "#fffdfbff",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 12,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0.4,
        "textBaseline": "alphabetic"
      },
      "displayLarge": {
        "color": "#fffdfbff",
        "decoration": "none",
        "decorationColor": "#fffdfbff",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 96,
        "fontWeight": "w300",
        "inherit": false,
        "letterSpacing": -1.5,
        "textBaseline": "alphabetic"
      },
      "displayMedium": {
        "color": "#fffdfbff",
        "decoration": "none",
        "decorationColor": "#fffdfbff",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 60,
        "fontWeight": "w300",
        "inherit": false,
        "letterSpacing": -0.5,
        "textBaseline": "alphabetic"
      },
      "displaySmall": {
        "color": "#fffdfbff",
        "decoration": "none",
        "decorationColor": "#fffdfbff",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 48,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0,
        "textBaseline": "alphabetic"
      },
      "headlineLarge": {
        "color": "#fffdfbff",
        "decoration": "none",
        "decorationColor": "#fffdfbff",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 40,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0.25,
        "textBaseline": "alphabetic"
      },
      "headlineMedium": {
        "color": "#fffdfbff",
        "decoration": "none",
        "decorationColor": "#fffdfbff",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 34,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0.25,
        "textBaseline": "alphabetic"
      },
      "headlineSmall": {
        "color": "#fffdfbff",
        "decoration": "none",
        "decorationColor": "#fffdfbff",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 24,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0,
        "textBaseline": "alphabetic"
      },
      "labelLarge": {
        "color": "#fffdfbff",
        "decoration": "none",
        "decorationColor": "#fffdfbff",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 14,
        "fontWeight": "w500",
        "inherit": false,
        "letterSpacing": 1.25,
        "textBaseline": "alphabetic"
      },
      "labelMedium": {
        "color": "#fffdfbff",
        "decoration": "none",
        "decorationColor": "#fffdfbff",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 11,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 1.5,
        "textBaseline": "alphabetic"
      },
      "labelSmall": {
        "color": "#fffdfbff",
        "decoration": "none",
        "decorationColor": "#fffdfbff",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 10,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 1.5,
        "textBaseline": "alphabetic"
      },
      "titleLarge": {
        "color": "#fffdfbff",
        "decoration": "none",
        "decorationColor": "#fffdfbff",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 20,
        "fontWeight": "w500",
        "inherit": false,
        "letterSpacing": 0.15,
        "textBaseline": "alphabetic"
      },
      "titleMedium": {
        "color": "#fffdfbff",
        "decoration": "none",
        "decorationColor": "#fffdfbff",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 16,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0.15,
        "textBaseline": "alphabetic"
      },
      "titleSmall": {
        "color": "#fffdfbff",
        "decoration": "none",
        "decorationColor": "#fffdfbff",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 14,
        "fontWeight": "w500",
        "inherit": false,
        "letterSpacing": 0.1,
        "textBaseline": "alphabetic"
      }
    },
    "scaffoldBackgroundColor": "#fffdfcff",
    "secondaryHeaderColor": "#ffe3f2fd",
    "shadowColor": "#ff000000",
    "splashColor": "#66c8c8c8",
    "splashFactory": "ripple",
    "textTheme": {
      "bodyLarge": {
        "color": "#ff58124b",
        "decoration": "none",
        "decorationColor": "#ff58124b",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 16,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0.5,
        "textBaseline": "alphabetic"
      },
      "bodyMedium": {
        "color": "#ff58124b",
        "decoration": "none",
        "decorationColor": "#ff58124b",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 14,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0.25,
        "textBaseline": "alphabetic"
      },
      "bodySmall": {
        "color": "#ff58124b",
        "decoration": "none",
        "decorationColor": "#ff58124b",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 12,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0.4,
        "textBaseline": "alphabetic"
      },
      "displayLarge": {
        "color": "#ff58124b",
        "decoration": "none",
        "decorationColor": "#ff58124b",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 96,
        "fontWeight": "w300",
        "inherit": false,
        "letterSpacing": -1.5,
        "textBaseline": "alphabetic"
      },
      "displayMedium": {
        "color": "#ff58124b",
        "decoration": "none",
        "decorationColor": "#ff58124b",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 60,
        "fontWeight": "w300",
        "inherit": false,
        "letterSpacing": -0.5,
        "textBaseline": "alphabetic"
      },
      "displaySmall": {
        "color": "#ff58124b",
        "decoration": "none",
        "decorationColor": "#ff58124b",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 48,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0,
        "textBaseline": "alphabetic"
      },
      "headlineLarge": {
        "color": "#ff58124b",
        "decoration": "none",
        "decorationColor": "#ff58124b",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 40,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0.25,
        "textBaseline": "alphabetic"
      },
      "headlineMedium": {
        "color": "#ff58124b",
        "decoration": "none",
        "decorationColor": "#ff58124b",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 34,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0.25,
        "textBaseline": "alphabetic"
      },
      "headlineSmall": {
        "color": "#ff58124b",
        "decoration": "none",
        "decorationColor": "#ff58124b",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 24,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0,
        "textBaseline": "alphabetic"
      },
      "labelLarge": {
        "color": "#ff58124b",
        "decoration": "none",
        "decorationColor": "#ff58124b",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 14,
        "fontWeight": "w500",
        "inherit": false,
        "letterSpacing": 1.25,
        "textBaseline": "alphabetic"
      },
      "labelMedium": {
        "color": "#ff58124b",
        "decoration": "none",
        "decorationColor": "#ff58124b",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 11,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 1.5,
        "textBaseline": "alphabetic"
      },
      "labelSmall": {
        "color": "#ff58124b",
        "decoration": "none",
        "decorationColor": "#ff58124b",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 10,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 1.5,
        "textBaseline": "alphabetic"
      },
      "titleLarge": {
        "color": "#ff58124b",
        "decoration": "none",
        "decorationColor": "#ff58124b",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 20,
        "fontWeight": "w500",
        "inherit": false,
        "letterSpacing": 0.15,
        "textBaseline": "alphabetic"
      },
      "titleMedium": {
        "color": "#ff58124b",
        "decoration": "none",
        "decorationColor": "#ff58124b",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 16,
        "fontWeight": "w400",
        "inherit": false,
        "letterSpacing": 0.15,
        "textBaseline": "alphabetic"
      },
      "titleSmall": {
        "color": "#ff58124b",
        "decoration": "none",
        "decorationColor": "#ff58124b",
        "fontFamily": "Roboto",
        "fontFamilyFallback": [
          "Ubuntu",
          "Cantarell",
          "DejaVu Sans",
          "Liberation Sans",
          "Arial"
        ],
        "fontSize": 14,
        "fontWeight": "w500",
        "inherit": false,
        "letterSpacing": 0.1,
        "textBaseline": "alphabetic"
      }
    },
    "typography": {
      "black": {
        "bodyLarge": {
          "color": "#ff58124b",
          "decoration": "none",
          "decorationColor": "#ff58124b",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "bodyMedium": {
          "color": "#ff58124b",
          "decoration": "none",
          "decorationColor": "#ff58124b",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "bodySmall": {
          "color": "#ff58124b",
          "decoration": "none",
          "decorationColor": "#ff58124b",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "displayLarge": {
          "color": "#ff58124b",
          "decoration": "none",
          "decorationColor": "#ff58124b",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "displayMedium": {
          "color": "#ff58124b",
          "decoration": "none",
          "decorationColor": "#ff58124b",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "displaySmall": {
          "color": "#ff58124b",
          "decoration": "none",
          "decorationColor": "#ff58124b",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "headlineLarge": {
          "color": "#ff58124b",
          "decoration": "none",
          "decorationColor": "#ff58124b",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "headlineMedium": {
          "color": "#ff58124b",
          "decoration": "none",
          "decorationColor": "#ff58124b",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "headlineSmall": {
          "color": "#ff58124b",
          "decoration": "none",
          "decorationColor": "#ff58124b",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "labelLarge": {
          "color": "#ff58124b",
          "decoration": "none",
          "decorationColor": "#ff58124b",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "labelMedium": {
          "color": "#ff58124b",
          "decoration": "none",
          "decorationColor": "#ff58124b",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "labelSmall": {
          "color": "#ff58124b",
          "decoration": "none",
          "decorationColor": "#ff58124b",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "titleLarge": {
          "color": "#ff58124b",
          "decoration": "none",
          "decorationColor": "#ff58124b",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "titleMedium": {
          "color": "#ff58124b",
          "decoration": "none",
          "decorationColor": "#ff58124b",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "titleSmall": {
          "color": "#ff58124b",
          "decoration": "none",
          "decorationColor": "#ff58124b",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        }
      },
      "dense": {
        "bodyLarge": {
          "fontSize": 16,
          "fontWeight": "w400",
          "height": 1.5,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.5,
          "textBaseline": "ideographic"
        },
        "bodyMedium": {
          "fontSize": 14,
          "fontWeight": "w400",
          "height": 1.43,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.25,
          "textBaseline": "ideographic"
        },
        "bodySmall": {
          "fontSize": 12,
          "fontWeight": "w400",
          "height": 1.33,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.4,
          "textBaseline": "ideographic"
        },
        "displayLarge": {
          "fontSize": 57,
          "fontWeight": "w400",
          "height": 1.12,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": -0.25,
          "textBaseline": "ideographic"
        },
        "displayMedium": {
          "fontSize": 45,
          "fontWeight": "w400",
          "height": 1.16,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "ideographic"
        },
        "displaySmall": {
          "fontSize": 36,
          "fontWeight": "w400",
          "height": 1.22,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "ideographic"
        },
        "headlineLarge": {
          "fontSize": 32,
          "fontWeight": "w400",
          "height": 1.25,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "ideographic"
        },
        "headlineMedium": {
          "fontSize": 28,
          "fontWeight": "w400",
          "height": 1.29,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "ideographic"
        },
        "headlineSmall": {
          "fontSize": 24,
          "fontWeight": "w400",
          "height": 1.33,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "ideographic"
        },
        "labelLarge": {
          "fontSize": 14,
          "fontWeight": "w500",
          "height": 1.43,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.1,
          "textBaseline": "ideographic"
        },
        "labelMedium": {
          "fontSize": 12,
          "fontWeight": "w500",
          "height": 1.33,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.5,
          "textBaseline": "ideographic"
        },
        "labelSmall": {
          "fontSize": 11,
          "fontWeight": "w500",
          "height": 1.45,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.5,
          "textBaseline": "ideographic"
        },
        "titleLarge": {
          "fontSize": 22,
          "fontWeight": "w400",
          "height": 1.27,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "ideographic"
        },
        "titleMedium": {
          "fontSize": 16,
          "fontWeight": "w500",
          "height": 1.5,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.15,
          "textBaseline": "ideographic"
        },
        "titleSmall": {
          "fontSize": 14,
          "fontWeight": "w500",
          "height": 1.43,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.1,
          "textBaseline": "ideographic"
        }
      },
      "englishLike": {
        "bodyLarge": {
          "fontSize": 16,
          "fontWeight": "w400",
          "height": 1.5,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.5,
          "textBaseline": "alphabetic"
        },
        "bodyMedium": {
          "fontSize": 14,
          "fontWeight": "w400",
          "height": 1.43,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.25,
          "textBaseline": "alphabetic"
        },
        "bodySmall": {
          "fontSize": 12,
          "fontWeight": "w400",
          "height": 1.33,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.4,
          "textBaseline": "alphabetic"
        },
        "displayLarge": {
          "fontSize": 57,
          "fontWeight": "w400",
          "height": 1.12,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": -0.25,
          "textBaseline": "alphabetic"
        },
        "displayMedium": {
          "fontSize": 45,
          "fontWeight": "w400",
          "height": 1.16,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "displaySmall": {
          "fontSize": 36,
          "fontWeight": "w400",
          "height": 1.22,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "headlineLarge": {
          "fontSize": 32,
          "fontWeight": "w400",
          "height": 1.25,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "headlineMedium": {
          "fontSize": 28,
          "fontWeight": "w400",
          "height": 1.29,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "headlineSmall": {
          "fontSize": 24,
          "fontWeight": "w400",
          "height": 1.33,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "labelLarge": {
          "fontSize": 14,
          "fontWeight": "w500",
          "height": 1.43,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.1,
          "textBaseline": "alphabetic"
        },
        "labelMedium": {
          "fontSize": 12,
          "fontWeight": "w500",
          "height": 1.33,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.5,
          "textBaseline": "alphabetic"
        },
        "labelSmall": {
          "fontSize": 11,
          "fontWeight": "w500",
          "height": 1.45,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.5,
          "textBaseline": "alphabetic"
        },
        "titleLarge": {
          "fontSize": 22,
          "fontWeight": "w400",
          "height": 1.27,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "titleMedium": {
          "fontSize": 16,
          "fontWeight": "w500",
          "height": 1.5,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.15,
          "textBaseline": "alphabetic"
        },
        "titleSmall": {
          "fontSize": 14,
          "fontWeight": "w500",
          "height": 1.43,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.1,
          "textBaseline": "alphabetic"
        }
      },
      "tall": {
        "bodyLarge": {
          "fontSize": 16,
          "fontWeight": "w400",
          "height": 1.5,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.5,
          "textBaseline": "alphabetic"
        },
        "bodyMedium": {
          "fontSize": 14,
          "fontWeight": "w400",
          "height": 1.43,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.25,
          "textBaseline": "alphabetic"
        },
        "bodySmall": {
          "fontSize": 12,
          "fontWeight": "w400",
          "height": 1.33,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.4,
          "textBaseline": "alphabetic"
        },
        "displayLarge": {
          "fontSize": 57,
          "fontWeight": "w400",
          "height": 1.12,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": -0.25,
          "textBaseline": "alphabetic"
        },
        "displayMedium": {
          "fontSize": 45,
          "fontWeight": "w400",
          "height": 1.16,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "displaySmall": {
          "fontSize": 36,
          "fontWeight": "w400",
          "height": 1.22,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "headlineLarge": {
          "fontSize": 32,
          "fontWeight": "w400",
          "height": 1.25,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "headlineMedium": {
          "fontSize": 28,
          "fontWeight": "w400",
          "height": 1.29,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "headlineSmall": {
          "fontSize": 24,
          "fontWeight": "w400",
          "height": 1.33,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "labelLarge": {
          "fontSize": 14,
          "fontWeight": "w500",
          "height": 1.43,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.1,
          "textBaseline": "alphabetic"
        },
        "labelMedium": {
          "fontSize": 12,
          "fontWeight": "w500",
          "height": 1.33,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.5,
          "textBaseline": "alphabetic"
        },
        "labelSmall": {
          "fontSize": 11,
          "fontWeight": "w500",
          "height": 1.45,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.5,
          "textBaseline": "alphabetic"
        },
        "titleLarge": {
          "fontSize": 22,
          "fontWeight": "w400",
          "height": 1.27,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "titleMedium": {
          "fontSize": 16,
          "fontWeight": "w500",
          "height": 1.5,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.15,
          "textBaseline": "alphabetic"
        },
        "titleSmall": {
          "fontSize": 14,
          "fontWeight": "w500",
          "height": 1.43,
          "inherit": false,
          "leadingDistribution": "even",
          "letterSpacing": 0.1,
          "textBaseline": "alphabetic"
        }
      },
      "white": {
        "bodyLarge": {
          "color": "#fffdfbff",
          "decoration": "none",
          "decorationColor": "#fffdfbff",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "bodyMedium": {
          "color": "#fffdfbff",
          "decoration": "none",
          "decorationColor": "#fffdfbff",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "bodySmall": {
          "color": "#fffdfbff",
          "decoration": "none",
          "decorationColor": "#fffdfbff",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "displayLarge": {
          "color": "#fffdfbff",
          "decoration": "none",
          "decorationColor": "#fffdfbff",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "displayMedium": {
          "color": "#fffdfbff",
          "decoration": "none",
          "decorationColor": "#fffdfbff",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "displaySmall": {
          "color": "#fffdfbff",
          "decoration": "none",
          "decorationColor": "#fffdfbff",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "headlineLarge": {
          "color": "#fffdfbff",
          "decoration": "none",
          "decorationColor": "#fffdfbff",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "headlineMedium": {
          "color": "#fffdfbff",
          "decoration": "none",
          "decorationColor": "#fffdfbff",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "headlineSmall": {
          "color": "#fffdfbff",
          "decoration": "none",
          "decorationColor": "#fffdfbff",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "labelLarge": {
          "color": "#fffdfbff",
          "decoration": "none",
          "decorationColor": "#fffdfbff",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "labelMedium": {
          "color": "#fffdfbff",
          "decoration": "none",
          "decorationColor": "#fffdfbff",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "labelSmall": {
          "color": "#fffdfbff",
          "decoration": "none",
          "decorationColor": "#fffdfbff",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "titleLarge": {
          "color": "#fffdfbff",
          "decoration": "none",
          "decorationColor": "#fffdfbff",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "titleMedium": {
          "color": "#fffdfbff",
          "decoration": "none",
          "decorationColor": "#fffdfbff",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        },
        "titleSmall": {
          "color": "#fffdfbff",
          "decoration": "none",
          "decorationColor": "#fffdfbff",
          "fontFamily": "Roboto",
          "fontFamilyFallback": [
            "Ubuntu",
            "Cantarell",
            "DejaVu Sans",
            "Liberation Sans",
            "Arial"
          ],
          "inherit": true
        }
      }
    },
    "unselectedWidgetColor": "#8a000000",
    "useMaterial3": true,
    "visualDensity": "compact"
  })!;
}
