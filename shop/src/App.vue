<template>
  <div id="app">
    <nav >
      <div style="position: fixed; z-index: 1000;background-color: rgb(51, 51, 51);width: 100%;" class=" h c " >
        <router-link to="/">
          <div class="text" :class="HomeName == 'home' ? 'no' : 'back'" @click="HomeName = 'home'">
            <div class="fs-large bold text" style="text-shadow: 2px 2px 1px black;text-decoration: none">Home</div>
          </div>
        </router-link>
        <router-link to="/Secondhand">
          <div class="text" :class="HomeName == 'Secondhand' ? 'no' : 'back'" @click="HomeName = 'Secondhand'">
            <div class="fs-large bold text" style="text-shadow: 2px 2px 1px black;">Secondhand</div>
          </div>
        </router-link>
        <router-link to="/RunErrands">
          <div class="text" :class="HomeName == 'RunErrands' ? 'no' : 'back'" @click="HomeName = 'RunErrands'">
            <div class="fs-large bold text" style="text-shadow: 2px 2px 1px black;">RunErrands</div>
          </div>
        </router-link>
        <router-link to="/Log">
          <div class="text" :class="HomeName == 'Log' ? 'no' : 'back'" @click="HomeName = 'Log'">
            <div class="fs-large bold text" style="text-shadow: 2px 2px 1px black;">Log</div>
          </div>
        </router-link>
        <router-link to="/Schedule">
          <div class="text" :class="HomeName == 'Schedule' ? 'no' : 'back'" @click="HomeName = 'Schedule'">
            <div class="fs-large bold text" style="text-shadow: 2px 2px 1px black;">Schedule</div>
          </div>
        </router-link>
      </div>
    </nav>
    <router-view style="margin-top:65px ;"/>
    
  </div>
</template>

<script>

export default {
  name: 'App',
  data() {
    return {
      HomeName: 'home'
    }
  }
}
</script>

<style lang="less">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  /* color: #ffff; */
  /* background-color: rgb(51, 51, 51); */
  background-color: white;
  /* width: auto; */
  height: 100%;
  padding: 1px;

}


nav {
  a {
    color: #ffff;
    text-decoration: none;

    &.router-link-exact-active {
      font-weight: bold;

      text-decoration: none;
      color: rgb(151, 155, 158);
    }
  }
}

.text {
  width: 200px;
  height: 70px;
  border-radius: 5px;
  text-align: center;
  line-height: 70px;
  margin-left: 10px;
  flex: 1;
}

.bacimg {
  
}


</style>
