package address.model;

import java.time.LocalDate;

import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import address.util.LocalDateAdapter;
import javafx.beans.property.IntegerProperty;
import javafx.beans.property.ObjectProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleObjectProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

/*
 * 연락처 모델 클래스
 * 
 * @author Marco Jakob
 */

public class Person {
	private final StringProperty firstName;
	private final StringProperty lastName;
	private final StringProperty street;
	private final IntegerProperty postalCode;
	private final StringProperty city;
	private final ObjectProperty<LocalDate> birthday;
	
	
	/**
	 * 디폴트 생성자
	 */
	public Person() {
		this(null, null);
	}
	
	/* *
	 * 데이터를 초기화하는 생성자
	 * 
	 * @param firstName
	 * @param lastName
	 * */
	public Person(String firstName, String lastName) {
		this.firstName = new SimpleStringProperty(firstName);
		this.lastName = new SimpleStringProperty(lastName);
		
		// 테스트를 위해 초기화하는 더미 데이터
		this.street = new SimpleStringProperty("1");
		this.postalCode = new SimpleIntegerProperty(2);
		this.city = new SimpleStringProperty("3");
		this.birthday = new SimpleObjectProperty<LocalDate>(LocalDate.of(1998, 12, 30));			
	}

	/*
	 * Property Type은 Get은 자동적으로 생산 되지만 [Object] 형식은 제외
	 * Set은 자동 생산이 되지 않는다. 
	 * 
	 * // 속성을 저장할 변수 정의 
	 * private DoubleProperty amountDue = new SimpleDoubleProperty (); 
	 * // 속성 값에 대한 getter 정의 
     * public final double getAmountDue () {return amountDue.get ();} 
     * // 속성 값에 대한 setter 정의 
     * public final void setAmountDue (double value) {amountDue.set (value);} 
     * // 속성 자체에 대한 게터 정의 
     * public DoubleProperty amountDueProperty () {return amountDue;} 
	 * */
	
	public String getFirstName() {return firstName.get();}
	public void setFirstName(String firstName) {this.firstName.set(firstName);}
	public StringProperty firstNameProperty() {return firstName;}
	
	public String getLastName() {return lastName.get();}
	public void setLastName(String lastName) {this.lastName.set(lastName);}
	public StringProperty lastNameProperty() {return lastName;}
	
	public String getStreet() {return street.get();}
	public void setStreet(String street) {this.street.set(street);}
	public StringProperty streetProperty() {return street;}
	
	public int getPostalCode() {return postalCode.get();}
	public void setPostalCode(int postalCode) {this.postalCode.set(postalCode);}
	public IntegerProperty postalCodeProperty() {return postalCode;}
	
	public String getCity() {return city.get();}
	public void setcity(String city) {this.city.set(city);}
	public StringProperty cityProperty() {return city;}
	
	@XmlJavaTypeAdapter(LocalDateAdapter.class)
	public LocalDate getBirthday() {return birthday.get();}
	public void setBirthday(LocalDate birthday) {this.birthday.set(birthday);}
	public ObjectProperty<LocalDate> birthdayProperty() {return birthday;}
	
	
}
