-- Corporate Social Responsibility (CSR) Management
-- This SQL script creates the necessary tables for managing CSR initiatives.

CREATE TABLE csr_projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(255) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE,
    budget DECIMAL(15,2)
);

CREATE TABLE stakeholders (
    stakeholder_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(100) CHECK (type IN ('NGO', 'Government', 'Community', 'Investor', 'Other'))
);

CREATE TABLE csr_participation (
    project_id INT REFERENCES csr_projects(project_id),
    stakeholder_id INT REFERENCES stakeholders(stakeholder_id),
    contribution TEXT,
    PRIMARY KEY (project_id, stakeholder_id)
);
