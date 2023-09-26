Functions to configure and render projectM visuals using OpenGL.  [More...](#detailed-description)

## Functions

|                | Name           |
| -------------- | -------------- |
| PROJECTM_EXPORT void | **[projectm_opengl_render_frame](http://localhost:3000/projects/projectm/api/render__opengl#function-projectm-opengl-render-frame)**([projectm_handle](http://localhost:3000/projects/projectm/api/types#typedef-projectm-handle) instance)<br>Renders a single frame.  |

## Detailed Description

Functions to configure and render projectM visuals using OpenGL. 

**Copyright**: 2003-2023 projectM Team


projectM &ndash; Milkdrop-esque visualisation SDK Copyright (C)2003-2023 projectM Team

This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA See 'LICENSE.txt' included within this release 


## Functions Documentation

### function projectm_opengl_render_frame

```cpp
PROJECTM_EXPORT void projectm_opengl_render_frame(
    projectm_handle instance
)
```

Renders a single frame. 

**Parameters**: 

  * **instance** The projectM instance handle. 


**Note**: Separate two-pass frame rendering is currently not supported by the C API as it is rarely used and also depends on the loaded preset.



## Source code

```cpp

#pragma once

#include "projectM-4/types.h"

#ifdef __cplusplus
extern "C" {
#endif

PROJECTM_EXPORT void projectm_opengl_render_frame(projectm_handle instance);

#ifdef __cplusplus
} // extern "C"
#endif
```


-------------------------------

Updated on 2023-09-26 at 15:44:26 +0000
