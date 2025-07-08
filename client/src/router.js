import { createMemoryHistory, createRouter } from 'vue-router'
import HomePage from './pages/HomePage.vue'
import LoginPage from './pages/LoginPage.vue'
import UsersPage from './pages/UsersPage.vue'

const routes = [
  { path: '/', component: HomePage },
  { path: '/login', component: LoginPage },
  { path: '/users', component: UsersPage },
]

const router = createRouter({
  history: createMemoryHistory(),
  routes,
})

export default router