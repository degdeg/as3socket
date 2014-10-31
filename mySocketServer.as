package {
	
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	import flash.system.*;
	import flash.utils.*;
	import flash.xml.*;
	import flash.filters.*;
	import flash.text.*;
	
	public class mySocketServer {
		
		public var myAddress:String = '127.0.0.1';
		public var myPort:int = 1337;
		public var mySocket:ServerSocket = new ServerSocket();
		public var mySocketClient:Socket;
		
		public function mySocketServer() {
			// constructor code
			trace('https://github.com/degdeg/as3socket/ - Degdeg (Astro260)');
			
			Security.loadPolicyFile('<?xml version="1.0"?><!DOCTYPE cross-domain-policy SYSTEM "http://www.macromedia.com/xml/dtds/cross-domain-policy.dtd"><cross-domain-policy><allow-access-from domain="*" to-ports="*" /></cross-domain-policy>');
			SecurityDomain.currentDomain;
			
			mySocketBind();
		}
		
		public function mySocketBind():void {
			// port, address
			mySocket.bind(myPort, myAddress);
			mySocket.addEventListener(ServerSocketConnectEvent.CONNECT, mySocketConnect);
			mySocket.listen();
			
			trace('Listening on ' + myAddress + ':' + myPort);
		}
		
		public function mySocketConnect(event:ServerSocketConnectEvent):void {
			// client connection construction
			mySocketClient = event.socket;
			
			trace('Client connected on ' + mySocketClient.remoteAddress + ':' + mySocketClient.remotePort);
		}
		
	}
	
}
