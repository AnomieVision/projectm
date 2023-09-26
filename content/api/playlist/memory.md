Memory allocation/deallocation helpers.  [More...](#detailed-description)

## Functions

|                | Name           |
| -------------- | -------------- |
| PROJECTM_PLAYLIST_EXPORT void | **[projectm_playlist_free_string](/projectm/memory.md#function-projectm-playlist-free-string)**(char * string)<br>Frees a char pointer returned by any of the playlist API functions.  |
| PROJECTM_PLAYLIST_EXPORT void | **[projectm_playlist_free_string_array](/projectm/memory.md#function-projectm-playlist-free-string-array)**(char ** array)<br>Frees a string array returned by any of the playlist API functions.  |

## Detailed Description

Memory allocation/deallocation helpers. 

**Copyright**: 2003-2023 projectM Team


projectM &ndash; Milkdrop-esque visualisation SDK Copyright (C)2003-2023 projectM Team

This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA See 'LICENSE.txt' included within this release 


## Functions Documentation

### function projectm_playlist_free_string

```cpp
PROJECTM_PLAYLIST_EXPORT void projectm_playlist_free_string(
    char * string
)
```

Frees a char pointer returned by any of the playlist API functions. 

**Parameters**: 

  * **string** A pointer to a string that should be freed. 


Please only use this function with char pointers returned by the playlist library, and don't use other projectM memory management functions with pointers returned by the playlist library.


### function projectm_playlist_free_string_array

```cpp
PROJECTM_PLAYLIST_EXPORT void projectm_playlist_free_string_array(
    char ** array
)
```

Frees a string array returned by any of the playlist API functions. 

**Parameters**: 

  * **array** The pointer to the array of strings that should be freed. 


Please only use this function with pointers returned by the playlist library, and don't use other projectM memory management functions with pointers returned by the playlist library.




## Source code

```cpp

#pragma once

#include "projectM-4/playlist_types.h"

#ifdef -cplusplus
extern "C" {
#endif

PROJECTM_PLAYLIST_EXPORT void projectm_playlist_free_string(char* string);

PROJECTM_PLAYLIST_EXPORT void projectm_playlist_free_string_array(char** array);

#ifdef -cplusplus
} // extern "C"
#endif
```


-------------------------------

Updated on 2023-09-26 at 05:26:43 +0000
