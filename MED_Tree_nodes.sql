✅ Problem Summary
Classify each node in a tree as one of the following:
Root → Node with no parent
Inner → Node that has both a parent and at least one child
Leaf → Node with a parent but no children
.....................................................................................................................................................
✅ Table Schema
Tree
Column	Type
id	INT (Primary Key)
p_id	INT (Parent Node ID
.....................................................................................................................................................
🎯 Classification Rules
Root → p_id IS NULL
Inner → Node appears as a parent of another node
Leaf → Node does not appear as a parent
.....................................................................................................................................................
✅ Final

SELECT
    t.id,
    CASE
        WHEN t.p_id IS NULL THEN 'Root'
        WHEN COUNT(c.id) > 0 THEN 'Inner'
        ELSE 'Leaf'
    END AS type
FROM Tree t
LEFT JOIN Tree c
    ON t.id = c.p_id
GROUP BY t.id, t.p_id;
