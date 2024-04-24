CREATE TABLE dw_hospital.Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Address VARCHAR(255),
    Phone VARCHAR(15)
);

CREATE TABLE dw_hospital.Admissions (
    AdmissionID INT PRIMARY KEY,
    PatientID INT,
    AdmissionDate DATETIME,
    DischargeDate DATETIME,
    AdmissionReason VARCHAR(255),
    AdmissionType VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);


CREATE TABLE dw_hospital.Doctors (
    DoctorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialization VARCHAR(100),
    Department VARCHAR(100),
    Phone VARCHAR(15)
);


CREATE TABLE dw_hospital.Nurses (
    NurseID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(100),
    Phone VARCHAR(15)
);


CREATE TABLE dw_hospital.MedicalRecords (
    RecordID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    NurseID INT,
    AdmissionID INT,
    Diagnosis VARCHAR(255),
    TreatmentPlan TEXT,
    TestResults TEXT,
    DateRecorded DATETIME,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (NurseID) REFERENCES Nurses(NurseID),
    FOREIGN KEY (AdmissionID) REFERENCES Admissions(AdmissionID)
);


CREATE TABLE dw_hospital.Medications (
    MedicationID INT PRIMARY KEY,
    MedicationName VARCHAR(100),
    Description TEXT,
    Manufacturer VARCHAR(100),
    Dosage VARCHAR(50),
    Cost DECIMAL(10, 2)
);


CREATE TABLE dw_hospital.Prescriptions (
    PrescriptionID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    MedicationID INT,
    PrescriptionDate DATETIME,
    DosageInstructions TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (MedicationID) REFERENCES Medications(MedicationID)
);


CREATE TABLE Tests (
    TestID INT PRIMARY KEY,
    TestName VARCHAR(100),
    Description TEXT,
    Cost DECIMAL(10, 2)
);


CREATE TABLE TestOrders (
    OrderID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    TestID INT,
    OrderDate DATETIME,
    Status VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (TestID) REFERENCES Tests(TestID)
);


CREATE TABLE Billing (
    BillID INT PRIMARY KEY,
    PatientID INT,
    AdmissionID INT,
    TotalAmount DECIMAL(10, 2),
    PaymentStatus VARCHAR(50),
    BillingDate DATETIME,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (AdmissionID) REFERENCES Admissions(AdmissionID)
);


CREATE TABLE StaffSchedule (
    ScheduleID INT PRIMARY KEY,
    StaffID INT,
    ShiftStart DATETIME,
    ShiftEnd DATETIME,
    ShiftType VARCHAR(50),
    FOREIGN KEY (StaffID) REFERENCES Doctors(DoctorID) ON DELETE CASCADE,
    FOREIGN KEY (StaffID) REFERENCES Nurses(NurseID) ON DELETE CASCADE
);


CREATE TABLE Inventory (
    ItemID INT PRIMARY KEY,
    ItemName VARCHAR(100),
    Description TEXT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2)
);
