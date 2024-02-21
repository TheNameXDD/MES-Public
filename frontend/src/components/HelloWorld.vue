<template>
  <div class="hello">
    <h1>{{ message }}</h1>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      message: '',
    };
  },
  mounted() {
  axios.get('http://127.0.0.1:5000/api/data')
    .then(response => {
      this.message = response.data.message;
    })
    .catch(error => {
      console.error('Error fetching data:', error);
    });

  },
};
</script>

<style scoped>
.hello {
  font-size: 2em;
}
</style>