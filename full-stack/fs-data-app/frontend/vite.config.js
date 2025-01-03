import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  server: {
    watch: {
      usePolling: true, // This is useful if you are running inside a Docker container
    },
    host: true, // This allows the server to be accessible externally
    port: 5173, // Ensure this matches the port in your docker-compose.yml
  },
});
