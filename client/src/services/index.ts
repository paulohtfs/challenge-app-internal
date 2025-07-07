import { AuthService } from './auth';

const api = {}
const baseUrl = import.meta.env.API_URL;

api.auth = new AuthService();

export default api;