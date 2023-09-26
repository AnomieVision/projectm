

## Types

|                | Name           |
| -------------- | -------------- |
| typedef double | **[PRJM_EVAL_F](http://localhost:3000/projects/projectm/api/projectm-eval#typedef-prjm-eval-f)**  |
| typedef PRJM_EVAL_F ** | **[projectm_eval_mem_buffer](http://localhost:3000/projects/projectm/api/projectm-eval#typedef-projectm-eval-mem-buffer)** <br>Buffer pointer for megabuf/gmegabuf memory.  |

## Functions

|                | Name           |
| -------------- | -------------- |
| void | **[projectm_eval_memory_host_lock_mutex](http://localhost:3000/projects/projectm/api/projectm-eval#function-projectm-eval-memory-host-lock-mutex)**()<br>Host-defined lock function. Used to prevent race conditions with memory access. Only required if multiple expressions using the same global/local memory blocks will run in separate threads at the same time. Can be an empty function otherwise. The function is not required to use a recursive mutex.  |
| void | **[projectm_eval_memory_host_unlock_mutex](http://localhost:3000/projects/projectm/api/projectm-eval#function-projectm-eval-memory-host-unlock-mutex)**()<br>Host-defined unlock function. Used to prevent race conditions with memory access. Only required if multiple expressions using the same global/local memory blocks will run in separate threads at the same time. Can be an empty function otherwise.  |
| projectm_eval_mem_buffer | **[projectm_eval_memory_buffer_create](http://localhost:3000/projects/projectm/api/projectm-eval#function-projectm-eval-memory-buffer-create)**()<br>Allocates an empty memory buffer to hold gmegabuf data.  |
| void | **[projectm_eval_memory_buffer_destroy](http://localhost:3000/projects/projectm/api/projectm-eval#function-projectm-eval-memory-buffer-destroy)**(projectm_eval_mem_buffer buffer)<br>Destroys a memory buffer and frees any allocated blocks. Only destroy a buffer if no context is using it anymore.  |
| void | **[projectm_eval_memory_global_destroy](http://localhost:3000/projects/projectm/api/projectm-eval#function-projectm-eval-memory-global-destroy)**()<br>Frees the built-in global memory buffer. Only destroy the global buffer if no context is using it anymore.  |
| struct projectm_eval_context * | **[projectm_eval_context_create](http://localhost:3000/projects/projectm/api/projectm-eval#function-projectm-eval-context-create)**(projectm_eval_mem_buffer global_mem, PRJM_EVAL_F(*) global_variables[100])<br>Creates a new execution context.  |
| void | **[projectm_eval_context_destroy](http://localhost:3000/projects/projectm/api/projectm-eval#function-projectm-eval-context-destroy)**(struct projectm_eval_context * ctx)<br>Destroys an execution context and frees all associated resources. Any code and variable references associated with the destroyed context will become invalid and must not be used after calling this function.  |
| void | **[projectm_eval_context_free_memory](http://localhost:3000/projects/projectm/api/projectm-eval#function-projectm-eval-context-free-memory)**(struct projectm_eval_context * ctx)<br>Frees the allocated memory of the context-local buffer, effectively resetting it. This will not clear the global memory buffer associated with the context.  |
| void | **[projectm_eval_context_reset_variables](http://localhost:3000/projects/projectm/api/projectm-eval#function-projectm-eval-context-reset-variables)**(struct projectm_eval_context * ctx)<br>Sets all context variables to 0.0. Registered variables will be kept intact, as the pointers will not change. Global variables reg00 to reg99 will also stay unchanged.  |
| PRJM_EVAL_F * | **[projectm_eval_context_register_variable](http://localhost:3000/projects/projectm/api/projectm-eval#function-projectm-eval-context-register-variable)**(struct projectm_eval_context * ctx, const char * var_name)<br>Registers a variable and returns the value pointer. Variables can be registered at any time. If the variable doesn't exist yet, it is created, otherwise the existing variable is being returned. Any code compiled before or after will use the same variable, referenced by its case-insensitive name.  |
| struct projectm_eval_code * | **[projectm_eval_code_compile](http://localhost:3000/projects/projectm/api/projectm-eval#function-projectm-eval-code-compile)**(struct projectm_eval_context * ctx, const char * code)<br>Compiled the given code into an executable program. Call _projectm_eval_get_error()_ to retrieve the compiler error and location on compilation failure.  |
| void | **[projectm_eval_code_destroy](http://localhost:3000/projects/projectm/api/projectm-eval#function-projectm-eval-code-destroy)**(struct projectm_eval_code * code_handle)<br>Destroys a previously compiled code handle. Frees only the compiled code, but no associated resources like variables and megabuf contents. This makes it possible to recompile code and execute it in the same context without changing the state. Do not use the code handle after destroying it.  |
| PRJM_EVAL_F | **[projectm_eval_code_execute](http://localhost:3000/projects/projectm/api/projectm-eval#function-projectm-eval-code-execute)**(struct projectm_eval_code * code_handle)<br>Executes the code in the given handle.  |
| const char * | **[projectm_eval_get_error](http://localhost:3000/projects/projectm/api/projectm-eval#function-projectm-eval-get-error)**(struct projectm_eval_context * ctx, int * line, int * column)<br>Returns the error message of the last failed compile operation in the given context. The error message is cleared every time new code is compiled.  |

## Defines

|                | Name           |
| -------------- | -------------- |
|  | **[PRJM_F_SIZE](http://localhost:3000/projects/projectm/api/projectm-eval#define-prjm-f-size)**  |

## Types Documentation

### typedef PRJM_EVAL_F

```cpp
typedef double PRJM_EVAL_F;
```


### typedef projectm_eval_mem_buffer

```cpp
typedef PRJM_EVAL_F** projectm_eval_mem_buffer;
```

Buffer pointer for megabuf/gmegabuf memory. 


## Functions Documentation

### function projectm_eval_memory_host_lock_mutex

```cpp
void projectm_eval_memory_host_lock_mutex()
```

Host-defined lock function. Used to prevent race conditions with memory access. Only required if multiple expressions using the same global/local memory blocks will run in separate threads at the same time. Can be an empty function otherwise. The function is not required to use a recursive mutex. 

### function projectm_eval_memory_host_unlock_mutex

```cpp
void projectm_eval_memory_host_unlock_mutex()
```

Host-defined unlock function. Used to prevent race conditions with memory access. Only required if multiple expressions using the same global/local memory blocks will run in separate threads at the same time. Can be an empty function otherwise. 

### function projectm_eval_memory_buffer_create

```cpp
projectm_eval_mem_buffer projectm_eval_memory_buffer_create()
```

Allocates an empty memory buffer to hold gmegabuf data. 

**Return**: A handle to a buffer which can be passed to _projectm_eval_context_create()_. 

### function projectm_eval_memory_buffer_destroy

```cpp
void projectm_eval_memory_buffer_destroy(
    projectm_eval_mem_buffer buffer
)
```

Destroys a memory buffer and frees any allocated blocks. Only destroy a buffer if no context is using it anymore. 

**Parameters**: 

  * **buffer** A handle to the buffer which should be destroyed. 


### function projectm_eval_memory_global_destroy

```cpp
void projectm_eval_memory_global_destroy()
```

Frees the built-in global memory buffer. Only destroy the global buffer if no context is using it anymore. 

### function projectm_eval_context_create

```cpp
struct projectm_eval_context * projectm_eval_context_create(
    projectm_eval_mem_buffer global_mem,
    PRJM_EVAL_F(*) global_variables[100]
)
```

Creates a new execution context. 

**Parameters**: 

  * **global_mem** An optional pointer to a prjm_eval_mem_buffer_t which will be used as the global memory buffer (gmegabuf) or NULL to use the built-in global buffer. This buffer must not be destroyed before he last context using it was destroyed. 
  * **global_variables** An optional pointer to an array of 100 variables to be used as global storage for the special reg00 to reg99 variables. If NULL, a built-in global storage will be used. 


**Return**: A handle to the new execution context, or NULL if the context could not be created. 

### function projectm_eval_context_destroy

```cpp
void projectm_eval_context_destroy(
    struct projectm_eval_context * ctx
)
```

Destroys an execution context and frees all associated resources. Any code and variable references associated with the destroyed context will become invalid and must not be used after calling this function. 

**Parameters**: 

  * **ctx** The context to destroy. 


**Note**: This will not destroy any remaining code handles. Call _projectm_eval_code_destroy()_ on each handle separately. 

### function projectm_eval_context_free_memory

```cpp
void projectm_eval_context_free_memory(
    struct projectm_eval_context * ctx
)
```

Frees the allocated memory of the context-local buffer, effectively resetting it. This will not clear the global memory buffer associated with the context. 

**Parameters**: 

  * **ctx** The context which memory should be freed. 


### function projectm_eval_context_reset_variables

```cpp
void projectm_eval_context_reset_variables(
    struct projectm_eval_context * ctx
)
```

Sets all context variables to 0.0. Registered variables will be kept intact, as the pointers will not change. Global variables reg00 to reg99 will also stay unchanged. 

**Parameters**: 

  * **ctx** The context in which to reset the variables. 


### function projectm_eval_context_register_variable

```cpp
PRJM_EVAL_F * projectm_eval_context_register_variable(
    struct projectm_eval_context * ctx,
    const char * var_name
)
```

Registers a variable and returns the value pointer. Variables can be registered at any time. If the variable doesn't exist yet, it is created, otherwise the existing variable is being returned. Any code compiled before or after will use the same variable, referenced by its case-insensitive name. 

**Parameters**: 

  * **ctx** The context in which to register the variables. 
  * **var_name** The name of the variable. Case-insensitive. 


**Return**: A pointer to the actual value of the variable. 

### function projectm_eval_code_compile

```cpp
struct projectm_eval_code * projectm_eval_code_compile(
    struct projectm_eval_context * ctx,
    const char * code
)
```

Compiled the given code into an executable program. Call _projectm_eval_get_error()_ to retrieve the compiler error and location on compilation failure. 

**Parameters**: 

  * **ctx** The context to associate the code with. 
  * **code** The code to compile. 


**Return**: A handle for the compiled program or NULL if compilation failed. 

### function projectm_eval_code_destroy

```cpp
void projectm_eval_code_destroy(
    struct projectm_eval_code * code_handle
)
```

Destroys a previously compiled code handle. Frees only the compiled code, but no associated resources like variables and megabuf contents. This makes it possible to recompile code and execute it in the same context without changing the state. Do not use the code handle after destroying it. 

**Parameters**: 

  * **code_handle** The code handle to destroy. 


### function projectm_eval_code_execute

```cpp
PRJM_EVAL_F projectm_eval_code_execute(
    struct projectm_eval_code * code_handle
)
```

Executes the code in the given handle. 

**Parameters**: 

  * **code_handle** The compiled code to execute. 


**Return**: The return value of the last expression on the top-level instruction list of the program. 

### function projectm_eval_get_error

```cpp
const char * projectm_eval_get_error(
    struct projectm_eval_context * ctx,
    int * line,
    int * column
)
```

Returns the error message of the last failed compile operation in the given context. The error message is cleared every time new code is compiled. 

**Parameters**: 

  * **ctx** The context to retrieve the error from. 
  * **line** A pointer to an integer which will receive the line number in which the error was found. Pass NULL if the value is of no interest. 
  * **column** A pointer to an integer which will receive the column number in which the error was found. Pass NULL if the value is of no interest. 


**Return**: A pointer to an error message. The context keeps ownership of the pointer, do not free it. 



## Macros Documentation

### define PRJM_F_SIZE

```cpp
#define PRJM_F_SIZE 8
```


## Source code

```cpp

#pragma once

#ifdef __cplusplus
extern "C" {
#endif

/* Default floating-point number size in bytes (4 = float, 8 = double) */
#ifndef PRJM_F_SIZE
#define PRJM_F_SIZE 8
#endif

/* On 32-bit platforms, it may be more performant to use floats. */
#if PRJM_F_SIZE == 4
typedef float PRJM_EVAL_F;
#else
typedef double PRJM_EVAL_F;
#endif

struct projectm_eval_context;

struct projectm_eval_code;

typedef PRJM_EVAL_F** projectm_eval_mem_buffer;


void projectm_eval_memory_host_lock_mutex();

void projectm_eval_memory_host_unlock_mutex();

projectm_eval_mem_buffer projectm_eval_memory_buffer_create();

void projectm_eval_memory_buffer_destroy(projectm_eval_mem_buffer buffer);

void projectm_eval_memory_global_destroy();

struct projectm_eval_context* projectm_eval_context_create(projectm_eval_mem_buffer global_mem,
                                                           PRJM_EVAL_F (* global_variables)[100]);

void projectm_eval_context_destroy(struct projectm_eval_context* ctx);

void projectm_eval_context_free_memory(struct projectm_eval_context* ctx);

void projectm_eval_context_reset_variables(struct projectm_eval_context* ctx);

PRJM_EVAL_F* projectm_eval_context_register_variable(struct projectm_eval_context* ctx, const char* var_name);

struct projectm_eval_code* projectm_eval_code_compile(struct projectm_eval_context* ctx, const char* code);

void projectm_eval_code_destroy(struct projectm_eval_code* code_handle);

PRJM_EVAL_F projectm_eval_code_execute(struct projectm_eval_code* code_handle);

const char* projectm_eval_get_error(struct projectm_eval_context* ctx, int* line, int* column);

#ifdef __cplusplus
};
#endif
```


-------------------------------

Updated on 2023-09-26 at 16:35:52 +0000
