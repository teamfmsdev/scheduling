<template>
  <div id="app">
    <div id="nav">
      <h1 class="mb-0 p-0">PCOGD Facilities Management</h1>
      <h2 class="p-0 mt-0 text-white">
        <strong>Planning & Scheduling</strong>
      </h2>
      <a href="/pcogdfm">Request & Reporting</a>
      <!-- <router-link to="/">Home</router-link>| -->
    </div>
    <router-view/>
  </div>
</template>

<script>
import '@/styles/globalStyle.css'
export default {}
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
  background-color: rgb(0, 177, 169);
  // padding: 1rem;
  h1 {
    font-weight: bold;
    color: white;
  }
  a {
    font-weight: bold;
    // color: white;
  }
}
</style>
