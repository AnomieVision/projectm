<template>
  <UContainer
    :ui="{
      base: 'flex rounded-md bg-blue-500 w-full max-w-xs h-fit',
      padding: 'p-1 sm:p-2 lg:p-4',
      constrained: '',
    }"
  >
    <div class="flex flex-col w-full">
      <div v-for="(section, index) in menu" :key="index">
        <div>{{ section.header }}</div>

        <div v-if="section.divider">---</div>

        <UVerticalNavigation class="w-full" :links="section.links" />
      </div>
    </div>
  </UContainer>
</template>

<script setup lang="ts">
import menu from "~/constants/sidebar-menu-links.json";
</script>
