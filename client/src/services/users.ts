import { BaseService } from './base';

export class UsersService extends BaseService {
    public async list(params: any) {
        await this.get("users", params);

        return this.response;
    }
}