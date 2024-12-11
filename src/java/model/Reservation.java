package model;

import java.util.Date;

public class Reservation {
    private String name;
    private Date date;
    private String time;
    private int numberOfGuests;
    private int id;

    public Reservation(int id, String name, Date date, String time, int numberOfGuests) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.time = time;
        this.numberOfGuests = numberOfGuests;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Date getDate() {
        return date;
    }

    public String getTime() {
        return time;
    }

    public int getNumberOfGuests() {
        return numberOfGuests;
    }
}