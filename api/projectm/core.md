Core functions to instantiate, destroy and control projectM.  [More...](#detailed-description)

## Functions

|                | Name           |
| -------------- | -------------- |
| PROJECTM_EXPORT [projectm_handle](/projectmapi/projectm/types.md#typedef-projectm-handle) | **[projectm_create](/projectmapi/projectm/core.md#function-projectm-create)**()<br>Creates a new projectM instance.  |
| PROJECTM_EXPORT void | **[projectm_destroy](/projectmapi/projectm/core.md#function-projectm-destroy)**([projectm_handle](/projectmapi/projectm/types.md#typedef-projectm-handle) instance)<br>Destroys the given instance and frees the resources.  |
| PROJECTM_EXPORT void | **[projectm_load_preset_file](/projectmapi/projectm/core.md#function-projectm-load-preset-file)**([projectm_handle](/projectmapi/projectm/types.md#typedef-projectm-handle) instance, const char * filename, bool smooth_transition)<br>Loads a preset from the given filename/URL.  |
| PROJECTM_EXPORT void | **[projectm_load_preset_data](/projectmapi/projectm/core.md#function-projectm-load-preset-data)**([projectm_handle](/projectmapi/projectm/types.md#typedef-projectm-handle) instance, const char * data, bool smooth_transition)<br>Loads a preset from the data pointer.  |
| PROJECTM_EXPORT void | **[projectm_reset_textures](/projectmapi/projectm/core.md#function-projectm-reset-textures)**([projectm_handle](/projectmapi/projectm/types.md#typedef-projectm-handle) instance)<br>Reloads all textures.  |
| PROJECTM_EXPORT void | **[projectm_get_version_components](/projectmapi/projectm/core.md#function-projectm-get-version-components)**(int * major, int * minor, int * patch)<br>Returns the runtime library version components as individual integers.  |
| PROJECTM_EXPORT char * | **[projectm_get_version_string](/projectmapi/projectm/core.md#function-projectm-get-version-string)**()<br>Returns the runtime library version as a string.  |
| PROJECTM_EXPORT char * | **[projectm_get_vcs_version_string](/projectmapi/projectm/core.md#function-projectm-get-vcs-version-string)**()<br>Returns the VCS revision from which the projectM library was built.  |

## Detailed Description

Core functions to instantiate, destroy and control projectM. 

**Copyright**: 2003-2023 projectM Team


projectM &ndash; Milkdrop-esque visualisation SDK Copyright (C)2003-2023 projectM Team

This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA See 'LICENSE.txt' included within this release 


## Functions Documentation

### function projectm_create

```cpp
PROJECTM_EXPORT projectm_handle projectm_create()
```

Creates a new projectM instance. 

**Return**: A projectM handle for the newly created instance that must be used in subsequent API calls. NULL if the instance could not be created successfully. 

If this function returns NULL, in most cases the OpenGL context is not initialized, not made current or insufficient to render projectM visuals.


### function projectm_destroy

```cpp
PROJECTM_EXPORT void projectm_destroy(
    projectm_handle instance
)
```

Destroys the given instance and frees the resources. 

**Parameters**: 

  * **instance** A handle returned by [projectm_create()](/projectmapi/projectm/core.md#function-projectm-create) or projectm_create_settings(). 


After destroying the handle, it must not be used for any other calls to the API.


### function projectm_load_preset_file

```cpp
PROJECTM_EXPORT void projectm_load_preset_file(
    projectm_handle instance,
    const char * filename,
    bool smooth_transition
)
```

Loads a preset from the given filename/URL. 

**Parameters**: 

  * **instance** The projectM instance handle. 
  * **filename** The preset filename or URL to load. 
  * **smooth_transition** If true, the new preset is smoothly blended over. 


Ideally, the filename should be given as a standard local path. projectM also supports loading "file://" URLs. Additionally, the special filename "idle://" can be used to load the default idle preset, displaying the "M" logo.

Other URL schemas aren't supported and will cause a loading error.

If the preset can't be loaded, no switch takes place and the current preset will continue to be displayed. Note that if there's a transition in progress when calling this function, the transition will be finished immediately, even if the new preset can't be loaded.


### function projectm_load_preset_data

```cpp
PROJECTM_EXPORT void projectm_load_preset_data(
    projectm_handle instance,
    const char * data,
    bool smooth_transition
)
```

Loads a preset from the data pointer. 

**Parameters**: 

  * **instance** The projectM instance handle. 
  * **data** The preset contents to load. 
  * **smooth_transition** If true, the new preset is smoothly blended over. 


Currently, the preset data is assumed to be in Milkdrop format.

If the preset can't be loaded, no switch takes place and the current preset will continue to be displayed. Note that if there's a transition in progress when calling this function, the transition will be finished immediately, even if the new preset can't be loaded.


### function projectm_reset_textures

```cpp
PROJECTM_EXPORT void projectm_reset_textures(
    projectm_handle instance
)
```

Reloads all textures. 

**Parameters**: 

  * **instance** The projectM instance handle. 


Calling this method will clear and reload all textures, including the main rendering texture. Can cause a small delay/lag in rendering. Only use if texture paths were changed.


### function projectm_get_version_components

```cpp
PROJECTM_EXPORT void projectm_get_version_components(
    int * major,
    int * minor,
    int * patch
)
```

Returns the runtime library version components as individual integers. 

**Parameters**: 

  * **major** A pointer to an int that will be set to the major version. 
  * **minor** A pointer to an int that will be set to the minor version. 
  * **patch** A pointer to an int that will be set to the patch version. 


Components which aren't required can be set to NULL.


### function projectm_get_version_string

```cpp
PROJECTM_EXPORT char * projectm_get_version_string()
```

Returns the runtime library version as a string. 

**Return**: The library version in the format major.minor.patch. 

Remember to call _[projectm_free_string()](/projectmapi/projectm/memory.md#function-projectm-free-string)_ on the returned pointer if the data is no longer needed.


### function projectm_get_vcs_version_string

```cpp
PROJECTM_EXPORT char * projectm_get_vcs_version_string()
```

Returns the VCS revision from which the projectM library was built. 

**Return**: The VCS revision number the projectM library was built from. 

Can be any text, will mostly contain a Git commit hash. Useful to report bugs.

Remember to call _[projectm_free_string()](/projectmapi/projectm/memory.md#function-projectm-free-string)_ on the returned pointer if the data is no longer needed.




## Source code

```cpp

#pragma once

#include "projectM-4/types.h"

#ifdef __cplusplus
extern "C" {
#endif

PROJECTM_EXPORT projectm_handle projectm_create();

PROJECTM_EXPORT void projectm_destroy(projectm_handle instance);

PROJECTM_EXPORT void projectm_load_preset_file(projectm_handle instance, const char* filename,
                                               bool smooth_transition);

PROJECTM_EXPORT void projectm_load_preset_data(projectm_handle instance, const char* data,
                                               bool smooth_transition);

PROJECTM_EXPORT void projectm_reset_textures(projectm_handle instance);

PROJECTM_EXPORT void projectm_get_version_components(int* major, int* minor, int* patch);

PROJECTM_EXPORT char* projectm_get_version_string();

PROJECTM_EXPORT char* projectm_get_vcs_version_string();

#ifdef __cplusplus
} // extern "C"
#endif
```


-------------------------------

Updated on 2023-09-24 at 02:08:06 +0000
