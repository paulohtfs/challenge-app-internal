import { BaseService } from './base';

export class UsersService extends BaseService {
    public async list(params: any) {
        await this.get("users", params);

        return this.response;
    }

    public async activate(id) {
        await this.put(`users/${id}/activate`);

        return this.response;
    }

    public async inactivate(id) {
        await this.put(`users/${id}/inactivate`);

        return this.response;
    }
}