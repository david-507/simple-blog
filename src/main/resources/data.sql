INSERT INTO users ( id,
        city,
        created,
        email,
        name,
        password) VALUES
(80000000, 'Tarragona', CURRENT_TIMESTAMP(), 'test1@localhost.com', 'test1', '$2a$10$lL/vYRg/SCjAXDWUdNEbZOdK5qKH7YSNnsLuGlIZlEpyjE7.vOl7G'),
(80000001, 'Girona', CURRENT_TIMESTAMP(), 'test2@localhost.com', 'test2', '$2a$10$vw31ff.u4.BScboXRixv0eewf9eabDLh4lWS2YlMUoNS/hr/8fB/O');

-- test1 -> secret
-- test2 -> password