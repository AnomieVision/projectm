<template>
  <div class="prose max-w-full">
    <ContentRenderer v-if="data" :value="data">
      <ContentRendererMarkdown :value="data" />

      <template #empty>
        <p>No content found.</p>
      </template>
    </ContentRenderer>
  </div>
</template>

<script setup lang="ts">
const route = useRoute();
const routePathWithoutPrefix = computed(() => route.path.replace(/^\//, ""));

const title = computed(() => {
  const formattedTitle = routePathWithoutPrefix.value.split("/").join(" > ");
  return formattedTitle;
});

const { data } = await useAsyncData(routePathWithoutPrefix.value, () =>
  queryContent(route.path).findOne(),
);

console.log(routePathWithoutPrefix.value);
console.log(title.value);
console.log(data);

useHead({
  title,
});

definePageMeta({
  layout: "docs",
});
</script>
