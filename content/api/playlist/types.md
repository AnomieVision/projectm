Types and enumerations used in the playlist API headers.  [More...](#detailed-description)

## Types

|                | Name           |
| -------------- | -------------- |
| enum| **[projectm_playlist_sort_predicate](/projectm/api/types.md#enum-projectm-playlist-sort-predicate)** { SORT_PREDICATE_FULL_PATH, SORT_PREDICATE_FILENAME_ONLY} |
| enum| **[projectm_playlist_sort_order](/projectm/api/types.md#enum-projectm-playlist-sort-order)** { SORT_ORDER_ASCENDING, SORT_ORDER_DESCENDING} |
| typedef struct projectm_playlist * | **[projectm_playlist_handle](/projectm/api/types.md#typedef-projectm-playlist-handle)** <br>Opaque projectM playlist instance type.  |

## Detailed Description

Types and enumerations used in the playlist API headers. 

**Copyright**: 2003-2023 projectM Team


projectM &ndash; Milkdrop-esque visualisation SDK Copyright (C)2003-2023 projectM Team

This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA See 'LICENSE.txt' included within this release 

## Types Documentation

### enum projectm_playlist_sort_predicate

| Enumerator | Value | Description |
| ---------- | ----- | ----------- |
| SORT_PREDICATE_FULL_PATH | | Sort by full path name.   |
| SORT_PREDICATE_FILENAME_ONLY | | Sort only by preset filename.   |




Sort predicate for playlist sorting. 


### enum projectm_playlist_sort_order

| Enumerator | Value | Description |
| ---------- | ----- | ----------- |
| SORT_ORDER_ASCENDING | | Sort in alphabetically ascending order.   |
| SORT_ORDER_DESCENDING | | Sort in alphabetically descending order.   |




Sort order for playlist sorting. 


### typedef projectm_playlist_handle

```cpp
typedef struct projectm_playlist* projectm_playlist_handle;
```

Opaque projectM playlist instance type. 

A pointer to the opaque projectM playlist instance. 





## Source code

```cpp

#pragma once

#include "projectM-4/projectM_playlist_export.h"

#ifdef -cplusplus
extern "C" {
#endif

struct projectm_playlist;                                   
typedef struct projectm_playlist* projectm_playlist_handle; 

typedef enum
{
    SORT_PREDICATE_FULL_PATH,    
    SORT_PREDICATE_FILENAME_ONLY 
} projectm_playlist_sort_predicate;


typedef enum
{
    SORT_ORDER_ASCENDING, 
    SORT_ORDER_DESCENDING 
} projectm_playlist_sort_order;

#ifdef -cplusplus
} // extern "C"
#endif
```


-------------------------------

Updated on 2023-09-26 at 05:44:38 +0000
