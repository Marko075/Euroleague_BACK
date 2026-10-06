package com.takima.backskeleton.services;

import com.takima.backskeleton.DAO.ClubDao;
import com.takima.backskeleton.models.Club;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ClubService {
    private final ClubDao clubDao;

    public ClubService(ClubDao clubDao) {
        this.clubDao = clubDao;
    }

    public List<Club> findAll() {
        return clubDao.findAll();
    }
}

