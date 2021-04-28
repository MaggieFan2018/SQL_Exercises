SELECT id, CASE WHEN p_id IS NOT NULL AND id IN (SELECT id FROM tree WHERE id IN (SELECT p_id FROM tree)) THEN 'Inner'
                WHEN p_id IS NULL THEN 'Root'
                ELSE 'Leaf'
           END AS Type
FROM tree;
