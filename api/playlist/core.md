Core functions to instantiate, destroy and connect a projectM playlist.  [More...](#detailed-description)

## Functions

|                | Name           |
| -------------- | -------------- |
| PROJECTM_PLAYLIST_EXPORT [projectm_playlist_handle](/projectmapi/playlist/playlist__types.md#typedef-projectm-playlist-handle) | **[projectm_playlist_create](/projectmapi/playlist/playlist__core.md#function-projectm-playlist-create)**([projectm_handle](/projectmapi/playlist/types.md#typedef-projectm-handle) projectm_instance)<br>Creates a playlist manager for the given projectM instance.  |
| PROJECTM_PLAYLIST_EXPORT void | **[projectm_playlist_destroy](/projectmapi/playlist/playlist__core.md#function-projectm-playlist-destroy)**([projectm_playlist_handle](/projectmapi/playlist/playlist__types.md#typedef-projectm-playlist-handle) instance)<br>Destroys a previously created playlist manager.  |
| PROJECTM_PLAYLIST_EXPORT void | **[projectm_playlist_connect](/projectmapi/playlist/playlist__core.md#function-projectm-playlist-connect)**([projectm_playlist_handle](/projectmapi/playlist/playlist__types.md#typedef-projectm-playlist-handle) instance, [projectm_handle](/projectmapi/playlist/types.md#typedef-projectm-handle) projectm_instance)<br>Connects the playlist manager to a projectM instance.  |

## Detailed Description

Core functions to instantiate, destroy and connect a projectM playlist. 

**Copyright**: 2003-2023 projectM Team


projectM &ndash; Milkdrop-esque visualisation SDK Copyright (C)2003-2023 projectM Team

This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA See 'LICENSE.txt' included within this release 


## Functions Documentation

### function projectm_playlist_create

```cpp
PROJECTM_PLAYLIST_EXPORT projectm_playlist_handle projectm_playlist_create(
    projectm_handle projectm_instance
)
```

Creates a playlist manager for the given projectM instance. 

**Parameters**: 

  * **projectm_instance** The projectM instance to connect to. Can be a null pointer to leave the newly created playlist instance unconnected. 


**Return**: An opaque pointer to the newly created playlist manager instance. Null if creation failed. 

Only one active playlist manager is supported per projectM instance. If multiple playlists use the same projectM instance, only the last created playlist manager will receive preset change callbacks from the projectM instance.

To switch to another playlist, use the [projectm_playlist_connect()](/projectmapi/playlist/playlist__core.md#function-projectm-playlist-connect) method.


### function projectm_playlist_destroy

```cpp
PROJECTM_PLAYLIST_EXPORT void projectm_playlist_destroy(
    projectm_playlist_handle instance
)
```

Destroys a previously created playlist manager. 

**Parameters**: 

  * **instance** The playlist manager instance to destroy. 


If the playlist manager is currently connected to a projectM instance, it will be disconnected.


### function projectm_playlist_connect

```cpp
PROJECTM_PLAYLIST_EXPORT void projectm_playlist_connect(
    projectm_playlist_handle instance,
    projectm_handle projectm_instance
)
```

Connects the playlist manager to a projectM instance. 

**Parameters**: 

  * **instance** The playlist manager instance. 
  * **projectm_instance** The projectM instance to connect to. Can be a null pointer to remove an existing binding and clear the projectM preset switch callback. 


Sets or removes the preset switch callbacks and stores the projectM instance handle for use with manual preset switches via the playlist API.

When switching between multiple playlist managers, first call this method on the last used playlist manager with a null pointer for the projectM instance, then call this method with the actual projectM instance on the playlist manager that should be activated. It is also safe to call [projectm_playlist_connect()](/projectmapi/playlist/playlist__core.md#function-projectm-playlist-connect) with a null projectM handle on all playlist manager instances before activating a single one with a valid, non-null projectM handle.




## Source code

```cpp

#pragma once

#include "projectM-4/types.h"
#include "projectM-4/playlist_types.h"

#ifdef __cplusplus
extern "C" {
#endif

PROJECTM_PLAYLIST_EXPORT projectm_playlist_handle projectm_playlist_create(projectm_handle projectm_instance);

PROJECTM_PLAYLIST_EXPORT void projectm_playlist_destroy(projectm_playlist_handle instance);

PROJECTM_PLAYLIST_EXPORT void projectm_playlist_connect(projectm_playlist_handle instance, projectm_handle projectm_instance);

#ifdef __cplusplus
} // extern "C"
#endif
```


-------------------------------

Updated on 2023-09-24 at 13:23:55 +0000
