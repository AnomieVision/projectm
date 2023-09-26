Playback control functions.  [More...](#detailed-description)

## Functions

|                | Name           |
| -------------- | -------------- |
| PROJECTM_PLAYLIST_EXPORT void | **[projectm_playlist_set_shuffle](http://localhost:3000/projects/projectm/api/playback#function-projectm-playlist-set-shuffle)**([projectm_playlist_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-playlist-handle) instance, bool shuffle)<br>Enable or disable shuffle mode.  |
| PROJECTM_PLAYLIST_EXPORT bool | **[projectm_playlist_get_shuffle](http://localhost:3000/projects/projectm/api/playback#function-projectm-playlist-get-shuffle)**([projectm_playlist_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-playlist-handle) instance)<br>Retrieves the current state of shuffle mode.  |
| PROJECTM_PLAYLIST_EXPORT void | **[projectm_playlist_set_retry_count](http://localhost:3000/projects/projectm/api/playback#function-projectm-playlist-set-retry-count)**([projectm_playlist_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-playlist-handle) instance, uint32_t retry_count)<br>Sets the number of retries after failed preset switches.  |
| PROJECTM_PLAYLIST_EXPORT uint32_t | **[projectm_playlist_get_retry_count](http://localhost:3000/projects/projectm/api/playback#function-projectm-playlist-get-retry-count)**([projectm_playlist_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-playlist-handle) instance)<br>Returns the number of retries after failed preset switches.  |
| PROJECTM_PLAYLIST_EXPORT uint32_t | **[projectm_playlist_set_position](http://localhost:3000/projects/projectm/api/playback#function-projectm-playlist-set-position)**([projectm_playlist_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-playlist-handle) instance, uint32_t new_position, bool hard_cut)<br>Plays the preset at the requested playlist position and returns the actual playlist index.  |
| PROJECTM_PLAYLIST_EXPORT uint32_t | **[projectm_playlist_get_position](http://localhost:3000/projects/projectm/api/playback#function-projectm-playlist-get-position)**([projectm_playlist_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-playlist-handle) instance)<br>Returns the current playlist position.  |
| PROJECTM_PLAYLIST_EXPORT uint32_t | **[projectm_playlist_play_next](http://localhost:3000/projects/projectm/api/playback#function-projectm-playlist-play-next)**([projectm_playlist_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-playlist-handle) instance, bool hard_cut)<br>Plays the next playlist item and returns the index of the new preset.  |
| PROJECTM_PLAYLIST_EXPORT uint32_t | **[projectm_playlist_play_previous](http://localhost:3000/projects/projectm/api/playback#function-projectm-playlist-play-previous)**([projectm_playlist_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-playlist-handle) instance, bool hard_cut)<br>Plays the previous playlist item and returns the index of the new preset.  |
| PROJECTM_PLAYLIST_EXPORT uint32_t | **[projectm_playlist_play_last](http://localhost:3000/projects/projectm/api/playback#function-projectm-playlist-play-last)**([projectm_playlist_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-playlist-handle) instance, bool hard_cut)<br>Plays the last preset played in the history and returns the index of the preset.  |

## Detailed Description

Playback control functions. 

**Copyright**: 2003-2023 projectM Team


projectM &ndash; Milkdrop-esque visualisation SDK Copyright (C)2003-2023 projectM Team

This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA See 'LICENSE.txt' included within this release 


## Functions Documentation

### function projectm_playlist_set_shuffle

```cpp
PROJECTM_PLAYLIST_EXPORT void projectm_playlist_set_shuffle(
    projectm_playlist_handle instance,
    bool shuffle
)
```

Enable or disable shuffle mode. 

**Parameters**: 

  * **instance** The playlist manager instance. 
  * **shuffle** True to enable random shuffling, false to play presets in playlist order. 


### function projectm_playlist_get_shuffle

```cpp
PROJECTM_PLAYLIST_EXPORT bool projectm_playlist_get_shuffle(
    projectm_playlist_handle instance
)
```

Retrieves the current state of shuffle mode. 

**Parameters**: 

  * **instance** The playlist manager instance. 


**Return**: True if shuffle mode is enabled, false otherwise. 

### function projectm_playlist_set_retry_count

```cpp
PROJECTM_PLAYLIST_EXPORT void projectm_playlist_set_retry_count(
    projectm_playlist_handle instance,
    uint32_t retry_count
)
```

Sets the number of retries after failed preset switches. 

**Parameters**: 

  * **instance** The playlist manager instance. 
  * **retry_count** The number of retries after failed preset switches. Default is 5. Set to 0 to simply forward the failure event from projectM. 


**Note**: Don't set this value too high, as each retry is done recursively. 

### function projectm_playlist_get_retry_count

```cpp
PROJECTM_PLAYLIST_EXPORT uint32_t projectm_playlist_get_retry_count(
    projectm_playlist_handle instance
)
```

Returns the number of retries after failed preset switches. 

**Parameters**: 

  * **instance** The playlist manager instance. 


**Return**: The number of retries after failed preset switches. 

### function projectm_playlist_set_position

```cpp
PROJECTM_PLAYLIST_EXPORT uint32_t projectm_playlist_set_position(
    projectm_playlist_handle instance,
    uint32_t new_position,
    bool hard_cut
)
```

Plays the preset at the requested playlist position and returns the actual playlist index. 

**Parameters**: 

  * **instance** The playlist manager instance. 
  * **new_position** The new position to jump to. 
  * **hard_cut** If true, the preset transition is instant. If true, a smooth transition is played. 


**Return**: The new playlist position. If the playlist is empty, 0 will be returned. 

If the requested position is out of bounds, the returned position will wrap to 0, effectively repeating the playlist as if shuffle was disabled. It has no effect if the playlist is empty.

This method ignores the shuffle setting and will always jump to the requested index, given it is withing playlist bounds.


### function projectm_playlist_get_position

```cpp
PROJECTM_PLAYLIST_EXPORT uint32_t projectm_playlist_get_position(
    projectm_playlist_handle instance
)
```

Returns the current playlist position. 

**Parameters**: 

  * **instance** The playlist manager instance. 


**Return**: The current playlist position. If the playlist is empty, 0 will be returned. 

### function projectm_playlist_play_next

```cpp
PROJECTM_PLAYLIST_EXPORT uint32_t projectm_playlist_play_next(
    projectm_playlist_handle instance,
    bool hard_cut
)
```

Plays the next playlist item and returns the index of the new preset. 

**Parameters**: 

  * **instance** The playlist manager instance. 
  * **hard_cut** If true, the preset transition is instant. If true, a smooth transition is played. 


**Return**: The new playlist position. If the playlist is empty, 0 will be returned. 

If shuffle is on, it will select a random preset, otherwise the next in the playlist. If the end of the playlist is reached in continuous mode, it will wrap back to 0.

The old playlist item is added to the history.


### function projectm_playlist_play_previous

```cpp
PROJECTM_PLAYLIST_EXPORT uint32_t projectm_playlist_play_previous(
    projectm_playlist_handle instance,
    bool hard_cut
)
```

Plays the previous playlist item and returns the index of the new preset. 

**Parameters**: 

  * **instance** The playlist manager instance. 
  * **hard_cut** If true, the preset transition is instant. If true, a smooth transition is played. 


**Return**: The new playlist position. If the playlist is empty, 0 will be returned. 

If shuffle is on, it will select a random preset, otherwise the next in the playlist. If the end of the playlist is reached in continuous mode, it will wrap back to 0.

The old playlist item is added to the history.


### function projectm_playlist_play_last

```cpp
PROJECTM_PLAYLIST_EXPORT uint32_t projectm_playlist_play_last(
    projectm_playlist_handle instance,
    bool hard_cut
)
```

Plays the last preset played in the history and returns the index of the preset. 

**Parameters**: 

  * **instance** The playlist manager instance. 
  * **hard_cut** If true, the preset transition is instant. If true, a smooth transition is played. 


**Return**: The new playlist position. If the playlist is empty, 0 will be returned. 

The history keeps track of the last 1000 presets and will go back in the history. The playback history will be cleared whenever the playlist items are changed.

If the history is empty, this call behaves identical to [projectm_playlist_play_previous()](http://localhost:3000/projects/projectm/api/playback#function-projectm-playlist-play-previous), but the item is not added to the history.

Presets which failed to load are not recorded in the history and thus will be skipped when calling this method.




## Source code

```cpp

#pragma once

#include "projectM-4/playlist_types.h"

#ifdef __cplusplus
extern "C" {
#endif

PROJECTM_PLAYLIST_EXPORT void projectm_playlist_set_shuffle(projectm_playlist_handle instance, bool shuffle);

PROJECTM_PLAYLIST_EXPORT bool projectm_playlist_get_shuffle(projectm_playlist_handle instance);

PROJECTM_PLAYLIST_EXPORT void projectm_playlist_set_retry_count(projectm_playlist_handle instance, uint32_t retry_count);

PROJECTM_PLAYLIST_EXPORT uint32_t projectm_playlist_get_retry_count(projectm_playlist_handle instance);

PROJECTM_PLAYLIST_EXPORT uint32_t projectm_playlist_set_position(projectm_playlist_handle instance, uint32_t new_position,
                                                                 bool hard_cut);

PROJECTM_PLAYLIST_EXPORT uint32_t projectm_playlist_get_position(projectm_playlist_handle instance);

PROJECTM_PLAYLIST_EXPORT uint32_t projectm_playlist_play_next(projectm_playlist_handle instance, bool hard_cut);

PROJECTM_PLAYLIST_EXPORT uint32_t projectm_playlist_play_previous(projectm_playlist_handle instance, bool hard_cut);

PROJECTM_PLAYLIST_EXPORT uint32_t projectm_playlist_play_last(projectm_playlist_handle instance, bool hard_cut);

#ifdef __cplusplus
} // extern "C"
#endif
```


-------------------------------

Updated on 2023-09-26 at 15:44:26 +0000
