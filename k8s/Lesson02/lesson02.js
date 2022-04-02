const http = require( 'http' );
const os = require( 'os' );

console.log( "Lesson02 server startting ..." );

var handler = function( request, response ) {
	console.log( "Received request from " + request.connection.remoteAddress );
	response.writeHead( 200 );
	response.end( "You have ping " + os.hostname() + "\n" + "your address is: " + request.connection.remoteAddress + "\n" );
};

var www = http.createServer( handler );
www.listen( 8080 );
