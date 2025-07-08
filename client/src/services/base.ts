import axios from "axios";

export class BaseService {
    private readonly baseUrl: string;
    public response: any;

    constructor(baseUrl: string) {
        this.baseUrl = baseUrl;
    }

    protected async get(path: string, query: object = {}) {
        const options = {
            headers: {
                "Content-Type": "application/json; charset=utf-8",
                "Authorization": `Bearer ${sessionStorage.getItem('token')}`
            },
            params: query
        };

        console.log(options)
        await axios.get(`${this.baseUrl}/${path}`, options)
            .then(response => { this.response = response.data });
    }

    protected async post(path: string, data: object) {
        await axios.post(`${this.baseUrl}/${path}`, data)
            .then(response => { this.response = response.data });
    }
}