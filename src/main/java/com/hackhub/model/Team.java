package com.hackhub.model;

public class Team {

    private int teamId;
    private String teamName;
    private int hackathonId;
    private int leaderId;
    private String hackathonName;
    private String leaderName;

    public Team() {}

    public int getTeamId() {
        return teamId;
    }

    public void setTeamId(int teamId) {
        this.teamId = teamId;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public int getHackathonId() {
        return hackathonId;
    }

    public void setHackathonId(int hackathonId) {
        this.hackathonId = hackathonId;
    }

    public int getLeaderId() {
        return leaderId;
    }

    public void setLeaderId(int leaderId) {
        this.leaderId = leaderId;
    }
    
    public String getHackathonName() {
    return hackathonName;
}

public void setHackathonName(String hackathonName) {
    this.hackathonName = hackathonName;
}

public String getLeaderName() {
    return leaderName;
}

public void setLeaderName(String leaderName) {
    this.leaderName = leaderName;
}
}