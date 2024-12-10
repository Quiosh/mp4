package model;

public class User {
    private String username;
    private String role; 

    public User(String username, String role) {
        this.username = username;
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public String getRole() {
        return role;
    }

    public static User authenticate(String username, String password) {
        if ("admin".equals(username) && "admin123".equals(password)) {
            return new User(username, "admin");
        } else if ("guest".equals(username) && "guest123".equals(password)) {
            return new User(username, "guest");
        } else {
            return null;
        }
    }
}