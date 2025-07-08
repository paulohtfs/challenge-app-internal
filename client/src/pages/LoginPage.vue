<template>
    <VaForm class="w-[300px]" tag="form" @submit.prevent="handleSubmit">
        <VaInput v-model="email" label="email" />

        <VaInput v-model="password" class="mt-3" type="password" label="Password" />

        <VaButton type="submit" class="mt-3">Login</VaButton>
    </VaForm>
</template>

<script>
import Servers from '../services'

export default {
  data() {
    return {
      email: 'user1@example.com',
      password: 'example@9128',
      options: ['admin', 'user'],
    };
  },
  methods: {
    handleSubmit() {
        Servers.auth.login({ user: { email: this.email, password: this.password }});
    },
  },
};
</script>