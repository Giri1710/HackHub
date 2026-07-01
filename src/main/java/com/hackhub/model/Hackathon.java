package com.hackhub.model;

import java.sql.Date;

public class Hackathon {

    private int hackathonId;
    private String title;
    private String description;
    private String organizer;
    private String location;
    private Date startDate;
    private Date endDate;
    private String status;

    public Hackathon() {
    }

    public int getHackathonId() {
        return hackathonId;
    }

    public void setHackathonId(int hackathonId) {
        this.hackathonId = hackathonId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getOrganizer() {
        return organizer;
    }

    public void setOrganizer(String organizer) {
        this.organizer = organizer;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    private Date registrationDeadline;
    public Date getRegistrationDeadline() {
    return registrationDeadline;
}

public void setRegistrationDeadline(
        Date registrationDeadline) {
    this.registrationDeadline =
            registrationDeadline;
}
private String region;

public String getRegion() {
    return region;
}

public void setRegion(String region) {
    this.region = region;
}
private String registrationLink;

public String getRegistrationLink() {
    return registrationLink;
}

public void setRegistrationLink(String registrationLink) {
    this.registrationLink = registrationLink;
}
}