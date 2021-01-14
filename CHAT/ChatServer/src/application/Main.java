package application;
	
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Iterator;
import java.util.Vector;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javafx.application.Application;
import javafx.application.Platform;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Menu;
import javafx.scene.control.MenuBar;
import javafx.scene.control.MenuItem;
import javafx.scene.control.TextArea;
import javafx.scene.layout.BorderPane;
import javafx.scene.text.Font;
import javafx.stage.Stage;



public class Main extends Application {

	// ExcutorService 는 여러개의 쓰레드를 효율적으로 관리하기 위한 대표적인 라이프러리.
	// Thread Pool로 쓰레드를 처리하게 되면 기본적인 쓰레드 숫자의 제한을 두기 때문에 갑작스런 Client 폭증에도 쓰레드 에는 제한이 있어 서버 성능을 저하를 방지 할수 있음.
	// 한정된 자원을 안정적으로 관리하기 위한 대비책
	public static ExecutorService threadPool;
	public static Vector<Client> clients = new Vector<Client>(); 

	
	ServerSocket serverSocket;
	
	// 서버를 구동시켜 클라이언트의 연결을 기다리는 메소드입니다.
	public void startServer(String IP, int port) {
		try {
			serverSocket = new ServerSocket();
			serverSocket.bind(new InetSocketAddress(IP,port));
		} catch (Exception e) {
			e.printStackTrace();
			if(!serverSocket.isClosed()) {
				stopServer();
			}
			return;
		}
		
		// 클라이언트가 접속할 때까지 게속 기다리는 쓰레드입니다.
		Runnable thread = new Runnable() {
			@Override
			public void run() {
				while(true) {
					try {
						// 새로운 클라이언트가 접속 할수 있게 해준다.
						Socket socket = serverSocket.accept();
						
						// 클라이언트가 접속을 했을 경우 배열에 클라이언트를 추가한다.
						clients.add(new Client(socket));
						
						/*
						 * 클라이언트를 관리하기위해 배열에 클라이언트를 담아준다. 
						 */
						
						
						// 클라이언트가 접속을 했을 경우 로그를 작성
						System.out.println("[클라이언트 접속] " 
								+ socket.getRemoteSocketAddress()
								+ ": " + Thread.currentThread().getName());						
					} catch (Exception e) {
						// 서버 소켓에 문제가 발생한 거니 서버를 작동 중지 한 이후 break문을 이용하여 while문을 벗어난다.
						if(!serverSocket.isClosed()) stopServer();
						break;
					}
				}
			}
		};
		// 쓰레드 풀을 초기화 한다.
		threadPool = Executors.newCachedThreadPool();
		// 그 이후 쓰레드 풀에 기다리는 클라이언트를 담을수 있게 넣어준다.
		threadPool.submit(thread);
	}
	
	// 서버의 작동을 중지시키는 메소드입니다.
	public void stopServer() {
		// 서버 작동 종료 이후에는 전체 자원을 할당 해주는 메소드
		// 서버 중지 메소드는 서버 프로그램의  품질에 큰 영향을 미친다 할수 있다. 		
		
		try {
			// 현재 작동 중인 모든 소켓 닫기
			Iterator<Client> iterator = clients.iterator();
			while(iterator.hasNext()) {
				Client client = iterator.next();
				client.socket.close();
				iterator.remove();
			}
			// 서버 소켓 객체 닫기
			if(serverSocket != null && !serverSocket.isClosed()) serverSocket.close();
			
			// 쓰레드 풀 종료하기
			if(threadPool != null && !threadPool.isShutdown()) threadPool.shutdown();
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	// UI를 생성하고 실질적으로 프로그램을 작동시키는 메소드입니다.
	@Override
	public void start(Stage primaryStage) {
		BorderPane root = new BorderPane();
		root.setPadding(new Insets(5));
		
		MenuBar menuBar = new MenuBar();
		Menu menuFile = new Menu("File");
		MenuItem menuItemAddress = new MenuItem("Address");
		menuBar.getMenus().add(menuFile);
		menuFile.getItems().add(menuItemAddress);
		root.setTop(menuBar);		
		
		TextArea textArea = new TextArea();
		textArea.setEditable(false);
		textArea.setFont(new Font("나눔고딕",15));
		root.setCenter(textArea);
		
		Button toggleButton = new Button("시작하기");
		toggleButton.setMaxWidth(Double.MAX_VALUE);
		BorderPane.setMargin(toggleButton, new Insets(1,0,0,0));
		root.setBottom(toggleButton);
		
		String IP = "127.0.0.1";
		int port = 9876;
		
		toggleButton.setOnAction(event -> {
			if(toggleButton.getText().equals("시작하기")) {
				startServer(IP, port);
				Platform.runLater(() -> {
					String message = String.format("[서버 시작]\n", IP, port);
					textArea.appendText(message);
					toggleButton.setText("종료하기");
				});
			} else {
				stopServer();
				Platform.runLater(() -> {
					String message = String.format("[서버 종료]\n", IP, port);
					textArea.appendText(message);
					toggleButton.setText("시작하기");
				});
			}
		});
		
		Scene scene = new Scene(root,400,400);
		primaryStage.setTitle("[채팅서버]");
		primaryStage.setOnCloseRequest(event->stopServer());
		primaryStage.setScene(scene);
		primaryStage.show();
	}

	
	//프로그램의 진입점입니다.
	public static void main(String[] args) {
		launch(args);
	}
}
