<template>
<!-- 和风天气插件 -->
  <div id="he-plugin-standard"></div>
</template>

<script>
export default {
  name: "Weather",
  mounted() {
    window.WIDGET = {
      CONFIG: {
        layout: "1",
        width: "1000",
        height: "400",
        background: "1",
        dataColor: "FFFFFF",
        borderRadius: "5",
        key: "d806cf7fe6094f328fd13ab1f6db0e4e",
      },
    };
    var script = document.createElement("script");
    script.type = "text/javascript";
    script.src =
      "https://widget.qweather.net/standard/static/js/he-standard-common.js?v=2.0";
    document.getElementsByTagName("head")[0].appendChild(script);
  },
};
</script>

<style>
</style>