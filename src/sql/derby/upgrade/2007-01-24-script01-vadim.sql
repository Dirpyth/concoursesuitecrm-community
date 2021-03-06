CREATE TABLE lookup_report_type (
  code INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  description VARCHAR(300) NOT NULL,
  default_item CHAR(1) DEFAULT '0',
  "level" INT DEFAULT 0,
  enabled CHAR(1) DEFAULT '1',
  constant INT DEFAULT 1 NOT NULL,
  entered TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);
ALTER TABLE report_queue ADD COLUMN output_type INT REFERENCES lookup_report_type(code);
ALTER TABLE report_queue ADD COLUMN email CHAR(1) DEFAULT '0';
