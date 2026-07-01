export default {
  async fetch(request) {
    const AZURE_HOST = "stcloudprog92012248.z49.web.core.windows.net";

    const url = new URL(request.url);
    url.hostname = AZURE_HOST;

    const newRequest = new Request(url.toString(), {
      method: request.method,
      headers: request.headers,
      body: request.body,
      redirect: "follow",
    });
    newRequest.headers.set("Host", AZURE_HOST);

    return fetch(newRequest);
  },
};