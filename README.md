# hubot-murder [![Build Status](https://img.shields.io/travis/catops/hubot-murder.svg?maxAge=2592000&style=flat-square)](https://travis-ci.org/catops/hubot-murder) [![npm](https://img.shields.io/npm/v/hubot-murder.svg?maxAge=2592000&style=flat-square)](https://www.npmjs.com/package/hubot-murder)

:cat2: Kill your Hubot and be notified when it comes back online.

See [`src/murder.coffee`](src/murder.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-murder --save`

Then add **hubot-murder** to your `external-scripts.json`:

```json
["hubot-murder"]
```

## Sample Interaction

```
user1>> hubot (die|restart|reboot)
hubot>> Et tu, brute? 😭
...waiting for your process manager to start it back up...
hubot>> user1: I'm back from the dead. 👼
```

## Contributing

Please read our general [contributing guidelines](CONTRIBUTING.md).

## Open source licensing info
1. [TERMS](TERMS.md)
2. [LICENSE](LICENSE)
3. [CFPB Source Code Policy](https://github.com/cfpb/source-code-policy/)
