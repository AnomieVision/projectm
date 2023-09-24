Touch-related functions to add random waveforms.  [More...](#detailed-description)

## Functions

|                | Name           |
| -------------- | -------------- |
| PROJECTM_EXPORT void | **[projectm_touch](/projectmapi/projectm/touch.md#function-projectm-touch)**([projectm_handle](/projectmapi/projectm/types.md#typedef-projectm-handle) instance, float x, float y, int pressure, [projectm_touch_type](/projectmapi/projectm/types.md#enum-projectm-touch-type) touch_type)<br>Starts a touch event or moves an existing waveform.  |
| PROJECTM_EXPORT void | **[projectm_touch_drag](/projectmapi/projectm/touch.md#function-projectm-touch-drag)**([projectm_handle](/projectmapi/projectm/types.md#typedef-projectm-handle) instance, float x, float y, int pressure)<br>Centers any waveforms under the coordinates to simulate dragging.  |
| PROJECTM_EXPORT void | **[projectm_touch_destroy](/projectmapi/projectm/touch.md#function-projectm-touch-destroy)**([projectm_handle](/projectmapi/projectm/types.md#typedef-projectm-handle) instance, float x, float y)<br>Removes any additional touch waveforms under the given coordinates.  |
| PROJECTM_EXPORT void | **[projectm_touch_destroy_all](/projectmapi/projectm/touch.md#function-projectm-touch-destroy-all)**([projectm_handle](/projectmapi/projectm/types.md#typedef-projectm-handle) instance)<br>Removes all touch waveforms from the screen.  |

## Detailed Description

Touch-related functions to add random waveforms. 

**Copyright**: 2003-2023 projectM Team


projectM &ndash; Milkdrop-esque visualisation SDK Copyright (C)2003-2023 projectM Team

This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA See 'LICENSE.txt' included within this release 


## Functions Documentation

### function projectm_touch

```cpp
PROJECTM_EXPORT void projectm_touch(
    projectm_handle instance,
    float x,
    float y,
    int pressure,
    projectm_touch_type touch_type
)
```

Starts a touch event or moves an existing waveform. 

**Parameters**: 

  * **instance** The projectM instance handle. 
  * **x** The x coordinate of the touch event. 
  * **y** The y coordinate of the touch event. 
  * **pressure** The amount of pressure applied in a range from 0.0 to 1.0. 
  * **touch_type** The waveform type that will be rendered on touch. 


This will add or move waveforms in addition to the preset waveforms. If there is an existing waveform at the given coordinates, it will be centered on the new coordinates. If there is no waveform, a new one will be added.


### function projectm_touch_drag

```cpp
PROJECTM_EXPORT void projectm_touch_drag(
    projectm_handle instance,
    float x,
    float y,
    int pressure
)
```

Centers any waveforms under the coordinates to simulate dragging. 

**Parameters**: 

  * **instance** The projectM instance handle. 
  * **x** The x coordinate of the drag. 
  * **y** the y coordinate of the drag. 
  * **pressure** The amount of pressure applied in a range from 0.0 to 1.0. 


### function projectm_touch_destroy

```cpp
PROJECTM_EXPORT void projectm_touch_destroy(
    projectm_handle instance,
    float x,
    float y
)
```

Removes any additional touch waveforms under the given coordinates. 

**Parameters**: 

  * **instance** The projectM instance handle. 
  * **x** The last known x touch coordinate. 
  * **y** The last known y touch coordinate. 


### function projectm_touch_destroy_all

```cpp
PROJECTM_EXPORT void projectm_touch_destroy_all(
    projectm_handle instance
)
```

Removes all touch waveforms from the screen. 

**Parameters**: 

  * **instance** The projectM instance handle. 


Preset-defined waveforms will still be displayed.




## Source code

```cpp

#pragma once

#include "projectM-4/types.h"

#ifdef __cplusplus
extern "C" {
#endif

PROJECTM_EXPORT void projectm_touch(projectm_handle instance, float x, float y,
                                    int pressure, projectm_touch_type touch_type);

PROJECTM_EXPORT void projectm_touch_drag(projectm_handle instance, float x, float y, int pressure);

PROJECTM_EXPORT void projectm_touch_destroy(projectm_handle instance, float x, float y);

PROJECTM_EXPORT void projectm_touch_destroy_all(projectm_handle instance);

#ifdef __cplusplus
} // extern "C"
#endif
```


-------------------------------

Updated on 2023-09-24 at 02:08:06 +0000
