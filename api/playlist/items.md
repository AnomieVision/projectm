Playlist item management functions.  [More...](#detailed-description)

## Functions

|                | Name           |
| -------------- | -------------- |
| PROJECTM_PLAYLIST_EXPORT uint32_t | **[projectm_playlist_size](/projectm/apiapi/playlist/playlist__items.md#function-projectm-playlist-size)**([projectm_playlist_handle](/projectm/apiapi/playlist/playlist__types.md#typedef-projectm-playlist-handle) instance)<br>Returns the number of presets in the current playlist.  |
| PROJECTM_PLAYLIST_EXPORT void | **[projectm_playlist_clear](/projectm/apiapi/playlist/playlist__items.md#function-projectm-playlist-clear)**([projectm_playlist_handle](/projectm/apiapi/playlist/playlist__types.md#typedef-projectm-playlist-handle) instance)<br>Clears the playlist.  |
| PROJECTM_PLAYLIST_EXPORT char ** | **[projectm_playlist_items](/projectm/apiapi/playlist/playlist__items.md#function-projectm-playlist-items)**([projectm_playlist_handle](/projectm/apiapi/playlist/playlist__types.md#typedef-projectm-playlist-handle) instance, uint32_t start, uint32_t count)<br>Returns a list of preset files inside the given range of the current playlist, in order.  |
| PROJECTM_PLAYLIST_EXPORT char * | **[projectm_playlist_item](/projectm/apiapi/playlist/playlist__items.md#function-projectm-playlist-item)**([projectm_playlist_handle](/projectm/apiapi/playlist/playlist__types.md#typedef-projectm-playlist-handle) instance, uint32_t index)<br>Returns the name of a preset at the given index in the current playlist.  |
| PROJECTM_PLAYLIST_EXPORT uint32_t | **[projectm_playlist_add_path](/projectm/apiapi/playlist/playlist__items.md#function-projectm-playlist-add-path)**([projectm_playlist_handle](/projectm/apiapi/playlist/playlist__types.md#typedef-projectm-playlist-handle) instance, const char * path, bool recurse_subdirs, bool allow_duplicates)<br>Appends presets from the given path to the end of the current playlist.  |
| PROJECTM_PLAYLIST_EXPORT uint32_t | **[projectm_playlist_insert_path](/projectm/apiapi/playlist/playlist__items.md#function-projectm-playlist-insert-path)**([projectm_playlist_handle](/projectm/apiapi/playlist/playlist__types.md#typedef-projectm-playlist-handle) instance, const char * path, uint32_t index, bool recurse_subdirs, bool allow_duplicates)<br>Inserts presets from the given path to the end of the current playlist.  |
| PROJECTM_PLAYLIST_EXPORT bool | **[projectm_playlist_add_preset](/projectm/apiapi/playlist/playlist__items.md#function-projectm-playlist-add-preset)**([projectm_playlist_handle](/projectm/apiapi/playlist/playlist__types.md#typedef-projectm-playlist-handle) instance, const char * filename, bool allow_duplicates)<br>Adds a single preset to the end of the playlist.  |
| PROJECTM_PLAYLIST_EXPORT bool | **[projectm_playlist_insert_preset](/projectm/apiapi/playlist/playlist__items.md#function-projectm-playlist-insert-preset)**([projectm_playlist_handle](/projectm/apiapi/playlist/playlist__types.md#typedef-projectm-playlist-handle) instance, const char * filename, uint32_t index, bool allow_duplicates)<br>Adds a single preset to the playlist at the specified position.  |
| PROJECTM_PLAYLIST_EXPORT uint32_t | **[projectm_playlist_add_presets](/projectm/apiapi/playlist/playlist__items.md#function-projectm-playlist-add-presets)**([projectm_playlist_handle](/projectm/apiapi/playlist/playlist__types.md#typedef-projectm-playlist-handle) instance, const char ** filenames, uint32_t count, bool allow_duplicates)<br>Adds a list of presets to the end of the playlist.  |
| PROJECTM_PLAYLIST_EXPORT uint32_t | **[projectm_playlist_insert_presets](/projectm/apiapi/playlist/playlist__items.md#function-projectm-playlist-insert-presets)**([projectm_playlist_handle](/projectm/apiapi/playlist/playlist__types.md#typedef-projectm-playlist-handle) instance, const char ** filenames, uint32_t count, unsigned int index, bool allow_duplicates)<br>Adds a single preset to the playlist at the specified position.  |
| PROJECTM_PLAYLIST_EXPORT bool | **[projectm_playlist_remove_preset](/projectm/apiapi/playlist/playlist__items.md#function-projectm-playlist-remove-preset)**([projectm_playlist_handle](/projectm/apiapi/playlist/playlist__types.md#typedef-projectm-playlist-handle) instance, uint32_t index)<br>Removes a single preset from the playlist at the specified position.  |
| PROJECTM_PLAYLIST_EXPORT uint32_t | **[projectm_playlist_remove_presets](/projectm/apiapi/playlist/playlist__items.md#function-projectm-playlist-remove-presets)**([projectm_playlist_handle](/projectm/apiapi/playlist/playlist__types.md#typedef-projectm-playlist-handle) instance, uint32_t index, uint32_t count)<br>Removes a number of presets from the playlist from the specified position.  |
| PROJECTM_PLAYLIST_EXPORT void | **[projectm_playlist_sort](/projectm/apiapi/playlist/playlist__items.md#function-projectm-playlist-sort)**([projectm_playlist_handle](/projectm/apiapi/playlist/playlist__types.md#typedef-projectm-playlist-handle) instance, uint32_t start_index, uint32_t count, [projectm_playlist_sort_predicate](/projectm/apiapi/playlist/playlist__types.md#enum-projectm-playlist-sort-predicate) predicate, [projectm_playlist_sort_order](/projectm/apiapi/playlist/playlist__types.md#enum-projectm-playlist-sort-order) order)<br>Sorts part or the whole playlist according to the given predicate and order.  |

## Detailed Description

Playlist item management functions. 

**Copyright**: 2003-2023 projectM Team


projectM &ndash; Milkdrop-esque visualisation SDK Copyright (C)2003-2023 projectM Team

This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA See 'LICENSE.txt' included within this release 


## Functions Documentation

### function projectm_playlist_size

```cpp
PROJECTM_PLAYLIST_EXPORT uint32_t projectm_playlist_size(
    projectm_playlist_handle instance
)
```

Returns the number of presets in the current playlist. 

**Parameters**: 

  * **instance** The playlist manager instance. 


**Return**: The number of presets in the current playlist. 

### function projectm_playlist_clear

```cpp
PROJECTM_PLAYLIST_EXPORT void projectm_playlist_clear(
    projectm_playlist_handle instance
)
```

Clears the playlist. 

**Parameters**: 

  * **instance** The playlist manager instance to clear. 


### function projectm_playlist_items

```cpp
PROJECTM_PLAYLIST_EXPORT char ** projectm_playlist_items(
    projectm_playlist_handle instance,
    uint32_t start,
    uint32_t count
)
```

Returns a list of preset files inside the given range of the current playlist, in order. 

**Parameters**: 

  * **instance** The playlist manager instance. 
  * **start** The zero-based starting index of the range to return. 
  * **count** The maximum number if items to return. 


**Return**: A pointer to a list of char pointers, each containing a single preset. The last entry is denoted by a null pointer. 

**Note**: 

  * Call [projectm_playlist_free_string_array()](/projectm/apiapi/playlist/playlist__memory.md#function-projectm-playlist-free-string-array) when you're done using the list. 
  * Ideally, don't rely on the value provided as count to iterate over the filenames. Instead, look for the terminating null pointer to abort the loop. 


This function can be used to return the whole playlist to save it to a file, or just a part of it for use in virtual lists. If less elements than given in _count_ are available, only the remainder of items after the starting index are returned. If the starting index equals or exceeds the playlist size, an empty list is returned.


### function projectm_playlist_item

```cpp
PROJECTM_PLAYLIST_EXPORT char * projectm_playlist_item(
    projectm_playlist_handle instance,
    uint32_t index
)
```

Returns the name of a preset at the given index in the current playlist. 

**Parameters**: 

  * **instance** The playlist manager instance. 
  * **index** The index to retrieve the filename for. 


**Return**: The filename of the requested preset, or NULL if the index was out of bounds or the playlist is empty. 

**Note**: 

  * Call [projectm_playlist_free_string()](/projectm/apiapi/playlist/playlist__memory.md#function-projectm-playlist-free-string) when you're done using the return value. 
  * If you need to retrieve a major part of playlist filenames, use [projectm_playlist_items()](/projectm/apiapi/playlist/playlist__items.md#function-projectm-playlist-items) instead. 


### function projectm_playlist_add_path

```cpp
PROJECTM_PLAYLIST_EXPORT uint32_t projectm_playlist_add_path(
    projectm_playlist_handle instance,
    const char * path,
    bool recurse_subdirs,
    bool allow_duplicates
)
```

Appends presets from the given path to the end of the current playlist. 

**Parameters**: 

  * **instance** The playlist manager instance. 
  * **path** A local filesystem path to scan for presets. 
  * **recurse_subdirs** If true, subdirectories of the given path will also be scanned. If false, only the exact path given is searched for presets. 
  * **allow_duplicates** If true, files found will always be added. If false, only files are added that do not already exist in the current playlist. 


**Return**: The number of files added. 0 may indicate issues scanning the path. 

This method will scan the given path for files with a ".milk" extension and add these to the playlist.

Symbolic links are not followed.


### function projectm_playlist_insert_path

```cpp
PROJECTM_PLAYLIST_EXPORT uint32_t projectm_playlist_insert_path(
    projectm_playlist_handle instance,
    const char * path,
    uint32_t index,
    bool recurse_subdirs,
    bool allow_duplicates
)
```

Inserts presets from the given path to the end of the current playlist. 

**Parameters**: 

  * **instance** The playlist manager instance. 
  * **path** A local filesystem path to scan for presets. 
  * **index** The index to insert the presets at. If it exceeds the playlist size, the presets are added at the end of the playlist. 
  * **recurse_subdirs** If true, subdirectories of the given path will also be scanned. If false, only the exact path given is searched for presets. 
  * **allow_duplicates** If true, files found will always be added. If false, only files are added that do not already exist in the current playlist. 


**Return**: The number of files added. 0 may indicate issues scanning the path. 

This method will scan the given path for files with a ".milk" extension and add these to the playlist.

Symbolic links are not followed.


### function projectm_playlist_add_preset

```cpp
PROJECTM_PLAYLIST_EXPORT bool projectm_playlist_add_preset(
    projectm_playlist_handle instance,
    const char * filename,
    bool allow_duplicates
)
```

Adds a single preset to the end of the playlist. 

**Parameters**: 

  * **instance** The playlist manager instance. 
  * **filename** A local preset filename. 
  * **allow_duplicates** If true, the preset filename will always be added. If false, the preset is only added to the playlist if the exact filename doesn't exist in the current playlist. 


**Return**: True if the file was added to the playlist, false if the file was a duplicate and allow_duplicates was set to false. 

**Note**: The file is not checked for existence or for being readable.

### function projectm_playlist_insert_preset

```cpp
PROJECTM_PLAYLIST_EXPORT bool projectm_playlist_insert_preset(
    projectm_playlist_handle instance,
    const char * filename,
    uint32_t index,
    bool allow_duplicates
)
```

Adds a single preset to the playlist at the specified position. 

**Parameters**: 

  * **instance** The playlist manager instance. 
  * **filename** A local preset filename. 
  * **index** The index to insert the preset at. If it exceeds the playlist size, the preset is added at the end of the playlist. 
  * **allow_duplicates** If true, the preset filename will always be added. If false, the preset is only added to the playlist if the exact filename doesn't exist in the current playlist. 


**Return**: True if the file was added to the playlist, false if the file was a duplicate and allow_duplicates was set to false. 

**Note**: The file is not checked for existence or for being readable.

To always add a file at the end of the playlist, use [projectm_playlist_add_preset()](/projectm/apiapi/playlist/playlist__items.md#function-projectm-playlist-add-preset) as it is performs better.


### function projectm_playlist_add_presets

```cpp
PROJECTM_PLAYLIST_EXPORT uint32_t projectm_playlist_add_presets(
    projectm_playlist_handle instance,
    const char ** filenames,
    uint32_t count,
    bool allow_duplicates
)
```

Adds a list of presets to the end of the playlist. 

**Parameters**: 

  * **instance** The playlist manager instance. 
  * **filenames** A list of local preset filenames. 
  * **count** The number of files in the list. 
  * **allow_duplicates** If true, the preset filenames will always be added. If false, a preset is only added to the playlist if the exact filename doesn't exist in the current playlist. 


**Return**: The number of files added to the playlist. Ranges between 0 and count. 

**Note**: The files are not checked for existence or for being readable.

### function projectm_playlist_insert_presets

```cpp
PROJECTM_PLAYLIST_EXPORT uint32_t projectm_playlist_insert_presets(
    projectm_playlist_handle instance,
    const char ** filenames,
    uint32_t count,
    unsigned int index,
    bool allow_duplicates
)
```

Adds a single preset to the playlist at the specified position. 

**Parameters**: 

  * **instance** The playlist manager instance. 
  * **filenames** A list of local preset filenames. 
  * **count** The number of files in the list. 
  * **index** The index to insert the presets at. If it exceeds the playlist size, the presets are added at the end of the playlist. 
  * **allow_duplicates** If true, the preset filenames will always be added. If false, a preset is only added to the playlist if the exact filename doesn't exist in the current playlist. 


**Return**: The number of files added to the playlist. Ranges between 0 and count. 

**Note**: The files are not checked for existence or for being readable.

To always add a file at the end of the playlist, use [projectm_playlist_add_preset()](/projectm/apiapi/playlist/playlist__items.md#function-projectm-playlist-add-preset) as it is performs better.


### function projectm_playlist_remove_preset

```cpp
PROJECTM_PLAYLIST_EXPORT bool projectm_playlist_remove_preset(
    projectm_playlist_handle instance,
    uint32_t index
)
```

Removes a single preset from the playlist at the specified position. 

**Parameters**: 

  * **instance** The playlist manager instance. 
  * **index** The preset index to remove. If it exceeds the playlist size, no preset will be removed. 


**Return**: True if the preset was removed from the playlist, false if the index was out of range. 

### function projectm_playlist_remove_presets

```cpp
PROJECTM_PLAYLIST_EXPORT uint32_t projectm_playlist_remove_presets(
    projectm_playlist_handle instance,
    uint32_t index,
    uint32_t count
)
```

Removes a number of presets from the playlist from the specified position. 

**Parameters**: 

  * **instance** The playlist manager instance. 
  * **index** The first preset index to remove. If it exceeds the playlist size, no preset will be removed. 
  * **count** The number of presets to remove from the given index. 


**Return**: The number of presets removed from the playlist. 

### function projectm_playlist_sort

```cpp
PROJECTM_PLAYLIST_EXPORT void projectm_playlist_sort(
    projectm_playlist_handle instance,
    uint32_t start_index,
    uint32_t count,
    projectm_playlist_sort_predicate predicate,
    projectm_playlist_sort_order order
)
```

Sorts part or the whole playlist according to the given predicate and order. 

**Parameters**: 

  * **instance** The playlist manager instance. 
  * **start_index** The starting index to begin sorting at. 
  * **count** The number of items, beginning at start_index, to sort. 
  * **predicate** The predicate to use for sorting. Default is SORT_PREDICATE_FULL_PATH. 
  * **order** The sort order. Default is SORT_ORDER_ASCENDING. 


It is safe to provide values in start_index and count that will exceed the number of items in the playlist. Only items that fall into an existing index range are sorted. If start_index is equal to or larger than the playlist size, no items are sorted. If start_index is inside the playlist, but adding count results in an index outside the playlist, items until the end are sorted.

Sort order is lexicographical for both predicates and case-sensitive.

If invalid values are provides as predicate or order, the defaults as mentioned in the parameter description are used.




## Source code

```cpp

#pragma once

#include "projectM-4/playlist_types.h"

#ifdef __cplusplus
extern "C" {
#endif

PROJECTM_PLAYLIST_EXPORT uint32_t projectm_playlist_size(projectm_playlist_handle instance);

PROJECTM_PLAYLIST_EXPORT void projectm_playlist_clear(projectm_playlist_handle instance);

PROJECTM_PLAYLIST_EXPORT char** projectm_playlist_items(projectm_playlist_handle instance, uint32_t start, uint32_t count);

PROJECTM_PLAYLIST_EXPORT char* projectm_playlist_item(projectm_playlist_handle instance, uint32_t index);

PROJECTM_PLAYLIST_EXPORT uint32_t projectm_playlist_add_path(projectm_playlist_handle instance, const char* path,
                                                             bool recurse_subdirs, bool allow_duplicates);


PROJECTM_PLAYLIST_EXPORT uint32_t projectm_playlist_insert_path(projectm_playlist_handle instance, const char* path,
                                                                uint32_t index, bool recurse_subdirs, bool allow_duplicates);

PROJECTM_PLAYLIST_EXPORT bool projectm_playlist_add_preset(projectm_playlist_handle instance, const char* filename,
                                                           bool allow_duplicates);

PROJECTM_PLAYLIST_EXPORT bool projectm_playlist_insert_preset(projectm_playlist_handle instance, const char* filename,
                                                              uint32_t index, bool allow_duplicates);

PROJECTM_PLAYLIST_EXPORT uint32_t projectm_playlist_add_presets(projectm_playlist_handle instance, const char** filenames,
                                                                uint32_t count, bool allow_duplicates);

PROJECTM_PLAYLIST_EXPORT uint32_t projectm_playlist_insert_presets(projectm_playlist_handle instance, const char** filenames,
                                                                   uint32_t count, unsigned int index, bool allow_duplicates);

PROJECTM_PLAYLIST_EXPORT bool projectm_playlist_remove_preset(projectm_playlist_handle instance, uint32_t index);

PROJECTM_PLAYLIST_EXPORT uint32_t projectm_playlist_remove_presets(projectm_playlist_handle instance, uint32_t index,
                                                                   uint32_t count);

PROJECTM_PLAYLIST_EXPORT void projectm_playlist_sort(projectm_playlist_handle instance, uint32_t start_index, uint32_t count,
                                                     projectm_playlist_sort_predicate predicate, projectm_playlist_sort_order order);

#ifdef __cplusplus
} // extern "C"
#endif
```


-------------------------------

Updated on 2023-09-24 at 00:54:20 +0000
