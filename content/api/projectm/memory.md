Memory allocation/deallocation helpers.  [More...](#detailed-description)

## Functions

|                | Name           |
| -------------- | -------------- |
| PROJECTM_EXPORT char * | **[projectm_alloc_string](/projectm/api/memory.md#function-projectm-alloc-string)**(unsigned int length)<br>Allocates memory for a string and returns the pointer.  |
| PROJECTM_EXPORT void | **[projectm_free_string](/projectm/api/memory.md#function-projectm-free-string)**(const char * str)<br>Frees the memory of an allocated string.  |

## Detailed Description

Memory allocation/deallocation helpers. 

**Copyright**: 2003-2023 projectM Team


projectM &ndash; Milkdrop-esque visualisation SDK Copyright (C)2003-2023 projectM Team

This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA See 'LICENSE.txt' included within this release 


## Functions Documentation

### function projectm_alloc_string

```cpp
PROJECTM_EXPORT char * projectm_alloc_string(
    unsigned int length
)
```

Allocates memory for a string and returns the pointer. 

**Return**: A pointer to a zero-initialized memory area. 

To free the allocated memory, call [projectm_free_string()](/projectm/api/memory.md#function-projectm-free-string). Do not use free()!


### function projectm_free_string

```cpp
PROJECTM_EXPORT void projectm_free_string(
    const char * str
)
```

Frees the memory of an allocated string. 

**Parameters**: 

  * **str** A pointer returned by [projectm_alloc_string()](/projectm/api/memory.md#function-projectm-alloc-string). 


Frees the memory allocated by a call to [projectm_alloc_string()](/projectm/api/memory.md#function-projectm-alloc-string) or any (const) char* pointers returned by a projectM API call.

Do not use free() to delete the pointer!




## Source code

```cpp

#pragma once

#include "projectM-4/types.h"

#ifdef -cplusplus
extern "C" {
#endif

PROJECTM_EXPORT char* projectm_alloc_string(unsigned int length);

PROJECTM_EXPORT void projectm_free_string(const char* str);

#ifdef -cplusplus
} // extern "C"
#endif
```


-------------------------------

Updated on 2023-09-26 at 05:44:38 +0000
