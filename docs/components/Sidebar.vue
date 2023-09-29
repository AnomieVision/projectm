<template>
  <div class="w-full max-w-xs mr-4">
    <ul class="menu menu-xs bg-neutral rounded-lg shadow-md w-full p-4">
      <li v-for="(item, index) in menuLinks" :key="index">
        <NuxtLink :to="item.to">
          <Icon
            v-if="item.icon"
            :name="item.icon"
            class="w-4 h-4"
            :class="item.iconClass"
          />
          {{ item.label }}
        </NuxtLink>

        <ul v-if="item.links">
          <li v-for="(subItem, subIndex) in item.links" :key="subIndex">
            <NuxtLink :to="subItem.to">
              <Icon
                v-if="subItem.icon"
                :name="subItem.icon"
                class="w-4 h-4"
                :class="subItem.iconClass"
              />
              {{ subItem.label }}
            </NuxtLink>
          </li>
        </ul>
      </li>
    </ul>
  </div>
</template>

<script setup lang="ts">
interface MenuEntry {
  label?: string;
  icon?: string;
  iconClass?: string;
  to?: string;
  divider?: boolean;
  links?: MenuEntry[];
}

import apiMenuLinks from "~/data/api-menu-links.json";

const menuLinks: MenuEntry[] = apiMenuLinks;
</script>
