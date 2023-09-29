import { isPropertySignature } from 'typescript';
<template>
  <div class="dropdown">
    <label tabindex="0" class="btn btn-circle btn-ghost lg:hidden">
      <Icon :name="props.icon" class="w-5 h-5" />
    </label>
    <ul
      tabindex="0"
      class="menu menu-sm dropdown-content mt-3 z-[1] p-2 shadow bg-base-100 rounded-box w-52"
    >
      <li v-for="(item, index) in props.menu" :key="index">
        <NuxtLink v-if="!item.links" :to="item.to">
          {{ item.label }}
        </NuxtLink>
        <details v-if="item.links">
          <summary>{{ item.label }}</summary>
          <ul class="p-2">
            <li v-for="(subItem, subIndex) in item.links" :key="subIndex">
              <NuxtLink :to="subItem.to">
                {{ subItem.label }}
              </NuxtLink>
            </li>
          </ul>
        </details>
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

export interface Props {
  icon: string;
  menu: MenuEntry[];
}

const props = defineProps<Props>();
</script>
