Functions and prototypes for projectM callbacks.  [More...](#detailed-description)

## Types

|                | Name           |
| -------------- | -------------- |
| typedef void(*)(bool is_hard_cut, void *user_data) | **[projectm_preset_switch_requested_event](/projectmapi/projectm/callbacks.md#typedef-projectm-preset-switch-requested-event)** <br>Callback function that is executed whenever projectM wants to switch to a new preset.  |
| typedef void(*)(const char *preset_filename, const char *message, void *user_data) | **[projectm_preset_switch_failed_event](/projectmapi/projectm/callbacks.md#typedef-projectm-preset-switch-failed-event)** <br>Callback function that is executed if a preset change failed.  |

## Functions

|                | Name           |
| -------------- | -------------- |
| PROJECTM_EXPORT void | **[projectm_set_preset_switch_requested_event_callback](/projectmapi/projectm/callbacks.md#function-projectm-set-preset-switch-requested-event-callback)**([projectm_handle](/projectmapi/projectm/types.md#typedef-projectm-handle) instance, [projectm_preset_switch_requested_event](/projectmapi/projectm/callbacks.md#typedef-projectm-preset-switch-requested-event) callback, void * user_data)<br>Sets a callback function that will be called when a preset change is requested.  |
| PROJECTM_EXPORT void | **[projectm_set_preset_switch_failed_event_callback](/projectmapi/projectm/callbacks.md#function-projectm-set-preset-switch-failed-event-callback)**([projectm_handle](/projectmapi/projectm/types.md#typedef-projectm-handle) instance, [projectm_preset_switch_failed_event](/projectmapi/projectm/callbacks.md#typedef-projectm-preset-switch-failed-event) callback, void * user_data)<br>Sets a callback function that will be called when a preset change failed.  |

## Detailed Description

Functions and prototypes for projectM callbacks. 

**Copyright**: 2003-2023 projectM Team


projectM &ndash; Milkdrop-esque visualisation SDK Copyright (C)2003-2023 projectM Team

This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA See 'LICENSE.txt' included within this release 

## Types Documentation

### typedef projectm_preset_switch_requested_event

```cpp
typedef void(* projectm_preset_switch_requested_event) (bool is_hard_cut, void *user_data);
```

Callback function that is executed whenever projectM wants to switch to a new preset. 

**Parameters**: 

  * **is_hard_cut** If true, the transition was triggered by a beat-driven event. 
  * **user_data** A user-defined data pointer that was provided when registering the callback, e.g. context information. 


### typedef projectm_preset_switch_failed_event

```cpp
typedef void(* projectm_preset_switch_failed_event) (const char *preset_filename, const char *message, void *user_data);
```

Callback function that is executed if a preset change failed. 

**Parameters**: 

  * **preset_filename** The filename of the failed preset. 
  * **message** The error message. 
  * **user_data** A user-defined data pointer that was provided when registering the callback, e.g. context information. 


The message and filename pointers are only valid inside the callback. Make a copy if these values need to be retained for later use.



## Functions Documentation

### function projectm_set_preset_switch_requested_event_callback

```cpp
PROJECTM_EXPORT void projectm_set_preset_switch_requested_event_callback(
    projectm_handle instance,
    projectm_preset_switch_requested_event callback,
    void * user_data
)
```

Sets a callback function that will be called when a preset change is requested. 

**Parameters**: 

  * **instance** The projectM instance handle. 
  * **callback** A pointer to the callback function. 
  * **user_data** A pointer to any data that will be sent back in the callback, e.g. context information. 


Only one callback can be registered per projectM instance. To remove the callback, use NULL.


### function projectm_set_preset_switch_failed_event_callback

```cpp
PROJECTM_EXPORT void projectm_set_preset_switch_failed_event_callback(
    projectm_handle instance,
    projectm_preset_switch_failed_event callback,
    void * user_data
)
```

Sets a callback function that will be called when a preset change failed. 

**Parameters**: 

  * **instance** The projectM instance handle. 
  * **callback** A pointer to the callback function. 
  * **user_data** A pointer to any data that will be sent back in the callback, e.g. context information. 


Only one callback can be registered per projectM instance. To remove the callback, use NULL.




## Source code

```cpp

#pragma once

#include "projectM-4/types.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef void (*projectm_preset_switch_requested_event)(bool is_hard_cut, void* user_data);

typedef void (*projectm_preset_switch_failed_event)(const char* preset_filename,
                                                    const char* message, void* user_data);


PROJECTM_EXPORT void projectm_set_preset_switch_requested_event_callback(projectm_handle instance,
                                                                         projectm_preset_switch_requested_event callback,
                                                                         void* user_data);

PROJECTM_EXPORT void projectm_set_preset_switch_failed_event_callback(projectm_handle instance,
                                                                      projectm_preset_switch_failed_event callback,
                                                                      void* user_data);

#ifdef __cplusplus
} // extern "C"
#endif
```


-------------------------------

Updated on 2023-09-24 at 13:23:55 +0000
