<template>
  <div class="navbar px-4 md:px-6 lg:px-8 shadow-md bg-neutral">
    <div class="navbar-start">
      <NavbarMobileMenu :icon="mobileMenu.icon" :menu="mobileMenu.menu" />
      <Logo />
    </div>

    <div class="navbar-center hidden lg:flex scroll-auto">
      <ul class="menu menu-horizontal px-1">
        <li v-for="(item, index) in menu" :key="index" tabindex="0">
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

    <div class="navbar-end">
      <NavbarSearch />
    </div>
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

const menu: MenuEntry[] = [
  {
    label: "Home",
    icon: "",
    iconClass: "",
    to: "/",
    divider: false,
  },
  {
    label: "Docs",
    icon: "",
    iconClass: "",
    to: "/docs",
    divider: false,
    links: [
      {
        label: "API",
        icon: "",
        iconClass: "",
        to: "/docs/api",
        divider: false,
        links: apiMenuLinks,
      },
    ],
  },
  {
    label: "Support",
    icon: "",
    iconClass: "",
    to: "https://discord.gg/7fQXN43n9W",
    divider: false,
  },
];

const mobileMenu = {
  icon: "heroicons-solid:menu-alt-1",
  menu,
};
</script>
