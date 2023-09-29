<template>
  <div class="min-h-screen w-full flex flex-col items-center">
    <Navbar />

    <div class="flex flex-col flex-grow self-stretch p-2 sm:p-3 lg:p-4">
      <div class="flex-grow self-stretch p-4 bg-neutral rounded-lg shadow-md">
        <slot />
      </div>
    </div>

    <Footer />
  </div>
</template>
