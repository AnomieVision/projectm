

## Defines

|                | Name           |
| -------------- | -------------- |
|  | **[PROJECTM_EXPORT](http://localhost:3000/projects/projectm/api/projectM__export#define-projectm-export)**  |
|  | **[PROJECTM_NO_EXPORT](http://localhost:3000/projects/projectm/api/projectM__export#define-projectm-no-export)**  |
|  | **[PROJECTM_DEPRECATED](http://localhost:3000/projects/projectm/api/projectM__export#define-projectm-deprecated)**  |
|  | **[PROJECTM_DEPRECATED_EXPORT](http://localhost:3000/projects/projectm/api/projectM__export#define-projectm-deprecated-export)**  |
|  | **[PROJECTM_DEPRECATED_NO_EXPORT](http://localhost:3000/projects/projectm/api/projectM__export#define-projectm-deprecated-no-export)**  |




## Macros Documentation

### define PROJECTM_EXPORT

```cpp
#define PROJECTM_EXPORT __attribute__((visibility("default")))
```


### define PROJECTM_NO_EXPORT

```cpp
#define PROJECTM_NO_EXPORT __attribute__((visibility("hidden")))
```


### define PROJECTM_DEPRECATED

```cpp
#define PROJECTM_DEPRECATED __attribute__ ((__deprecated__))
```


### define PROJECTM_DEPRECATED_EXPORT

```cpp
#define PROJECTM_DEPRECATED_EXPORT PROJECTM_EXPORT PROJECTM_DEPRECATED
```


### define PROJECTM_DEPRECATED_NO_EXPORT

```cpp
#define PROJECTM_DEPRECATED_NO_EXPORT PROJECTM_NO_EXPORT PROJECTM_DEPRECATED
```


## Source code

```cpp

#ifndef PROJECTM_EXPORT_H
#define PROJECTM_EXPORT_H

#ifdef PROJECTM_STATIC_DEFINE
#  define PROJECTM_EXPORT
#  define PROJECTM_NO_EXPORT
#else
#  ifndef PROJECTM_EXPORT
#    ifdef projectM_api_EXPORTS
        /* We are building this library */
#      define PROJECTM_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define PROJECTM_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef PROJECTM_NO_EXPORT
#    define PROJECTM_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef PROJECTM_DEPRECATED
#  define PROJECTM_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef PROJECTM_DEPRECATED_EXPORT
#  define PROJECTM_DEPRECATED_EXPORT PROJECTM_EXPORT PROJECTM_DEPRECATED
#endif

#ifndef PROJECTM_DEPRECATED_NO_EXPORT
#  define PROJECTM_DEPRECATED_NO_EXPORT PROJECTM_NO_EXPORT PROJECTM_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef PROJECTM_NO_DEPRECATED
#    define PROJECTM_NO_DEPRECATED
#  endif
#endif

#endif /* PROJECTM_EXPORT_H */
```


-------------------------------

Updated on 2023-09-26 at 16:35:52 +0000
