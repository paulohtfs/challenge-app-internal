import { BaseService } from './base';

type SigninData = {
    email: string;
    password: string;
}

export class AuthService extends BaseService {
    login(data: SigninData) {
        const response: object = this.post("login", data);
        sessionStorage.setItem('token', response.token);
    }
}