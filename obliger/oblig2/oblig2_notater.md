**Owners**
- Multiple charging network owners
- Owners can own multiple charging network franchises
- Ownership start is important

**EV charging network owner**
	Attributes: id, first name, last name, date of birth, age, personal no, phone no, email, address, owned charge points, status. 

**EV charging network member**
	id, first name, last name, date of birth, age, personal no, phone no, email, address including city and postal code, member type, start date, status.

**Employee**
	id, first name, last name, date of birth, age, personal no, phone no, email, address including city and postal code, employee role, pay rate, the charge points where they work, start date, status.

**EV charging point network franchise**
	id, starting date, status.

**charge_point** 
	branch id, address, phone no, employee, charger_type, owner.

**ev_chargers**
	id, name, brand, type, price, operating temperature.

**slow chargers**
	charging protocol.

**fast chargers**
	maximum load.

**charger machines in various charge points**
	id, installation date, last maintenance date.

**electric vehicles**
	id, make, model, manufacture date, used charging protocol



In order to not have to repeat common attributes for owner, member and employees, I will use specialisation {mandatory, or}. Same is done to charger types so that I can get two subclasses.
Before generalization, it looks like this:
![[Pasted image 20230219125036.png]]
After generalization of person:
![[Pasted image 20230219131343.png]]
