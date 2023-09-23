Functions and prototypes for projectM playlist callbacks.  [More...](#detailed-description)

## Types

|                | Name           |
| -------------- | -------------- |
| typedef void(*)(bool is_hard_cut, unsigned int index, void *user_data) | **[projectm_playlist_preset_switched_event](/api/Files/playlist__callbacks_8h.md#typedef-projectm-playlist-preset-switched-event)** <br>Callback function that is executed on each preset change.  |
| typedef void(*)(const char *preset_filename, const char *message, void *user_data) | **[projectm_playlist_preset_switch_failed_event](/api/Files/playlist__callbacks_8h.md#typedef-projectm-playlist-preset-switch-failed-event)** <br>Callback function that is executed if a preset change failed too often.  |

## Functions

|                | Name           |
| -------------- | -------------- |
| PROJECTM_PLAYLIST_EXPORT void | **[projectm_playlist_set_preset_switched_event_callback](/api/Files/playlist__callbacks_8h.md#function-projectm-playlist-set-preset-switched-event-callback)**([projectm_playlist_handle](/api/Files/playlist__types_8h.md#typedef-projectm-playlist-handle) instance, [projectm_playlist_preset_switched_event](/api/Files/playlist__callbacks_8h.md#typedef-projectm-playlist-preset-switched-event) callback, void * user_data)<br>Sets a callback function that will be called when a preset changes.  |
| PROJECTM_PLAYLIST_EXPORT void | **[projectm_playlist_set_preset_switch_failed_event_callback](/api/Files/playlist__callbacks_8h.md#function-projectm-playlist-set-preset-switch-failed-event-callback)**([projectm_playlist_handle](/api/Files/playlist__types_8h.md#typedef-projectm-playlist-handle) instance, [projectm_playlist_preset_switch_failed_event](/api/Files/playlist__callbacks_8h.md#typedef-projectm-playlist-preset-switch-failed-event) callback, void * user_data)<br>Sets a callback function that will be called when a preset change failed.  |

## Detailed Description

Functions and prototypes for projectM playlist callbacks. 

**Copyright**: 2003-2023 projectM Team 


projectM &ndash; Milkdrop-esque visualisation SDK Copyright (C)2003-2023 projectM Team

This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA See 'LICENSE.txt' included within this release 

## Types Documentation

### typedef projectm_playlist_preset_switched_event

```cpp
typedef void(* projectm_playlist_preset_switched_event) (bool is_hard_cut, unsigned int index, void *user_data);
```

Callback function that is executed on each preset change. 

**Parameters**: 

  * **is_hard_cut** True if the preset was switched using a hard cut via beat detection. 
  * **index** The playlist index of the new preset. 
  * **user_data** A user-defined data pointer that was provided when registering the callback, e.g. context information. 


Can be used for example to UpdateMeshSize the application window title. Applications must not switch presets inside this callback, as it can lead to infinite recursion.


### typedef projectm_playlist_preset_switch_failed_event

```cpp
typedef void(* projectm_playlist_preset_switch_failed_event) (const char *preset_filename, const char *message, void *user_data);
```

Callback function that is executed if a preset change failed too often. 

**Parameters**: 

  * **preset_filename** The filename of the failed preset. 
  * **message** The last error message. 
  * **user_data** A user-defined data pointer that was provided when registering the callback, e.g. context information. 


**Note**: 

  * Do NOT call any functions that switch presets inside the callback, at it might lead to infinite recursion and thus a stack overflow! 
  * The message pointer is only valid inside the callback. Make a copy if it need to be retained for later use. 


Similar to the projectM API function, but will only be called if the preset switch failed multiple times in a row, e.g. due to missing files or broken presets. The application should decide what action to take.



## Functions Documentation

### function projectm_playlist_set_preset_switched_event_callback

```cpp
PROJECTM_PLAYLIST_EXPORT void projectm_playlist_set_preset_switched_event_callback(
    projectm_playlist_handle instance,
    projectm_playlist_preset_switched_event callback,
    void * user_data
)
```

Sets a callback function that will be called when a preset changes. 

**Parameters**: 

  * **instance** The playlist manager instance. 
  * **callback** A pointer to the callback function. 
  * **user_data** A pointer to any data that will be sent back in the callback, e.g. context information. 


Only one callback can be registered per playlist instance. To remove the callback, use NULL.


### function projectm_playlist_set_preset_switch_failed_event_callback

```cpp
PROJECTM_PLAYLIST_EXPORT void projectm_playlist_set_preset_switch_failed_event_callback(
    projectm_playlist_handle instance,
    projectm_playlist_preset_switch_failed_event callback,
    void * user_data
)
```

Sets a callback function that will be called when a preset change failed. 

**Parameters**: 

  * **instance** The playlist manager instance. 
  * **callback** A pointer to the callback function. 
  * **user_data** A pointer to any data that will be sent back in the callback, e.g. context information. 


Only one callback can be registered per projectM instance. To remove the callback, use NULL.

If the application want to receive projectM's analogous callback directly, use the [projectm_set_preset_switch_failed_event_callback()](/api/Files/callbacks_8h.md#function-projectm-set-preset-switch-failed-event-callback) function after calling [projectm_playlist_create()](/api/Files/playlist__core_8h.md#function-projectm-playlist-create) or [projectm_playlist_connect()](/api/Files/playlist__core_8h.md#function-projectm-playlist-connect), respectively, as these will both override the callback set in projectM.




## Source code

```cpp

#pragma once

#include "projectM-4/playlist_types.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef void (*projectm_playlist_preset_switched_event)(bool is_hard_cut, unsigned int index,
                                                        void* user_data);

typedef void (*projectm_playlist_preset_switch_failed_event)(const char* preset_filename,
                                                             const char* message, void* user_data);


PROJECTM_PLAYLIST_EXPORT void projectm_playlist_set_preset_switched_event_callback(projectm_playlist_handle instance,
                                                                                   projectm_playlist_preset_switched_event callback,
                                                                                   void* user_data);

PROJECTM_PLAYLIST_EXPORT void projectm_playlist_set_preset_switch_failed_event_callback(projectm_playlist_handle instance,
                                                                                        projectm_playlist_preset_switch_failed_event callback,
                                                                                        void* user_data);

#ifdef __cplusplus
} // extern "C"
#endif
```


-------------------------------

Updated on 2023-09-23 at 15:18:53 +0000
