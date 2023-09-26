Functions to set and retrieve all sorts of projectM parameters and setting.  [More...](#detailed-description)

## Functions

|                | Name           |
| -------------- | -------------- |
| PROJECTM_EXPORT void | **[projectm_set_texture_search_paths](http://localhost:3000/projects/projectm/api/parameters#function-projectm-set-texture-search-paths)**([projectm_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-handle) instance, const char ** texture_search_paths, size_t count)<br>Sets the texture search paths.  |
| PROJECTM_EXPORT void | **[projectm_set_beat_sensitivity](http://localhost:3000/projects/projectm/api/parameters#function-projectm-set-beat-sensitivity)**([projectm_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-handle) instance, float sensitivity)<br>Sets the beat sensitivity.  |
| PROJECTM_EXPORT float | **[projectm_get_beat_sensitivity](http://localhost:3000/projects/projectm/api/parameters#function-projectm-get-beat-sensitivity)**([projectm_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-handle) instance)<br>Returns the beat sensitivity.  |
| PROJECTM_EXPORT void | **[projectm_set_hard_cut_duration](http://localhost:3000/projects/projectm/api/parameters#function-projectm-set-hard-cut-duration)**([projectm_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-handle) instance, double seconds)<br>Sets the minimum display time before a hard cut can happen.  |
| PROJECTM_EXPORT double | **[projectm_get_hard_cut_duration](http://localhost:3000/projects/projectm/api/parameters#function-projectm-get-hard-cut-duration)**([projectm_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-handle) instance)<br>Returns the minimum display time before a hard cut can happen.  |
| PROJECTM_EXPORT void | **[projectm_set_hard_cut_enabled](http://localhost:3000/projects/projectm/api/parameters#function-projectm-set-hard-cut-enabled)**([projectm_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-handle) instance, bool enabled)<br>Enables or disables hard cuts.  |
| PROJECTM_EXPORT bool | **[projectm_get_hard_cut_enabled](http://localhost:3000/projects/projectm/api/parameters#function-projectm-get-hard-cut-enabled)**([projectm_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-handle) instance)<br>Returns whether hard cuts are enabled or not.  |
| PROJECTM_EXPORT void | **[projectm_set_hard_cut_sensitivity](http://localhost:3000/projects/projectm/api/parameters#function-projectm-set-hard-cut-sensitivity)**([projectm_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-handle) instance, float sensitivity)<br>Sets the hard cut volume sensitivity.  |
| PROJECTM_EXPORT float | **[projectm_get_hard_cut_sensitivity](http://localhost:3000/projects/projectm/api/parameters#function-projectm-get-hard-cut-sensitivity)**([projectm_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-handle) instance)<br>Returns the current hard cut sensitivity.  |
| PROJECTM_EXPORT void | **[projectm_set_soft_cut_duration](http://localhost:3000/projects/projectm/api/parameters#function-projectm-set-soft-cut-duration)**([projectm_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-handle) instance, double seconds)<br>Sets the time in seconds for a soft transition between two presets.  |
| PROJECTM_EXPORT double | **[projectm_get_soft_cut_duration](http://localhost:3000/projects/projectm/api/parameters#function-projectm-get-soft-cut-duration)**([projectm_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-handle) instance)<br>Returns the time in seconds for a soft transition between two presets.  |
| PROJECTM_EXPORT void | **[projectm_set_preset_duration](http://localhost:3000/projects/projectm/api/parameters#function-projectm-set-preset-duration)**([projectm_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-handle) instance, double seconds)<br>Sets the preset display duration before switching to the next using a soft cut.  |
| PROJECTM_EXPORT double | **[projectm_get_preset_duration](http://localhost:3000/projects/projectm/api/parameters#function-projectm-get-preset-duration)**([projectm_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-handle) instance)<br>Returns the preset display duration before switching to the next using a soft cut.  |
| PROJECTM_EXPORT void | **[projectm_set_mesh_size](http://localhost:3000/projects/projectm/api/parameters#function-projectm-set-mesh-size)**([projectm_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-handle) instance, size_t width, size_t height)<br>Sets the per-pixel equation mesh size in units.  |
| PROJECTM_EXPORT void | **[projectm_get_mesh_size](http://localhost:3000/projects/projectm/api/parameters#function-projectm-get-mesh-size)**([projectm_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-handle) instance, size_t * width, size_t * height)<br>Returns the per-pixel equation mesh size in units.  |
| PROJECTM_EXPORT void | **[projectm_set_fps](http://localhost:3000/projects/projectm/api/parameters#function-projectm-set-fps)**([projectm_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-handle) instance, int32_t fps)<br>Sets the current/average frames per second.  |
| PROJECTM_EXPORT int32_t | **[projectm_get_fps](http://localhost:3000/projects/projectm/api/parameters#function-projectm-get-fps)**([projectm_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-handle) instance)<br>Returns the current/average frames per second.  |
| PROJECTM_EXPORT void | **[projectm_set_aspect_correction](http://localhost:3000/projects/projectm/api/parameters#function-projectm-set-aspect-correction)**([projectm_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-handle) instance, bool enabled)<br>Enabled or disables aspect ratio correction in presets that support it.  |
| PROJECTM_EXPORT bool | **[projectm_get_aspect_correction](http://localhost:3000/projects/projectm/api/parameters#function-projectm-get-aspect-correction)**([projectm_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-handle) instance)<br>Returns whether aspect ratio correction is enabled or not.  |
| PROJECTM_EXPORT void | **[projectm_set_easter_egg](http://localhost:3000/projects/projectm/api/parameters#function-projectm-set-easter-egg)**([projectm_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-handle) instance, float value)<br>Sets the "easter egg" value.  |
| PROJECTM_EXPORT float | **[projectm_get_easter_egg](http://localhost:3000/projects/projectm/api/parameters#function-projectm-get-easter-egg)**([projectm_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-handle) instance)<br>Returns the current "easter egg" value.  |
| PROJECTM_EXPORT void | **[projectm_set_preset_locked](http://localhost:3000/projects/projectm/api/parameters#function-projectm-set-preset-locked)**([projectm_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-handle) instance, bool lock)<br>Locks or unlocks the current preset.  |
| PROJECTM_EXPORT bool | **[projectm_get_preset_locked](http://localhost:3000/projects/projectm/api/parameters#function-projectm-get-preset-locked)**([projectm_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-handle) instance)<br>Returns whether the current preset is locked or not.  |
| PROJECTM_EXPORT void | **[projectm_set_window_size](http://localhost:3000/projects/projectm/api/parameters#function-projectm-set-window-size)**([projectm_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-handle) instance, size_t width, size_t height)<br>Sets the current viewport size in pixels.  |
| PROJECTM_EXPORT void | **[projectm_get_window_size](http://localhost:3000/projects/projectm/api/parameters#function-projectm-get-window-size)**([projectm_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-handle) instance, size_t * width, size_t * height)<br>Returns the current viewport size in pixels.  |

## Detailed Description

Functions to set and retrieve all sorts of projectM parameters and setting. 

**Copyright**: 2003-2023 projectM Team


projectM &ndash; Milkdrop-esque visualisation SDK Copyright (C)2003-2023 projectM Team

This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA See 'LICENSE.txt' included within this release 


## Functions Documentation

### function projectm_set_texture_search_paths

```cpp
PROJECTM_EXPORT void projectm_set_texture_search_paths(
    projectm_handle instance,
    const char ** texture_search_paths,
    size_t count
)
```

Sets the texture search paths. 

**Parameters**: 

  * **instance** The projectM instance handle. 
  * **texture_search_paths** A list of texture search paths. 
  * **count** The number of paths in the list. 


Calling this method will clear and reload all textures, including the main rendering texture. Can cause a small delay/lag in rendering. Only use if texture paths were changed.


### function projectm_set_beat_sensitivity

```cpp
PROJECTM_EXPORT void projectm_set_beat_sensitivity(
    projectm_handle instance,
    float sensitivity
)
```

Sets the beat sensitivity. 

**Parameters**: 

  * **instance** The projectM instance handle. 
  * **sensitivity** The sensitivity setting. 


The beat sensitivity to be used.


### function projectm_get_beat_sensitivity

```cpp
PROJECTM_EXPORT float projectm_get_beat_sensitivity(
    projectm_handle instance
)
```

Returns the beat sensitivity. 

**Parameters**: 

  * **instance** The projectM instance handle. 


**Return**: The current sensitivity setting. 

### function projectm_set_hard_cut_duration

```cpp
PROJECTM_EXPORT void projectm_set_hard_cut_duration(
    projectm_handle instance,
    double seconds
)
```

Sets the minimum display time before a hard cut can happen. 

**Parameters**: 

  * **instance** The projectM instance handle. 
  * **seconds** Minimum number of seconds the preset will be displayed before a hard cut. 


Hard cuts are beat-sensitive preset transitions, immediately changing from one preset to the next without a smooth blending period.

Set this to a higher value than preset duration to disable hard cuts.


### function projectm_get_hard_cut_duration

```cpp
PROJECTM_EXPORT double projectm_get_hard_cut_duration(
    projectm_handle instance
)
```

Returns the minimum display time before a hard cut can happen. 

**Parameters**: 

  * **instance** The projectM instance handle. 


**Return**: The minimum number of seconds the preset will be displayed before a hard cut. 

### function projectm_set_hard_cut_enabled

```cpp
PROJECTM_EXPORT void projectm_set_hard_cut_enabled(
    projectm_handle instance,
    bool enabled
)
```

Enables or disables hard cuts. 

**Parameters**: 

  * **instance** The projectM instance handle. 
  * **enabled** True to enable hard cuts, false to disable. 


Even if enabled, the hard cut duration must be set to a value lower than the preset duration to work properly.


### function projectm_get_hard_cut_enabled

```cpp
PROJECTM_EXPORT bool projectm_get_hard_cut_enabled(
    projectm_handle instance
)
```

Returns whether hard cuts are enabled or not. 

**Parameters**: 

  * **instance** The projectM instance handle. 


**Return**: True if hard cuts are enabled, false otherwise. 

### function projectm_set_hard_cut_sensitivity

```cpp
PROJECTM_EXPORT void projectm_set_hard_cut_sensitivity(
    projectm_handle instance,
    float sensitivity
)
```

Sets the hard cut volume sensitivity. 

**Parameters**: 

  * **instance** The projectM instance handle. 
  * **sensitivity** The volume threshold that triggers a hard cut if surpassed. 


The beat detection volume difference that must be surpassed to trigger a hard cut.


### function projectm_get_hard_cut_sensitivity

```cpp
PROJECTM_EXPORT float projectm_get_hard_cut_sensitivity(
    projectm_handle instance
)
```

Returns the current hard cut sensitivity. 

**Parameters**: 

  * **instance** The projectM instance handle. 


**Return**: The current hard cut sensitivity. 

### function projectm_set_soft_cut_duration

```cpp
PROJECTM_EXPORT void projectm_set_soft_cut_duration(
    projectm_handle instance,
    double seconds
)
```

Sets the time in seconds for a soft transition between two presets. 

**Parameters**: 

  * **instance** The projectM instance handle. 
  * **seconds** Time in seconds it takes to smoothly transition from one preset to another. 


During a soft cut, both presets are rendered and slowly transitioned from one to the other.


### function projectm_get_soft_cut_duration

```cpp
PROJECTM_EXPORT double projectm_get_soft_cut_duration(
    projectm_handle instance
)
```

Returns the time in seconds for a soft transition between two presets. 

**Parameters**: 

  * **instance** The projectM instance handle. 


**Return**: Time in seconds it takes to smoothly transition from one preset to another. 

### function projectm_set_preset_duration

```cpp
PROJECTM_EXPORT void projectm_set_preset_duration(
    projectm_handle instance,
    double seconds
)
```

Sets the preset display duration before switching to the next using a soft cut. 

**Parameters**: 

  * **instance** The projectM instance handle. 
  * **seconds** The number of seconds a preset will be displayed before the next is shown. 


This can be considered as the maximum time a preset is displayed. If this time is reached, a smooth cut will be initiated. A hard cut, if any, will always happen before this time.


### function projectm_get_preset_duration

```cpp
PROJECTM_EXPORT double projectm_get_preset_duration(
    projectm_handle instance
)
```

Returns the preset display duration before switching to the next using a soft cut. 

**Parameters**: 

  * **instance** The projectM instance handle. 


**Return**: The currently set preset display duration in seconds. 

This can be considered as the maximum time a preset is displayed. If this time is reached, a smooth cut will be initiated. A hard cut, if any, will always happen before this time.


### function projectm_set_mesh_size

```cpp
PROJECTM_EXPORT void projectm_set_mesh_size(
    projectm_handle instance,
    size_t width,
    size_t height
)
```

Sets the per-pixel equation mesh size in units. 

**Parameters**: 

  * **instance** The projectM instance handle. 
  * **width** The new width of the mesh. 
  * **height** The new height of the mesh. 


**Note**: This will currently remove any active presets and reload the default "idle" preset. 

### function projectm_get_mesh_size

```cpp
PROJECTM_EXPORT void projectm_get_mesh_size(
    projectm_handle instance,
    size_t * width,
    size_t * height
)
```

Returns the per-pixel equation mesh size in units. 

**Parameters**: 

  * **instance** The projectM instance handle. 
  * **width** The width of the mesh. 
  * **height** The height of the mesh. 


### function projectm_set_fps

```cpp
PROJECTM_EXPORT void projectm_set_fps(
    projectm_handle instance,
    int32_t fps
)
```

Sets the current/average frames per second. 

**Parameters**: 

  * **instance** The projectM instance handle. 
  * **fps** The current FPS value projectM is running with. 


Applications running projectM should UpdateMeshSize this value regularly and set it to the calculated (and possibly averaged) FPS value the output rendered with. The value is passed on to presets, which may choose to use it for calculations. It is not used in any other way by the library.


### function projectm_get_fps

```cpp
PROJECTM_EXPORT int32_t projectm_get_fps(
    projectm_handle instance
)
```

Returns the current/average frames per second. 

**Parameters**: 

  * **instance** The projectM instance handle. 


**Return**: The current/average frames per second. 

This value needs to be set by the application. If it wasn't set, a default value of 60 is used.


### function projectm_set_aspect_correction

```cpp
PROJECTM_EXPORT void projectm_set_aspect_correction(
    projectm_handle instance,
    bool enabled
)
```

Enabled or disables aspect ratio correction in presets that support it. 

**Parameters**: 

  * **instance** The projectM instance handle. 
  * **enabled** True to enable aspect correction, false to disable it. 


This sets a flag presets can use to aspect-correct rendered shapes, which otherwise would be distorted if the viewport isn't exactly square.


### function projectm_get_aspect_correction

```cpp
PROJECTM_EXPORT bool projectm_get_aspect_correction(
    projectm_handle instance
)
```

Returns whether aspect ratio correction is enabled or not. 

**Parameters**: 

  * **instance** The projectM instance handle. 


**Return**: True if aspect ratio correction is enabled, false otherwise. 

### function projectm_set_easter_egg

```cpp
PROJECTM_EXPORT void projectm_set_easter_egg(
    projectm_handle instance,
    float value
)
```

Sets the "easter egg" value. 

**Parameters**: 

  * **instance** The projectM instance handle. 
  * **value** The new "easter egg" value. 


This doesn't enable any fancy feature, it only influences the randomized display time of presets. It's passed as the "sigma" value of the gaussian random number generator used to determine the maximum display time, effectively multiplying the generated number of seconds by this amount.

See function sampledPresetDuration() of the TimeKeeper class on how it is used.


### function projectm_get_easter_egg

```cpp
PROJECTM_EXPORT float projectm_get_easter_egg(
    projectm_handle instance
)
```

Returns the current "easter egg" value. 

**Parameters**: 

  * **instance** The projectM instance handle. 


**Return**: The current "easter egg" value. 

### function projectm_set_preset_locked

```cpp
PROJECTM_EXPORT void projectm_set_preset_locked(
    projectm_handle instance,
    bool lock
)
```

Locks or unlocks the current preset. 

**Parameters**: 

  * **instance** The projectM instance handle. 
  * **lock** True to lock the current preset, false to enable automatic transitions. 


Locking effectively disables automatic preset transitions, both hard and soft cuts. Programmatic preset switches will still be executed.


### function projectm_get_preset_locked

```cpp
PROJECTM_EXPORT bool projectm_get_preset_locked(
    projectm_handle instance
)
```

Returns whether the current preset is locked or not. 

**Parameters**: 

  * **instance** The projectM instance handle. 


**Return**: True if the preset lock is enabled, false otherwise. 

### function projectm_set_window_size

```cpp
PROJECTM_EXPORT void projectm_set_window_size(
    projectm_handle instance,
    size_t width,
    size_t height
)
```

Sets the current viewport size in pixels. 

**Parameters**: 

  * **instance** The projectM instance handle. 
  * **width** New viewport width in pixels. 
  * **height** New viewport height in pixels. 


Calling this function will reset the OpenGL renderer.


### function projectm_get_window_size

```cpp
PROJECTM_EXPORT void projectm_get_window_size(
    projectm_handle instance,
    size_t * width,
    size_t * height
)
```

Returns the current viewport size in pixels. 

**Parameters**: 

  * **instance** The projectM instance handle. 
  * **width** Valid pointer to a size_t variable that will receive the window width value. 
  * **height** Valid pointer to a size_t variable that will receive the window height value. 




## Source code

```cpp

#pragma once

#include "projectM-4/types.h"

#ifdef __cplusplus
extern "C" {
#endif

PROJECTM_EXPORT void projectm_set_texture_search_paths(projectm_handle instance,
                                                       const char** texture_search_paths,
                                                       size_t count);

PROJECTM_EXPORT void projectm_set_beat_sensitivity(projectm_handle instance, float sensitivity);

PROJECTM_EXPORT float projectm_get_beat_sensitivity(projectm_handle instance);

PROJECTM_EXPORT void projectm_set_hard_cut_duration(projectm_handle instance, double seconds);

PROJECTM_EXPORT double projectm_get_hard_cut_duration(projectm_handle instance);

PROJECTM_EXPORT void projectm_set_hard_cut_enabled(projectm_handle instance, bool enabled);

PROJECTM_EXPORT bool projectm_get_hard_cut_enabled(projectm_handle instance);

PROJECTM_EXPORT void projectm_set_hard_cut_sensitivity(projectm_handle instance, float sensitivity);

PROJECTM_EXPORT float projectm_get_hard_cut_sensitivity(projectm_handle instance);

PROJECTM_EXPORT void projectm_set_soft_cut_duration(projectm_handle instance, double seconds);

PROJECTM_EXPORT double projectm_get_soft_cut_duration(projectm_handle instance);

PROJECTM_EXPORT void projectm_set_preset_duration(projectm_handle instance, double seconds);

PROJECTM_EXPORT double projectm_get_preset_duration(projectm_handle instance);

PROJECTM_EXPORT void projectm_set_mesh_size(projectm_handle instance, size_t width, size_t height);

PROJECTM_EXPORT void projectm_get_mesh_size(projectm_handle instance, size_t* width, size_t* height);

PROJECTM_EXPORT void projectm_set_fps(projectm_handle instance, int32_t fps);

PROJECTM_EXPORT int32_t projectm_get_fps(projectm_handle instance);

PROJECTM_EXPORT void projectm_set_aspect_correction(projectm_handle instance, bool enabled);

PROJECTM_EXPORT bool projectm_get_aspect_correction(projectm_handle instance);

PROJECTM_EXPORT void projectm_set_easter_egg(projectm_handle instance, float value);

PROJECTM_EXPORT float projectm_get_easter_egg(projectm_handle instance);

PROJECTM_EXPORT void projectm_set_preset_locked(projectm_handle instance, bool lock);

PROJECTM_EXPORT bool projectm_get_preset_locked(projectm_handle instance);

PROJECTM_EXPORT void projectm_set_window_size(projectm_handle instance, size_t width, size_t height);

PROJECTM_EXPORT void projectm_get_window_size(projectm_handle instance, size_t* width, size_t* height);

#ifdef __cplusplus
} // extern "C"
#endif
```


-------------------------------

Updated on 2023-09-26 at 16:35:52 +0000
