import axios from "axios";

export class BaseService {
    baseUrl: string;

    constructor(baseUrl: string) {
        this.baseUrl = baseUrl;
    }

    get(path: string, query: object = {}): any {
        axios.get(`${this.baseUrl}/${path}`)
             .then(response => { return response.data });
    }

    post(path: string, data: object): any {
        axios.get(`${this.baseUrl}/${path}`, data)
             .then(response => { return response.data });
    }
}