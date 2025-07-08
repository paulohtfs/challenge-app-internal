import { AuthService } from './auth';
import { UsersService } from './users';

const api: any = {};

api.auth = new AuthService('http://localhost:3000');
api.users = new UsersService('http://localhost:3000/api/v1');

export default api;