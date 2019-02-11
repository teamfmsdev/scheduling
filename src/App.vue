<template>
  <div id="app">
    <div id="nav">
      <h1>CCFM Monthly Schedule</h1>
      <!-- <router-link to="/">Home</router-link>| -->
    </div>
    <router-view/>
  </div>
</template>

<script>
import "@/styles/globalStyle.css";
export default {};
</script>

<style lang="scss">
#app {
  // background-color: rgb(36, 34, 34) !important;
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  // color: white;
}
#nav {
  margin-bottom: 2%;
  background-color: #00b1a9;
  padding: 1rem;
  a {
    font-weight: bold;
    color: #2c3e50;
    &.router-link-exact-active {
      color: #42b983;
    }
  }
}
</style>
