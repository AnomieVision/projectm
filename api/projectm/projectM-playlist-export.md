

## Defines

|                | Name           |
| -------------- | -------------- |
|  | **[PROJECTM_PLAYLIST_EXPORT](/projectmapi/projectm/projectM__playlist__export.md#define-projectm-playlist-export)**  |
|  | **[PROJECTM_PLAYLIST_NO_EXPORT](/projectmapi/projectm/projectM__playlist__export.md#define-projectm-playlist-no-export)**  |
|  | **[PROJECTM_PLAYLIST_DEPRECATED](/projectmapi/projectm/projectM__playlist__export.md#define-projectm-playlist-deprecated)**  |
|  | **[PROJECTM_PLAYLIST_DEPRECATED_EXPORT](/projectmapi/projectm/projectM__playlist__export.md#define-projectm-playlist-deprecated-export)**  |
|  | **[PROJECTM_PLAYLIST_DEPRECATED_NO_EXPORT](/projectmapi/projectm/projectM__playlist__export.md#define-projectm-playlist-deprecated-no-export)**  |




## Macros Documentation

### define PROJECTM_PLAYLIST_EXPORT

```cpp
#define PROJECTM_PLAYLIST_EXPORT __attribute__((visibility("default")))
```


### define PROJECTM_PLAYLIST_NO_EXPORT

```cpp
#define PROJECTM_PLAYLIST_NO_EXPORT __attribute__((visibility("hidden")))
```


### define PROJECTM_PLAYLIST_DEPRECATED

```cpp
#define PROJECTM_PLAYLIST_DEPRECATED __attribute__ ((__deprecated__))
```


### define PROJECTM_PLAYLIST_DEPRECATED_EXPORT

```cpp
#define PROJECTM_PLAYLIST_DEPRECATED_EXPORT PROJECTM_PLAYLIST_EXPORT PROJECTM_PLAYLIST_DEPRECATED
```


### define PROJECTM_PLAYLIST_DEPRECATED_NO_EXPORT

```cpp
#define PROJECTM_PLAYLIST_DEPRECATED_NO_EXPORT PROJECTM_PLAYLIST_NO_EXPORT PROJECTM_PLAYLIST_DEPRECATED
```


## Source code

```cpp

#ifndef PROJECTM_PLAYLIST_EXPORT_H
#define PROJECTM_PLAYLIST_EXPORT_H

#ifdef PROJECTM_PLAYLIST_STATIC_DEFINE
#  define PROJECTM_PLAYLIST_EXPORT
#  define PROJECTM_PLAYLIST_NO_EXPORT
#else
#  ifndef PROJECTM_PLAYLIST_EXPORT
#    ifdef projectM_playlist_EXPORTS
        /* We are building this library */
#      define PROJECTM_PLAYLIST_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define PROJECTM_PLAYLIST_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef PROJECTM_PLAYLIST_NO_EXPORT
#    define PROJECTM_PLAYLIST_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef PROJECTM_PLAYLIST_DEPRECATED
#  define PROJECTM_PLAYLIST_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef PROJECTM_PLAYLIST_DEPRECATED_EXPORT
#  define PROJECTM_PLAYLIST_DEPRECATED_EXPORT PROJECTM_PLAYLIST_EXPORT PROJECTM_PLAYLIST_DEPRECATED
#endif

#ifndef PROJECTM_PLAYLIST_DEPRECATED_NO_EXPORT
#  define PROJECTM_PLAYLIST_DEPRECATED_NO_EXPORT PROJECTM_PLAYLIST_NO_EXPORT PROJECTM_PLAYLIST_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef PROJECTM_PLAYLIST_NO_DEPRECATED
#    define PROJECTM_PLAYLIST_NO_DEPRECATED
#  endif
#endif

#endif /* PROJECTM_PLAYLIST_EXPORT_H */
```


-------------------------------

Updated on 2023-09-24 at 04:19:54 +0000
