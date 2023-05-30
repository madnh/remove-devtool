# Remote DevTool

Use [Chii](https://github.com/liriliri/chii) and [Caddy](https://caddyserver.com) to add remove DevTool feature to your site.

Features:

- Debug browsers where can run normal DevTool, eg: webview, customer's device
- Add auth to protect target site

## Usage

Default code use below ports of services, you can use environment to override value:

| Site        | Env variable       | Default value |
| ----------- | ------------------ | ------------- |
| Caddy site  | `CADDY_PORT`       | `4545`        |
| Chii port   | `CHII_PORT`        | `8080`        |
| Target site | `TARGET_SITE_PORT` | `3000`        |

### Step 1: run target site

Run your site

```bash
npm run dev
npm run start
```

### Step 2: run Chii

```bash
./chii.sh
```

### Step 3: run Caddy

```bash
./start.sh
```

### Step 4: Visit target site served by Caddy

Open target site which served by Caddy on browser, eg: [http://localhost:4545](http://localhost:4545)

### Step 5: Open inspect url

Open Chii's dashboard and inspect your site, example: [http://localhost:8080](http://localhost:8080)

### Step 6: use Ngork (optional)

You can use ngrok to serve your site, just point to Caddy's url, example:

```sh
ngrok http [caddy's port]
# example
ngrok http 4545
```

## Limits

1. Open site in private tag can lead to site can connect but cant send request to Chii
2. Request routing over many middle layer, so site can be slow
