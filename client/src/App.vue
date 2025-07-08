<template>
  <VaSidebar>
    <VaSidebarItem>
      <VaSidebarItemContent>
        <VaIcon name="dashboard" />
        <VaSidebarItemTitle>
          <RouterLink to="/users">Users</RouterLink>
        </VaSidebarItemTitle>
      </VaSidebarItemContent>
    </VaSidebarItem>

    <VaAccordion>
      <VaSidebarItem>
        <VaSidebarItemContent>
          <VaIcon name="room" />
          <VaSidebarItemTitle>
            <RouterLink to="/login">Login</RouterLink>
          </VaSidebarItemTitle>
        </VaSidebarItemContent>
      </VaSidebarItem>
    </VaAccordion>
  </VaSidebar>
  <RouterView />
</template>