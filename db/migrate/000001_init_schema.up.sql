CREATE TABLE accounts (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    owner VARCHAR(255) NOT NULL,
    balance BIGINT NOT NULL,
    currency VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE entries (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    account_id BIGINT,
    amount BIGINT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE transfers (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    from_account_id BIGINT,
    to_account_id BIGINT,
    amount BIGINT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_owner ON accounts (owner);
CREATE INDEX idx_account_id ON entries (account_id);
CREATE INDEX idx_from_account_id ON transfers (from_account_id);
CREATE INDEX idx_to_account_id ON transfers (to_account_id);
CREATE INDEX idx_from_to_account ON transfers (from_account_id, to_account_id);
ALTER TABLE
    entries
ADD
    FOREIGN KEY (account_id) REFERENCES accounts (id);
ALTER TABLE
    transfers
ADD
    FOREIGN KEY (from_account_id) REFERENCES accounts (id);
ALTER TABLE
    transfers
ADD
    FOREIGN KEY (to_account_id) REFERENCES accounts (id);
ALTER TABLE
    entries
MODIFY
    COLUMN account_id BIGINT NOT NULL;
ALTER TABLE
    transfers
MODIFY
    COLUMN from_account_id BIGINT NOT NULL;
ALTER TABLE
    transfers
MODIFY
    COLUMN to_account_id BIGINT NOT NULL;