<template>
    <UContainer :ui="{
      base: 'min-h-screen w-full flex flex-col items-center gap-4 sm:gap-6 lg:gap-8',
      padding: 'p-4 sm:p-6 lg:p-8',
      constrained: '',
    }">
      <Navbar />

      <div class="w-full flex gap-x-2 md:gap-x-4 lg:gap-x-6">
        <Sidebar />

        <UContainer :ui="{
      base: 'w-full flex flex-col items-center gap-4 sm:gap-6 lg:gap-8 rounded-md bg-white',
      padding: 'p-4 sm:p-6 lg:p-8',
      constrained: '',
    }">
            <slot />
        </UContainer>
      </div>
    </UContainer>
  </template>
  