# AppointmentApp
uncompleted project from 2pm 7/10 to 8pm 8/10 (30 hours)

The project contains Servlets and jsp pages
1)	Index.html
Is the main page has to links one for doctors and another for patients link to registration page of doctors or patiens dependent on what we choose.

First will present doctors
1)	DoctorRegister.jsp
page splitted into two parts you can register a new doctor to app or if you have account you can login directly,
if register this app will take data from you and go to DoctorRegister.java servlet to insert data into database and go back into DoctorRegister.jsp,
if login this app will take data and check for username and password if correct will go to PatientList.jsp witch show list of patient reserve for him this day and if not correct will go back to login page.

Second will present patients
1)	PatientsRegister.jsp
page splitted into two parts you can register a new patient to app or if you have account you can login directly,
if register this app will take data from you and go to PatientRegister.java servlet to insert data into database and go back into PatientRegister.jsp,
if login this app will take data and check for username and password if correct will go to ReserveAppointment.jsp witch show list of doctor to select witch doctor he want to reserve and list appear doctors with their specialization (for example) if patient choose orthopedist then app will go to AppoimentList.jsp to show list of available appointment (Assuming doctor work time from 1pm to 10pm only and every patient have one hour) when he click on the button in front of this appointment this submission will reserve this appointment for this patient auto and delete this appointment from list and go back to the ReserveAppointment.jsp page again 
 if not correct will go back to login page.

Application files include database (MySQL) include some fake data.
Note : this app store username as attribute in session for this login person.
