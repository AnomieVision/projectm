Types and enumerations used in the other API headers.  [More...](#detailed-description)

## Types

|                | Name           |
| -------------- | -------------- |
| enum| **[projectm_channels](/projectm/types.md#enum-projectm-channels)** { PROJECTM_MONO = 1, PROJECTM_STEREO = 2} |
| enum| **[projectm_pcm_channel](/projectm/types.md#enum-projectm-pcm-channel)** { PROJECTM_CHANNEL_L = 0, PROJECTM_CHANNEL_0 = 0, PROJECTM_CHANNEL_R = 1, PROJECTM_CHANNEL_1 = 1} |
| enum| **[projectm_touch_type](/projectm/types.md#enum-projectm-touch-type)** { PROJECTM_TOUCH_TYPE_RANDOM, PROJECTM_TOUCH_TYPE_CIRCLE, PROJECTM_TOUCH_TYPE_RADIAL_BLOB, PROJECTM_TOUCH_TYPE_BLOB2, PROJECTM_TOUCH_TYPE_BLOB3, PROJECTM_TOUCH_TYPE_DERIVATIVE_LINE, PROJECTM_TOUCH_TYPE_BLOB5, PROJECTM_TOUCH_TYPE_LINE, PROJECTM_TOUCH_TYPE_DOUBLE_LINE} |
| typedef struct projectm * | **[projectm_handle](/projectm/types.md#typedef-projectm-handle)** <br>Opaque projectM instance type.  |

## Detailed Description

Types and enumerations used in the other API headers. 

**Copyright**: 2003-2023 projectM Team


projectM &ndash; Milkdrop-esque visualisation SDK Copyright (C)2003-2023 projectM Team

This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA See 'LICENSE.txt' included within this release 

## Types Documentation

### enum projectm_channels

| Enumerator | Value | Description |
| ---------- | ----- | ----------- |
| PROJECTM_MONO | 1|   |
| PROJECTM_STEREO | 2|   |




For specifying audio data format. 


### enum projectm_pcm_channel

| Enumerator | Value | Description |
| ---------- | ----- | ----------- |
| PROJECTM_CHANNEL_L | 0| Left audio channel.   |
| PROJECTM_CHANNEL_0 | 0| Left audio channel.   |
| PROJECTM_CHANNEL_R | 1| Right audio channel.   |
| PROJECTM_CHANNEL_1 | 1| Right audio channel.   |




Placeholder values that can be used to address channel indices in PCM data arrays. 


### enum projectm_touch_type

| Enumerator | Value | Description |
| ---------- | ----- | ----------- |
| PROJECTM_TOUCH_TYPE_RANDOM | | Random waveform type.   |
| PROJECTM_TOUCH_TYPE_CIRCLE | | Draws a circular waveform.   |
| PROJECTM_TOUCH_TYPE_RADIAL_BLOB | | Draws a radial blob waveform.   |
| PROJECTM_TOUCH_TYPE_BLOB2 | | Draws a blob-style waveform.   |
| PROJECTM_TOUCH_TYPE_BLOB3 | | Draws another blob-style waveform.   |
| PROJECTM_TOUCH_TYPE_DERIVATIVE_LINE | | Draws a derivative-line waveform.   |
| PROJECTM_TOUCH_TYPE_BLOB5 | | Draws a five-blob waveform.   |
| PROJECTM_TOUCH_TYPE_LINE | | Draws a single-line waveform.   |
| PROJECTM_TOUCH_TYPE_DOUBLE_LINE | | Draws a double-line waveform.   |




Waveform render types used in the touch start method. 


### typedef projectm_handle

```cpp
typedef struct projectm* projectm_handle;
```

Opaque projectM instance type. 

A pointer to the opaque projectM instance. 





## Source code

```cpp

#pragma once

#include "projectM-4/projectM_export.h"

#ifdef -cplusplus
extern "C" {
#endif

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

struct projectm;                          
typedef struct projectm* projectm_handle; 

typedef enum
{
    PROJECTM_MONO = 1,
    PROJECTM_STEREO = 2
} projectm_channels;

typedef enum
{
    PROJECTM_CHANNEL_L = 0, 
    PROJECTM_CHANNEL_0 = 0, 
    PROJECTM_CHANNEL_R = 1, 
    PROJECTM_CHANNEL_1 = 1  
} projectm_pcm_channel;

typedef enum
{
    PROJECTM_TOUCH_TYPE_RANDOM,          
    PROJECTM_TOUCH_TYPE_CIRCLE,          
    PROJECTM_TOUCH_TYPE_RADIAL_BLOB,     
    PROJECTM_TOUCH_TYPE_BLOB2,           
    PROJECTM_TOUCH_TYPE_BLOB3,           
    PROJECTM_TOUCH_TYPE_DERIVATIVE_LINE, 
    PROJECTM_TOUCH_TYPE_BLOB5,           
    PROJECTM_TOUCH_TYPE_LINE,            
    PROJECTM_TOUCH_TYPE_DOUBLE_LINE      
} projectm_touch_type;

#ifdef -cplusplus
} // extern "C"
#endif
```


-------------------------------

Updated on 2023-09-26 at 05:12:10 +0000
