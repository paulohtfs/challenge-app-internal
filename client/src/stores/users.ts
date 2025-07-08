// stores/counter.js

import {defineStore} from 'pinia';

export const usersStore = defineStore('users', {
    state: () => ({
        users: [],
    }),
    actions: {
        listUsers() {
        },
    },
    getters: {
        totalClicks() {
        },
    },
});
