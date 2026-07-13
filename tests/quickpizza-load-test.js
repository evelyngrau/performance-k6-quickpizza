import http from "k6/http";
import { check, sleep } from "k6";

const BASE_URL = "https://quickpizza.grafana.com";

export const options = {
scenarios: {
average_load: {
    executor: "ramping-vus",
    startVUs: 0,

    stages: [
    { duration: "10s", target: 2 },
    { duration: "30s", target: 5 },
    { duration: "30s", target: 5 },
    { duration: "10s", target: 0 },
    ],

    gracefulRampDown: "10s",
},
},

thresholds: {
http_req_failed: ["rate<0.01"],
http_req_duration: ["p(95)<1000"],
checks: ["rate>0.99"],
},
};

export default function () {
const response = http.get(`${BASE_URL}/api/names`, {
headers: {
    Accept: "application/json",
},

tags: {
    name: "GET /api/names",
},
});

let responseBody = null;

try {
responseBody = response.json();
} catch (error) {
responseBody = null;
}

check(response, {
"status is 200": (res) => res.status === 200,

"response is JSON": (res) =>
    (res.headers["Content-Type"] || "").includes("application/json"),

"response contains names": () =>
    Array.isArray(responseBody?.names) &&
    responseBody.names.length > 0,
});

sleep(1);
}