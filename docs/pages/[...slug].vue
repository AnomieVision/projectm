<template>
  <div class="prose">
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
const routePathWithoutPrefix = computed(() => {
  let path = route.path;
  path = path.replace(/^\/*projectm\//, "");
  path = path.replace(/^\//, "");

  return path;
});

const { breadcrumbs } = useBreadcrumbs();

const title = computed(() => {
  const lastBreadcrumb = breadcrumbs.value[breadcrumbs.value.length - 1];
  return lastBreadcrumb.name;
});

const { data } = await useAsyncData(routePathWithoutPrefix.value, () =>
  queryContent(route.path).findOne(),
);

useHead({
  title,
});

definePageMeta({
  layout: "docs",
});
</script>
