-- ----------------------------------------------------------------------------
--  Apache Derby Table Creation
--
--  @author     Andrei I. Holub
--  @created    August 31, 2006
--  @version    $Id:$
-- ----------------------------------------------------------------------------

CREATE TABLE timesheet (
  timesheet_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(user_id),
  entry_date TIMESTAMP NOT NULL,
  hours FLOAT NOT NULL DEFAULT 0,
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  verified CHAR(1) NOT NULL DEFAULT '0',
  approved CHAR(1) NOT NULL DEFAULT '0',
  approved_by INTEGER REFERENCES users(user_id),
  available CHAR(1) NOT NULL DEFAULT '1',
  unavailable CHAR(1) NOT NULL DEFAULT '0',
  vacation CHAR(1) NOT NULL DEFAULT '0',
  vacation_approved CHAR(1) NOT NULL DEFAULT '0',
  entered TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  enteredBy INTEGER NOT NULL REFERENCES users(user_id),
  modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modifiedBy INTEGER NOT NULL REFERENCES users(user_id)
);

CREATE TABLE timesheet_projects (
  id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  timesheet_id INTEGER NOT NULL REFERENCES timesheet(timesheet_id),
  project_id INTEGER REFERENCES projects(project_id),
  hours FLOAT NOT NULL DEFAULT 0,
  start_time TIMESTAMP,
  end_time TIMESTAMP
);


