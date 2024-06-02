<template>
  <div>
    <PrintForm />
  </div>
</template>

<script>
import PrintForm from './components/PrintForm.vue';

export default {
  name: 'App',
  components: {
    PrintForm
  }
};
</script>

<style>
body {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  background-color: #2c3e50;
  margin-top: 60px;
}
</style>