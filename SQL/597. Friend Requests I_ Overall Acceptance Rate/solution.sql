SELECT ROUND(
    IFNULL((SELECT COUNT(*) FROM (SELECT DISTINCT requester_id, accepter_id FROM RequestAccepted) r)
           / NULLIF((SELECT COUNT(*) FROM (SELECT DISTINCT sender_id, send_to_id FROM FriendRequest) f), 0), 0), 2
) AS accept_rate;
