CREATE TABLE user_metrics (
    id UNIQUEIDENTIFIER PRIMARY KEY,
    user_id UNIQUEIDENTIFIER NOT NULL,
    session_id UNIQUEIDENTIFIER NOT NULL,
    timestamp DATETIME NOT NULL,
    metric_type VARCHAR(50) NOT NULL,
    metric_value NVARCHAR(MAX) NOT NULL, -- Use NVARCHAR(MAX) for JSON data
    additional_metadata NVARCHAR(MAX)    -- Use NVARCHAR(MAX) for JSON data
);

CREATE INDEX idx_user_id ON user_metrics(user_id);
CREATE INDEX idx_session_id ON user_metrics(session_id);
CREATE INDEX idx_timestamp ON user_metrics(timestamp);
