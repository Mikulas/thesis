CREATE TABLE article
(
    id bigint PRIMARY KEY AUTO_INCREMENT,
    title text NOT NULL,
    body text NOT NULL,
    created_at timestamp DEFAULT now() NOT NULL,
    updated_at timestamp DEFAULT now() NOT NULL
);
