import { createMemoryHistory, createRouter } from 'vue-router'
import HomePage from './pages/HomePage.vue'
import UsersPage from './pages/UsersPage.vue'

const routes = [
  { path: '/', component: HomePage },
  { path: '/users', component: UsersPage },
]

const router = createRouter({
  history: createMemoryHistory(),
  routes,
})

export default router