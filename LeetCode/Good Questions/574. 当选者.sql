SELECT Name
FROM Candidate
WHERE id = (SELECT CandidateId
            FROM Vote
            GROUP BY 1
            ORDER BY COUNT(id) DESC
            LIMIT 1);
