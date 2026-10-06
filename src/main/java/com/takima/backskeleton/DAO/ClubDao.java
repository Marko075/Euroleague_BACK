package com.takima.backskeleton.DAO;

import com.takima.backskeleton.models.Club;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClubDao extends JpaRepository<Club, Long> {
}