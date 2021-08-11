package com.liyen.lookify.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.liyen.lookify.models.Song;
import com.liyen.lookify.repositories.SongRepository;

@Service
public class SongService {
	private final SongRepository songRepository;
	
	public SongService(SongRepository songRepository) {
		this.songRepository = songRepository;
	}
	
	// returns all songs		
	public List<Song> allSongs() {
		return songRepository.findAll();
	}
	
	// create a song
	public Song createSong(Song song) {
		return songRepository.save(song);
	}
	
	// show song by id
	public Song findSong(Long id) {
		Optional<Song> optionalSong = songRepository.findById(id);
		if(optionalSong.isPresent()) {
			return optionalSong.get();
		} else {
			return null;
		}
	}
	
	// update by id with new data
	public Song updateSong(Long id, Song newSong) {
		Song song = findSong(id);
		song.setTitle(newSong.getTitle());
		song.setArtist(newSong.getArtist());
		song.setRating(newSong.getRating());
		return songRepository.save(song);
	}
	
	// delete by id
	public void deleteSong(Long id) {
		songRepository.deleteById(id);
	}
	
	// search by artist name containing search term
	public List<Song> displayByArtist(String search) {
		return songRepository.findByArtistContaining(search);
	}
	
	// top 10 songs by rating
	public List<Song> showTopTenSongs(){
		return songRepository.findTop10ByOrderByRatingDesc();
	}
	
}
