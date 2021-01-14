package address.view;

import address.MainApp;
import address.model.Person;
import address.util.DateUtil;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;

public class PersonOverviewController {
	@FXML TableView<Person> personTable;
	@FXML TableColumn<Person, String> firstNameColumn;
	@FXML TableColumn<Person, String> lastNameColumn;
    @FXML private Label firstNameLabel;
    @FXML private Label lastNameLabel;
    @FXML private Label streetLabel;
    @FXML private Label postalCodeLabel;
    @FXML private Label cityLabel;
    @FXML private Label birthdayLabel;
    
    // 메인 어플리케이션 참조
    private MainApp mainApp;
    
    /*
     * 생성자
     * initialize() 메서드 이전에 호출된다.
     * */
    public PersonOverviewController() {}
    
    /*
     * 컨트롤러 클래스를 초기화한다.
     * fxml 파일이 로드되고 나서 자동으로 호출된다.
     * */
    @FXML
    private void initialize() {
    	// 연락처 테이블의 두 열을 초기화 한다.
    	firstNameColumn.setCellValueFactory(cellData->cellData.getValue().firstNameProperty());
    	lastNameColumn.setCellValueFactory(cellData->cellData.getValue().lastNameProperty());
    /** 
     * 테이블 선택 감지하기 Listen
     * 사용자가 연락처를 선택할 때 이를 알아내려면 그 변화를 감지해야 합니다.
     * JavaFX에는 [ChangeListener]라는 인터페이스가 있으며, 
     * 여기에 [changed(...)] 라는 메서드가 있습니다.
     * 파라미터는 [ observable  oldValue  newValue ]
     * lambda 형식으로 작성하면 다음과 같습니다.
     * **/
    	// 연락처 정보를 지운다.
    	showPersonDetails(null);
    	
    	//선택을 감지하고 그 때마다 연락처의 자세한 정보를 보여준다.
		personTable.getSelectionModel().selectedItemProperty()
				.addListener((obserVable, oldValue, newValue) -> showPersonDetails(newValue));
    }

    
    /** * * * * * * * * * * * * * * * * * * * * * * *
     * 참조를 다시 유지하기 위해 메인 어플리케이션을 호출한다.	 	*
     * 											 	*
     * @param mainApp							 	*
     * * * * * * * * * * * * * * * * * * * * * * * **/
    public void setMainApp(MainApp mainApp) {
		this.mainApp = mainApp;
		//테이블에 observable 리스ㅡ 데이터를 추가한다.
		personTable.setItems(mainApp.getPersonData());
    }
    
    /** * * * * * * * * * * * * * * * * * * * * * * * * *
     * 연락처의 자세한 정보를 보여주기 위해 뫃든 텍스트 필드를 채운다.		*
     * 만일 person이 null이면 모든 텍스트 필드가 지워진다.			*
     * 												 	*
     * @param person the person or null					*
     * * * * * * * * * * * * * * * * * * * * * * * * * **/
    private void showPersonDetails(Person person) {
		if (person != null) {
    		// person 객체로 label에 정보를 채운다.
			firstNameLabel.setText(person.getFirstName());
			lastNameLabel.setText(person.getLastName());
			streetLabel.setText(person.getStreet());
			postalCodeLabel.setText(Integer.toString(person.getPostalCode()));
			cityLabel.setText(person.getCity());
			birthdayLabel.setText(DateUtil.format(person.getBirthday()));
			// TODO: 생일은 String으로 변환해야 한다!
			// birthdayLabel.setText(...);
    	} else {
    		// person이 null이면 모든 텍스트를 지운다.
    		firstNameLabel.setText("");
    		lastNameLabel.setText("");
    		streetLabel.setText("");
    		postalCodeLabel.setText("");
    		cityLabel.setText("");
    		birthdayLabel.setText("");
    	}
    }
    
    /** 
     * 사용자가 삭제 버튼을 클릭하면 호출된다.
     * **/
    @FXML
    private void handleDeletePerson() {
    	/**
    	 * int selectedIndex는 personTable에 마우스로 선택된 정보의 index를 가져온다.
    	 * **/
    	int selectedIndex = personTable.getSelectionModel().getSelectedIndex();
    	if(selectedIndex >= 0) {
    		personTable.getItems().remove(selectedIndex);  
    	} else {
    		/** 
    		 * getSelectedIndex() 메서드는 아무것도 선택 되지 않았을 경우 -1을 반환한다.
    		 * 이럴대 삭제 버튼을 누를 경우 ArrayIndexOutOfBoundsException 예외가 발생한다.
    		 * AlertType(다이얼 로그)은 https://code.makery.ch/blog/javafx-dialogs-official/ 을 참고하자
    		 * **/
    		Alert alert = new Alert(AlertType.WARNING);
    		alert.initOwner(mainApp.getPrimaryStage());
            alert.setTitle("No Selection");
            alert.setHeaderText("No Person Selected");
            alert.setContentText("Please select a person in the table.\n"+
            "selectedIndex : "+selectedIndex);
            
            alert.showAndWait();
    	}
    }
    
    /** 
     * 사용자가 new 버튼을 클릭할 때 호출된다.
     * 새로운 연락처 정보를 넣기 위해 다이얼로그를 연다.
     * **/
    @FXML
    private void handleNewPerson() {
    	Person tempPerson = new Person();
    	boolean okClicked = mainApp.showPersonEditDialog(tempPerson);
    	if(okClicked) {
    		mainApp.getPersonData().add(tempPerson);
    	}
    }
    /**
     * 사용자가 edit 버튼을 클릭할 때 호출된다.
     * 선택한 연락처 정보를 변경하기 위해 다이얼로그를 연다.
     * **/
    @FXML
    private void handleEditPerson() {
    	Person selectedPerson = personTable.getSelectionModel().getSelectedItem();
    	if(selectedPerson != null) {
    		boolean okClicked = mainApp.showPersonEditDialog(selectedPerson);
    		if (okClicked) {
    			showPersonDetails(selectedPerson);
    		}
    	} else {
    		// 아무것도 하지 않는다.
    		Alert alert = new Alert(AlertType.WARNING);
            alert.initOwner(mainApp.getPrimaryStage());
            alert.setTitle("No Selection");
            alert.setHeaderText("No Person Selected");
            alert.setContentText("Please select a person in the table.");

            alert.showAndWait();
    		
    	}
    }

	public void setMain(EventHandler<ActionEvent> eventHandler) {
		this.mainApp = mainApp;
		//테이블에 observable 리스ㅡ 데이터를 추가한다.
		personTable.setItems(mainApp.getPersonData());
		
	}
}
