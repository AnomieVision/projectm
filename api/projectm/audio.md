Functions to pass in audio data to libprojectM.  [More...](#detailed-description)

## Functions

|                | Name           |
| -------------- | -------------- |
| PROJECTM_EXPORT unsigned int | **[projectm_pcm_get_max_samples](/projectmapi/projectm/audio.md#function-projectm-pcm-get-max-samples)**()<br>Returns the maximum number of audio samples that can be stored.  |
| PROJECTM_EXPORT void | **[projectm_pcm_add_float](/projectmapi/projectm/audio.md#function-projectm-pcm-add-float)**([projectm_handle](/projectmapi/projectm/types.md#typedef-projectm-handle) instance, const float * samples, unsigned int count, [projectm_channels](/projectmapi/projectm/types.md#enum-projectm-channels) channels)<br>Adds 32-bit floating-point audio samples.  |
| PROJECTM_EXPORT void | **[projectm_pcm_add_int16](/projectmapi/projectm/audio.md#function-projectm-pcm-add-int16)**([projectm_handle](/projectmapi/projectm/types.md#typedef-projectm-handle) instance, const int16_t * samples, unsigned int count, [projectm_channels](/projectmapi/projectm/types.md#enum-projectm-channels) channels)<br>Adds 16-bit integer audio samples.  |
| PROJECTM_EXPORT void | **[projectm_pcm_add_uint8](/projectmapi/projectm/audio.md#function-projectm-pcm-add-uint8)**([projectm_handle](/projectmapi/projectm/types.md#typedef-projectm-handle) instance, const uint8_t * samples, unsigned int count, [projectm_channels](/projectmapi/projectm/types.md#enum-projectm-channels) channels)<br>Adds 8-bit unsigned integer audio samples.  |

## Detailed Description

Functions to pass in audio data to libprojectM. 

**Copyright**: 2003-2023 projectM Team


projectM &ndash; Milkdrop-esque visualisation SDK Copyright (C)2003-2023 projectM Team

This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA See 'LICENSE.txt' included within this release 


## Functions Documentation

### function projectm_pcm_get_max_samples

```cpp
PROJECTM_EXPORT unsigned int projectm_pcm_get_max_samples()
```

Returns the maximum number of audio samples that can be stored. 

**Return**: The number of audio samples that are stored, per channel. 

Each PCM data UpdateMeshSize should not exceed this number of samples. If more samples are added, only this number of samples is stored and the remainder discarded.


### function projectm_pcm_add_float

```cpp
PROJECTM_EXPORT void projectm_pcm_add_float(
    projectm_handle instance,
    const float * samples,
    unsigned int count,
    projectm_channels channels
)
```

Adds 32-bit floating-point audio samples. 

**Parameters**: 

  * **instance** The projectM instance handle. 
  * **samples** An array of PCM samples. Each sample is expected to be within the range -1 to 1. 
  * **count** The number of audio samples in a channel. 
  * **channels** If the buffer is mono or stereo. Can be PROJECTM_MONO or PROJECTM_STEREO. 


This function is used to add new audio data to projectM's internal audio buffer. It is internally converted to 2-channel float data, duplicating the channel.

If stereo, the channel order in samples is LRLRLR.


### function projectm_pcm_add_int16

```cpp
PROJECTM_EXPORT void projectm_pcm_add_int16(
    projectm_handle instance,
    const int16_t * samples,
    unsigned int count,
    projectm_channels channels
)
```

Adds 16-bit integer audio samples. 

**Parameters**: 

  * **instance** The projectM instance handle. 
  * **samples** An array of PCM samples. 
  * **count** The number of audio samples in a channel. 
  * **channels** If the buffer is mono or stereo. Can be PROJECTM_MONO or PROJECTM_STEREO. 


This function is used to add new audio data to projectM's internal audio buffer. It is internally converted to 2-channel float data, duplicating the channel.

If stereo, the channel order in samples is LRLRLR.


### function projectm_pcm_add_uint8

```cpp
PROJECTM_EXPORT void projectm_pcm_add_uint8(
    projectm_handle instance,
    const uint8_t * samples,
    unsigned int count,
    projectm_channels channels
)
```

Adds 8-bit unsigned integer audio samples. 

**Parameters**: 

  * **instance** The projectM instance handle. 
  * **samples** An array of PCM samples. 
  * **count** The number of audio samples in a channel. 
  * **channels** If the buffer is mono or stereo. Can be PROJECTM_MONO or PROJECTM_STEREO. 


This function is used to add new audio data to projectM's internal audio buffer. It is internally converted to 2-channel float data, duplicating the channel.

If stereo, the channel order in samples is LRLRLR.




## Source code

```cpp

#pragma once

#include "projectM-4/types.h"

#ifdef __cplusplus
extern "C" {
#endif

PROJECTM_EXPORT unsigned int projectm_pcm_get_max_samples();

PROJECTM_EXPORT void projectm_pcm_add_float(projectm_handle instance, const float* samples,
                                            unsigned int count, projectm_channels channels);

PROJECTM_EXPORT void projectm_pcm_add_int16(projectm_handle instance, const int16_t* samples,
                                            unsigned int count, projectm_channels channels);

PROJECTM_EXPORT void projectm_pcm_add_uint8(projectm_handle instance, const uint8_t* samples,
                                            unsigned int count, projectm_channels channels);

#ifdef __cplusplus
} // extern "C"
#endif
```


-------------------------------

Updated on 2023-09-24 at 13:23:55 +0000
