CREATE TABLE IF NOT EXISTS ts_sheq_candidate (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  opencats_candidate_id INT UNSIGNED NULL,
  candidate_ref VARCHAR(40) NOT NULL,
  popia_consent TINYINT(1) NOT NULL DEFAULT 0,
  consent_date DATETIME NULL,
  consent_purpose VARCHAR(255) NULL,
  disclosure_allowed TINYINT(1) NOT NULL DEFAULT 0,
  disclosure_date DATETIME NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id), UNIQUE KEY uq_candidate_ref (candidate_ref), KEY idx_opencats_candidate (opencats_candidate_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS ts_sheq_client (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  opencats_company_id INT UNSIGNED NULL,
  company_name VARCHAR(255) NOT NULL,
  industry VARCHAR(150) NULL,
  hr_contact VARCHAR(255) NULL,
  hr_email VARCHAR(255) NULL,
  telephone VARCHAR(80) NULL,
  placement_fee DECIMAL(12,2) NULL,
  fee_basis VARCHAR(50) NULL DEFAULT 'once-off',
  guarantee_days INT UNSIGNED NULL,
  agreement_status VARCHAR(50) NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id), KEY idx_company (opencats_company_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS ts_sheq_vacancy (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  opencats_joborder_id INT UNSIGNED NULL,
  client_id INT UNSIGNED NULL,
  assigned_recruiter VARCHAR(255) NULL,
  pipeline_status VARCHAR(60) NOT NULL DEFAULT 'New',
  salary_min DECIMAL(12,2) NULL,
  salary_max DECIMAL(12,2) NULL,
  closing_date DATE NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id), KEY idx_joborder (opencats_joborder_id), KEY idx_client (client_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS ts_sheq_placement (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  candidate_id INT UNSIGNED NULL,
  client_id INT UNSIGNED NULL,
  vacancy_id INT UNSIGNED NULL,
  start_date DATE NULL,
  salary DECIMAL(12,2) NULL,
  fee_excl_vat DECIMAL(12,2) NULL,
  vat_amount DECIMAL(12,2) NULL,
  total_fee DECIMAL(12,2) NULL,
  invoice_number VARCHAR(100) NULL,
  payment_status VARCHAR(50) NOT NULL DEFAULT 'Unpaid',
  guarantee_end_date DATE NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id), KEY idx_candidate (candidate_id), KEY idx_client (client_id), KEY idx_vacancy (vacancy_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS ts_sheq_audit (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id INT UNSIGNED NULL,
  action VARCHAR(80) NOT NULL,
  entity_type VARCHAR(80) NOT NULL,
  entity_id BIGINT UNSIGNED NULL,
  details TEXT NULL,
  ip_address VARCHAR(45) NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id), KEY idx_entity (entity_type, entity_id), KEY idx_created (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
