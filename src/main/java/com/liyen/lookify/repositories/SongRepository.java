package com.liyen.lookify.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.liyen.lookify.models.Song;

public interface SongRepository extends CrudRepository<Song,Long> {
    // this method retrieves all the songs from the database
    List<Song> findAll();
    // this method finds songs with artist name containing the search string
    List<Song> findByArtistContaining(String search);
    // this method returns top 10 ratings
    List<Song> findTop10ByOrderByRatingDesc();
    // this method counts how many titles contain a certain string
//    Long countByTitleContaining(String search);
    // this method deletes a book that starts with a specific title
//    Long deleteByTitleStartingWith(String search);


}
