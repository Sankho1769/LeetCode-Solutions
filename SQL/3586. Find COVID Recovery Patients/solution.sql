SELECT patient_id, patient_name
FROM Patients
WHERE recovery_date IS NOT NULL AND recovery_date >= diagnosis_date;
