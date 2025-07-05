import './assets/main.css'

import { createApp } from 'vue'
import { createPinia } from 'pinia'
import { createVuestic } from "vuestic-ui"
import App from './App.vue'

import "vuestic-ui/css"

const app = createApp(App)

app.use(createPinia())
app.use(createVuestic())

app.mount('#app')
