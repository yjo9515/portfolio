package address.model;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * 연락처 리스트를 감싸는 헬퍼 클래스
 * XML로 저장하는 데 사용된다. 
 * **/
// XmlRootElement는 상위 엘리멘트의 이름을 정의한다.
@XmlRootElement(name = "persons")
public class PersonListWrapper {
	private List<Person> persons;
	
	//XmlElement는 엘리먼트에 선택적인 이름을 정의 할 수 있다.
	@XmlElement(name ="person")
	public List<Person> getPersons(){return persons;}
	
	public void setPersons(List<Person> persons) { this.persons = persons; }
}

/**
 * JAXB는 @XmlRootElement 어노테이션이 붙여서 최상위 클래스가 되어야 한다.
 * personDate는 ObserableList 이기 때문에 어느 어노테이션도 붙일 수 없습니다.
 * 그렇기에 다른 클래스를 만들어서 XML로 저장하기 위해 연락처 리스트를 담는데만 사용하였습니다.
 * **/
 