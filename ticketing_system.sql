CREATE DATABASE ticketing_system;
USE ticketing_system;

CREATE TABLE users (
	user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role ENUM('Employee', 'IT_Technician', 'Admin') DEFAULT 'Employee',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE tickets (
	ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    
    status ENUM('open', 'in_progress', 'resolved', 'closed') DEFAULT 'open',
    priority ENUM('low', 'medium', 'high', 'critical') DEFAULT 'medium',
    
    created_by INT NOT NULL,
    assigned_to INT,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (created_by) REFERENCES users(user_id),
    FOREIGN KEY (assigned_to) REFERENCES users(user_id)

);
    
    
 CREATE TABLE comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    ticket_id INT NOT NULL,
    user_id INT NOT NULL,
    comment_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);   


INSERT INTO users (full_name, email, role)
VALUES
('Alice Johnson', 'alice@example.com', 'Employee'),
('Bob Smith', 'bob@example.com', 'IT_Technician'),
('Carol White', 'carol@example.com', 'Admin');


INSERT INTO tickets (
    title,
    description,
    priority,
    created_by,
    assigned_to
)
VALUES
(
    'Cannot login',
    'I forgot my password and reset is not working.',
    'high',
    1,
    2
),
(
    'Laptop wont turn on',
    'Spilled coffee on keyboard, screen black.',
    'medium',
    1,
    2
),
(
    'Blue screen on startup',
    'Laptop crashes with blue screen after login.',
    'high',
    1,
    2
),
(
    'Password reset issue',
    'Password reset email never arrives.',
    'medium',
    1,
    3
);


INSERT INTO comments (
    ticket_id,
    user_id,
    comment_text
)
VALUES
(
    1,
    2,
    'We are investigating the issue.'
),
(
    1,
    1,
    'Thank you for the quick response.'
);


    
    
