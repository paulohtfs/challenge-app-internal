import axios from "axios";

export class BaseService {
    private readonly baseUrl: string;
    private readonly options: any;

    public response: any;

    constructor(baseUrl: string) {
        this.baseUrl = baseUrl;
        this.options = {
            headers: {
                "Content-Type": "application/json; charset=utf-8",
                "Authorization": `Bearer ${sessionStorage.getItem('token')}`
            }
        }
    }

    protected async get(path: string, query: object = {}) {
        const options = {
            ...this.options,
            params: query
        };

        await axios.get(`${this.baseUrl}/${path}`, options)
            .then(response => { this.response = response.data });
    }

    protected async post(path: string, data: object) {
        await axios.post(`${this.baseUrl}/${path}`, data)
            .then(response => { this.response = response.data });
    }

    protected async put(path: string, data: object) {
        await axios.put(`${this.baseUrl}/${path}`, data, this.options)
            .then(response => { this.response = response.data });
    }
}