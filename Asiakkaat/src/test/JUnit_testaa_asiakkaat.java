package test;

import static org.junit.jupiter.api.Assertions.*;
import java.util.ArrayList;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;

import model.Asiakas;
import model.dao.Dao;

@TestMethodOrder(OrderAnnotation.class)

class JUnit_testaa_asiakkaat {

	@Test
	@Order(1)
	public void testPoistaKaikkiAsiakkaat() {
		Dao dao = new Dao();
		dao.poistaKaikkiAsiakkaat("nimda");
		ArrayList<Asiakas> asiakkaat = dao.listaaAsiakkaat();
		assertEquals(0, asiakkaat.size());
	}
	
	@Test
	@Order(2) 
	public void testLisaaAsiakas() {		
		Dao dao = new Dao();
		Asiakas asiakas_1 = new Asiakas(0, "Riitta", "Kankainen", "12346", "riitta@gmail.com");
		Asiakas asiakas_2 = new Asiakas(0, "Kalle", "Niemi", "123467", "kalle@gmail.com");
		System.out.println(asiakas_1.toString());
		System.out.println(asiakas_2.toString());
		
		assertEquals(true, dao.lisaaAsiakas(asiakas_1));
		assertEquals(true, dao.lisaaAsiakas(asiakas_2));
	}
	
	@Test
	@Order(3) 
	public void testMuutaAsiakas() {
		//Muutetaan yhtä autoa
		Dao dao = new Dao();
		Asiakas muutettava = dao.etsiAsiakas(1);
		muutettava.setAsiakas_id(1);
		muutettava.setEtunimi("Heikki");
		muutettava.setSukunimi("Virta");
		muutettava.setPuhelin("12345");
		muutettava.setSposti("heikki@gmail.com");
		dao.muutaAsiakas(muutettava, 1);	
		assertEquals("Heikki", dao.etsiAsiakas(1).getEtunimi());
		assertEquals("Virta", dao.etsiAsiakas(1).getSukunimi());
		assertEquals("12345", dao.etsiAsiakas(1).getPuhelin());
		assertEquals("heikki@gmail.com", dao.etsiAsiakas(1).getSposti());
	}
	
	@Test
	@Order(4) 
	public void testPoistaAsiakas() {
		Dao dao = new Dao();
		dao.poistaAsiakas("1");
		assertEquals(null, dao.etsiAsiakas(1));
	}
	
	

}
