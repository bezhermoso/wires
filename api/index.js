const Hapi = require("hapi");
const server = new Hapi.Server();
const nginx = require('./lib/nginx');

server.connection({ port: process.env.PORT || 3300 });

server.route({
  method: 'POST',
  path: '/sites/{site}',
  handler: function (request, reply) {
    reply(request.params.site);
  }
});


server.start((err) => {
  if (err) {
    throw err;
  }
  console.log('Server running at:', server.info.uri);
});

