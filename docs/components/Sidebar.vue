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
        <!-- <div v-if="section.divider">---</div> -->
        
        <div class="flex">
          <div v-if="section.icon" class="flex items-center mr-2">
            <UIcon :name="section.icon" />
          </div>
          <NuxtLink v-if="section.label" :to="section.to" class="font-bold">{{ firstLetterUpperCase(section.label) }}</NuxtLink>
        </div>

        <UVerticalNavigation class="w-full" :links="section.links" />
      </div>
    </div>
  </UContainer>
</template>

<script setup lang="ts">
import menu from "~/constants/sidebar-menu-links.json";

const firstLetterUpperCase = (str: string) => str.slice(0, 1).toUpperCase() + str.slice(1);
</script>
