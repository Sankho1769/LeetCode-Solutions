SELECT sample_id, dna_sequence, species
FROM Samples
WHERE dna_sequence REGEXP 'ATG';
