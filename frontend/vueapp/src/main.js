import Vue from 'vue';
import App from './App.vue';
import router from './router/index'; // Ruta correcta según tu estructura

Vue.config.productionTip = false;

new Vue({
  render: h => h(App),
  router, // Agregar el enrutador a la instancia de Vue
}).$mount('#app');
