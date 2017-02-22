package 
{ 
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.ServerSocketConnectEvent;
	import flash.net.ServerSocket;
	import flash.net.Socket;
	
	public class PorkySocket extends EventDispatcher
	{ 
		private var serverSocket:ServerSocket;  
		private var clientSockets:Array = new Array(); 
		
		public function PorkySocket() 
		{ 
			try 
			{ 
				serverSocket = new ServerSocket(); 
				serverSocket.addEventListener( Event.CONNECT, connectHandler ); 
				serverSocket.addEventListener( Event.CLOSE, onClose ); 
				serverSocket.bind( 8087, "0.0.0.0" ); 
				
				serverSocket.listen(); 
				trace( "Listening on " + serverSocket.localPort ); 
				
			} 
			catch(e:SecurityError) 
			{ 
				trace(e); 
			} 
		} 
		
		public function connectHandler(event:ServerSocketConnectEvent):void 
		{ 
			//The socket is provided by the event object 
			var socket:Socket = event.socket as Socket; 
			clientSockets.push( socket ); 
			
			socket.addEventListener( ProgressEvent.SOCKET_DATA, socketDataHandler); 
			socket.addEventListener( Event.CLOSE, onClientClose ); 
			socket.addEventListener( IOErrorEvent.IO_ERROR, onIOError ); 
			
			//Send a connect message 
			socket.writeUTFBytes("Connected."); 
			socket.flush(); 
			
			trace( "Sending connect message" ); 
		} 
		
		public function socketDataHandler(event:ProgressEvent):void 
		{ 
			var socket:Socket = event.target as Socket 
			
			//Read the message from the socket 
			var message:String = socket.readUTFBytes( socket.bytesAvailable ); 
			trace( "Received: " + message); 
			
			// Echo the received message back to the sender 
			message = "Echo -- " + message; 
			socket.writeUTFBytes( message ); 
			socket.flush(); 
			trace( "Sending: " + message ); 
			
			dispatchEvent(new PorkyEvent(PorkyEvent.DUCK_HIT));			
		} 
		
		private function onClientClose( event:Event ):void 
		{ 
			trace( "Connection to client closed." ); 
			//Should also remove from clientSockets array... 
		} 
		
		private function onIOError( errorEvent:IOErrorEvent ):void 
		{ 
			trace( "IOError: " + errorEvent.text ); 
		} 
		
		private function onClose( event:Event ):void 
		{ 
			trace( "Server socket closed by OS." ); 
		} 
	}}