const { PeerServer } = require('peer');

const PORT = process.env.PORT || 10000;

PeerServer({ port: PORT, path: '/peerjs' }, () => {
  console.log('PeerJS server on port ' + PORT);
});
