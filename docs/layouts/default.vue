<template>
  <UContainer :ui="{
    base: 'min-h-screen w-full flex flex-col items-center gap-4 sm:gap-6 lg:gap-8',
    padding: 'p-4 sm:p-6 lg:p-8',
    constrained: '',
  }">
    <Navbar />
    <slot />
  </UContainer>
</template>
