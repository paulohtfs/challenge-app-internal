<template>
    <div class="va-table-responsive">
        <VaInput v-model="value" placeholder="Search" @change="search" />
        <VaDataTable :items="users" :columns="columns"
            hoverable>
            <template #cell(role)="{ value }">
                <VaChip size="small">
                    {{ userRole(value) }}
                </VaChip>
            </template>
        </VaDataTable>
    </div>
</template>

<script>
import Servers from '../services'

export default {
    data() {
        return {
            users: [],
            columns: [
                { key: "id", sortable: true, sortingOptions: ["desc", "asc"] },
                { key: "name", sortable: true, sortingOptions: ["desc", "asc"] },
                { key: "email", sortable: true, sortingOptions: ["desc", "asc"] },
                { key: "role", name: "role", sortable: true, sortingOptions: ["desc", "asc"] }
            ],
        };
    },
    created() {
        this.setUsers();
    },
    methods: {
        async setUsers(params) {
            const users = await Servers.users.list(params);
            this.users = users;
            console.log(users);
        },
        userRole(role) {
            if (role === "User::Admin") {
                return 'Admin';
            }

            return 'Member';
        },
        search(event) {
            this.setUsers({ by_whatever: event.target.value });
        },
    },
};
</script>