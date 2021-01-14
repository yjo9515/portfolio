package application;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

// 한 명의 클라이언트와 통신하도록 해주는 클라이언트 클래스입니다.
public class Client {

	Socket socket;
	
	public Client(Socket socket) {
		this.socket = socket;
		receive();
	}
	
	// 반복적으로 클라이언트로부터 메시지를 받는 메소드입니다.
	public void receive() {
		Runnable thread = new Runnable() {
			@Override
			public void run() {
				try {
					while(true) {
						// 어떠한 내용을 전달 받을수 있게 InputStream 객체를 생성
						InputStream in = socket.getInputStream();
						byte[] buffer = new byte[512];
						int length = in.read(buffer);

						// length가 -1 즉 메세지를 읽어 들일때 오류가 발생 을 경우 예외처리
						while(length==-1) throw new IOException();
						
						// 메시지를 정상적으로 수신을 했을 경우
						System.out.println("[메시지 수신 성공] "
								+ socket.getRemoteSocketAddress() // 클라이언트의 IP주소 같은 주소 정보 출력
								+ ": " + Thread.currentThread().getName()); // 쓰레드의 고유 정보 출력
						String message = new String(buffer, 0, length, "UTF-8"); // UTF-8 한글도 포함 할수 있게 인코딩 처리
						System.out.println(message);
						// 메시지를 받으면 다른 클라이언트들에게 전송
						for(Client client : Main.clients) {
							client.send(message);
						}						
					}
				} catch (Exception e) {
					try {
						System.out.println("[메시지 수신 오류] "
								+ socket.getRemoteSocketAddress()
								+ ": " + Thread.currentThread().getName());
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}				
			}
		};
		Main.threadPool.submit(thread);
	}
	
	// 해당 클라이언트에게 메시지를 전송하는 메소드입니다.
	public void send(String message) {
		Runnable thread = new Runnable() {
			@Override
			public void run() {
				try {
					OutputStream out = socket.getOutputStream();
					byte[] buffer = message.getBytes("UTF-8");
					// 오류가 발생 하지 않았을 경우 해당 버퍼를 전송해준다.
					out.write(buffer);
					// 반드시 flush를 해주자, 그래야 성공적으로 전송을 했다는 것을 알려 줄수 있다.
					out.flush();
				} catch (Exception e) {
					try {
						System.out.println("[메시지 송신 오류] "
								+ socket.getRemoteSocketAddress()
								+ ": " + Thread.currentThread().getName());
						// 전송이 오류가 날 경우 Main 함수에 있는 client 정보를 담고 있는 Vector 배열에서 현재 존재 하는 client 를 지워준다.
						// 오류가 발송하여 해당 클라이언트가 서버로 부터 연결이 끊겼으니깐 Main함수에서도 처리를 할수 있게 remove로 제거 해준다.
						Main.clients.remove(Client.this);
						// 그 이후 오류가 생긴 socket 을 닫아준다. 
						socket.close();
					} catch (Exception e2) {
						// TODO: handle exception
					}
				}
				
			}
		};
		Main.threadPool.submit(thread);
	}
}
