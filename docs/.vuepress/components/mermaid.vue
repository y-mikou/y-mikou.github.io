<template>
  <div class="mermaid">
    <slot></slot>
  </div>
</template>

<script>
export default {
  mounted() {
    import("mermaid/dist/mermaid").then(m => {
      m.initialize({
        startOnLoad: true,
        // dark, default, forest, neutral
        theme: "forest"
      });
      m.init();
    });
  }
};
</script>

<style>
.mermaid svg {
  text-align: center;
}
</style>