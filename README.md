# UniRoute Examples

Minimal runnable configurations and quickstart scripts for connecting coding agents, SDKs, and multimodal pipelines to [UniRoute](https://uniroute.app) (`https://api.uniroute.app`).

## One-command CLI setup

Install and configure Claude Code, Codex CLI, Gemini CLI, OpenCode, OpenClaw, or Hermes Agent automatically with [`uniroute-setup`](https://www.npmjs.com/package/uniroute-setup):

```bash
npx uniroute-setup --help
```

## Included examples

| Directory | Tool / API | Protocol | Docs |
| --- | --- | --- | --- |
| [`claude-code/`](./claude-code/) | Claude Code CLI | Anthropic Messages (`/v1/messages`) | [Claude Code Guide](https://uniroute.app/docs/claude-code-cli) |
| [`codex-cli/`](./codex-cli/) | OpenAI Codex CLI | OpenAI Responses (`/v1/responses`) | [Codex CLI Guide](https://uniroute.app/docs/codex-cli) |
| [`opencode/`](./opencode/) | OpenCode | Anthropic / OpenAI / Gemini adapters | [OpenCode Guide](https://uniroute.app/docs/opencode-uniroute) |
| [`media-api/`](./media-api/) | Async Media API (Seedance, Kling, Veo, Wan, Seedream, Qwen Image Edit) | `/v1/media/quote` & `/v1/media/tasks` | [Media Quickstart](https://uniroute.app/docs/media-quickstart) |

## Links

- Website: [uniroute.app](https://uniroute.app)
- Model catalog & Playground: [uniroute.app/models](https://uniroute.app/models)
- Live pricing: [uniroute.app/pricing](https://uniroute.app/pricing)
- Documentation: [uniroute.app/docs](https://uniroute.app/docs)
