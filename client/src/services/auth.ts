import { BaseService } from './base';

type SigninData = {
    user: {
        email: string,
        password: string,
    }
}

export class AuthService extends BaseService {
    async login(data: SigninData) {
        const response = await this.post("sign_in", data);
        sessionStorage.setItem('token', this.response.status.token);
    }
}